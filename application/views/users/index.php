    <div class="row">
        <div class="col-md-12">
            <button id="logout" class="btn btn-warning pull-right">Logout</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="jumbotron">
                <h2><?php echo $name; ?></h2>
                <p><?php echo $birthday; ?></p>
                <ul>
                    <?php foreach($hobbies as $hobby): ?>
                        <li data-user="<?= $hobby->user_id; ?>" 
                            data-hobby="<?= $hobby->hobby_id; ?>">
                                <?= $hobby->name; ?>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Action</th>    
                    </tr>
                </thead>
                <tbody id="users_container">
                <?php foreach($friends as $fr): ?>
                    <tr>
                        <td data-id="<?= $fr->id; ?>">
                            <?= $fr->full_name; ?>
                        </td>
                        <td>
                            <?php if($fr->is_friend): ?>
                                <div class="friend">
                                    <img class="img-responsive" src="./assets/img/friend.png" alt="frends">
                                </div>
                            <?php else: ?>
                                <button data-id="<?= $fr->id; ?>" class="btn btn-primary add-friend">Add Friend</button>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="btn-group">
        <button id="all_friends" type="button" class="btn btn-primary">Show All Friends</button>
        <button id="birthdays" type="button" class="btn btn-primary">Show Bithdays</button>
        <button id="potential" type="button" class="btn btn-primary">Show Potential Friends</button>
        <button id="up_bithdays" type="button" class="btn btn-primary">Show Upcoming Bithdays</button>
    </div>
    <div class="row">
        <div class="col-md-4">
            <table class="table" id="bottom_table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Birthday</th>
                    </tr>
                </thead>
                <tbody id="view">

                </tbody>
            </table>
        </div>
    </div>
    
    <script src="./assets/jquery-3.3.1.min.js"></script>
    <script src="./assets/scripts/index.js"></script>
