<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller
{
    public $data = [];
    public $user;
    public $user_id;

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
        $this->load->library('ion_auth');
        $this->user = $this->ion_auth->user()->row();
        $this->user_id = $this->user->id;

        $logged = $this->ion_auth->logged_in();
        $in_group = $this->ion_auth->in_group(2);  
       
		if (!$logged)
		{
			redirect('auth/login', 'refresh');
        }
    }
    
    public function index()
    {
        $hobbies = $this->get_hobbies();
        $friends = $this->mark_friends();
        
        $data = [
            "name"     => $this->user->first_name,
            "birthday" => $this->user->birthday,
            "hobbies"  => $hobbies,
            "friends"  => $friends,
            "path"     => $_SERVER['SERVER_NAME']
        ];

        $this->load->view("users/shared/header");
        $this->load->view("users/index",$data);
        $this->load->view("users/shared/footer");
    }

    public function get_hobbies(){
        $query  = " SELECT uh.user_id, uh.hobby_id, hb.name FROM user_hobbies as uh " ;
        $query .= "INNER JOIN hobbies as hb ON uh.hobby_id = hb.id WHERE uh.user_id ="; 
        $query .= " ".$this->user_id." ";
        $hobbies = $this->db->query($query)->result();
        return $hobbies;
    }

    public function add_friend(){
        $id = $this->input->get('id');
        $fr_ids = [];
        $friends = $this->get_friends(false);
        foreach ($friends as $fr) {
            $fr_ids[] = $fr->id;
        }
        if(in_array($id, $fr_ids)){
            echo "Already friends";
        }else{

            if(count($fr_ids) >= 5){
                $query  = " DELETE FROM friends WHERE user_id = ".$this->user_id." ";
                $query .= " AND friend_id = ".$fr_ids[0]." ";
                $this->db->query($query);
                $this->db->affected_rows();
            }
            $query2 = " INSERT INTO friends (user_id, friend_id) VALUES(".$this->user_id.", $id) ";
            $this->db->query($query2);
            $all_users = $this->mark_friends();
            echo json_encode($all_users);
        }
    }

    public function get_friends($flag=false){
        $fields = $flag ? 'us.id, us.birthday, CONCAT(us.first_name,\' \',us.last_name) as full_name ' : 'us.id, us.birthday';
        $query  = " SELECT $fields FROM users as us "; 
        $query .= " JOIN friends as fr ON us.id = fr.friend_id ";
        $query .= " WHERE fr.user_id = ". $this->user_id." ORDER BY fr.created_on";
        $friends = $this->db->query($query)->result();
        return $friends;
    }

    public function json_friends(){
        echo json_encode($this->get_friends(true));
    }

    public function json_birthdays(){
        $fr_ids = [$this->user_id];
        $query  = " SELECT us.id FROM users as us "; 
        $query .= " JOIN friends as fr ON us.id = fr.friend_id ";
        $query .= " WHERE fr.user_id = ".$this->user_id." ";
        $friends = $this->db->query($query)->result();
        foreach ($friends as $fr) {
            $fr_ids[] = $fr->id;
        } 
        $query2  = " SELECT us.id, us.birthday, CONCAT(us.first_name,' ',us.last_name) as full_name FROM users as us "; 
        $query2 .= " JOIN friends as fr ON us.id = fr.friend_id ";
        $query2 .= " WHERE fr.user_id IN (".implode(', ',$fr_ids).")";
        $query2 .= " AND DATE(us.birthday + INTERVAL (YEAR(NOW()) - YEAR(us.birthday)) YEAR) ";        
        $query2 .= " BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY) GROUP BY us.id";
        $res = $this->db->query($query2)->result();
        echo json_encode($res);
    }

    public function json_potential(){
        $fr_ids = [$this->user_id];
        $query = "SELECT us.id FROM users as us "; 
        $query .= "JOIN friends as fr ON us.id = fr.friend_id ";
        $query .= " WHERE fr.user_id = ".$this->user_id." ";
        $friends = $this->db->query($query)->result();
        foreach ($friends as $fr) {
            $fr_ids[] = $fr->id;
        }
        $hobby_ids = [];
        $query3 = " SELECT hobby_id FROM user_hobbies WHERE user_id=".$this->user_id." ";
        $hobbies = $this->db->query($query3)->result();
        foreach ($hobbies as $hb) {
            $hobby_ids[] = $hb->hobby_id;
        }
        $query2  = "SELECT us.id, us.birthday, CONCAT(us.first_name,' ',us.last_name) as full_name FROM users as us ";
        $query2 .= count($hobby_ids) > 0 ? " JOIN user_hobbies as uh  ON us.id = uh.user_id " : "";
        $query2 .= " WHERE us.id NOT IN (".implode(', ',$fr_ids).")"; 
        $query2 .= count($hobby_ids) > 0 ? " AND uh.hobby_id IN (".implode(', ',$hobby_ids).")" : ""; 
        $query2 .= " AND DATE(us.birthday + INTERVAL (YEAR(NOW()) - YEAR(us.birthday)) YEAR) ";
        $query2 .= " BETWEEN DATE_ADD(CURDATE(), INTERVAL -5 DAY) AND DATE_ADD(CURDATE(), INTERVAL 5 DAY) GROUP BY us.id";

        $res = $this->db->query($query2)->result();
        echo json_encode($res);
    }

    public function upcoming_birthdays(){
        $query  = "SELECT us.id, us.birthday, CONCAT(us.first_name,' ',us.last_name) as full_name FROM users as us ";
        $query .= " WHERE DATE(us.birthday + INTERVAL (YEAR(NOW()) - YEAR(us.birthday)) YEAR) ";
        $query .= " BETWEEN DATE_ADD(CURDATE(), INTERVAL 1 DAY) AND DATE_FORMAT(NOW(),'%Y-12-31')"; 
        $query .= " AND us.id <> $this->user_id ORDER BY MONTH(us.birthday), DAYOFMONTH(us.birthday)";
        
        $res = $this->db->query($query)->result();
        echo json_encode($res);
    }

    public function get_all_users(){
        $query2 = "SELECT id, CONCAT(first_name, ' ', last_name) as full_name FROM users  WHERE id <> ".$this->user_id." ";
        $all_users = $this->db->query($query2)->result();
        return $all_users;
    }

    public function mark_friends(){
        $all_users = $this->get_all_users();
        $friends = $this->get_friends();

        foreach($all_users as $au){
            $is_friend = false;
            foreach ($friends as $fr) {
                if($au->id == $fr->id){
                    $is_friend = true;
                }
            }
            $au->is_friend = $is_friend;
        }
        return $all_users;
    }


















}