var $add_friend = $(".add-friend");
var $all_friends = $("#all_friends");
var $birthdays = $("#birthdays");
var $potential = $("#potential");
var $up_bithdays = $("#up_bithdays");
var $logout = $('#logout');
var $view = $("#view");
var $users_container = $("#users_container");
var $bottom_table = $('#bottom_table');

function ajax_table($btn_elem, $tbl_elem, url){
    $btn_elem.click(function(){
        $.ajax({
            type: "GET",
            url: url,
            dataType: "JSON",
            success: function(data){
                var html = '';
                $(data).each(function(i, fr){
                    html += "<tr>";
                    html += "<td>"+fr.full_name+"</td>";
                    html += "<td>"+fr.birthday+"</td>";
                    html += "</tr>";
                });
                $tbl_elem.html(html);
                data.length <= 0 ? $bottom_table.css('display','none') : $bottom_table.css('display','block');
            },
            error: function(err){
                console.error(err);
            }
        });
    });
}
function add_friend(id){
    $.ajax({
        type: "GET",
        url: "/ci_social/users/add_friend?id="+id,
        dataType: "JSON",
        success: function(data){
            var html = '';
            $(data).each(function(i, fr){
                html += "<tr><td data-id="+fr.id+">"+fr.full_name+"</td><td>";
                if(fr.is_friend){
                    html += "<div class='friend'><img class='img-responsive' src='./assets/img/friend.png'></div>";
                }else{
                    html += "<button data-id="+fr.id+" class='btn btn-primary add-friend'>Add Friend</button>";
                }
                html += "</td></tr>";
            });
            $users_container.html(html);
            $all_friends.click()
            
            $('.add-friend').click(function(){
                var id = $(this).data('id');
                add_friend(id);                
            })
            
        },
        error: function(err){
            console.error(err);
        }
    }); 
}

$add_friend.click(function(){
    var id = $(this).data('id');
    add_friend(id);
});

$logout.click(function(){
    window.location.href = "/ci_social/auth/logout";
});

// setInterval(function(){
//     $.ajax({
//         type: "GET",
//         url: "/ci_social/users/online_users",
//         dataType: "JSON",
//         success: function(data){
//             var html = '';
//             $(data).each(function(i, fr){
//                 html += "<tr><td data-id="+fr.id+">"+fr.full_name+"</td><td>";
//                 if(fr.is_friend){
//                     html += "<div class='friend'><img class='img-responsive' src='./assets/img/friend.png'></div>";
//                 }else{
//                     html += "<button data-id="+fr.id+" class='btn btn-primary add-friend'>Add Friend</button>";
//                 }
//                 html += "</td></tr>";
//             });
//             $users_container.html(html);
//             $all_friends.click()
            
//             $('.add-friend').click(function(){
//                 var id = $(this).data('id');
//                 add_friend(id);                
//             })          
//         },
//         error: function(err){
//             console.error(err);
//         }
//     });     
// },60*5*1000);

ajax_table($all_friends, $view, '/ci_social/users/json_friends');
ajax_table($birthdays,   $view, '/ci_social/users/json_birthdays');
ajax_table($potential,   $view, '/ci_social/users/json_potential');
ajax_table($up_bithdays, $view, '/ci_social/users/upcoming_birthdays');