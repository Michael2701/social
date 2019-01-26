# social
db name  : social

admin    : admin@admin.com password
all users: email           12345678

1. All errors (MySQL, PHP) are in application/log/
2. Number of attempts is in application/config/ion_auth.php 
    $config['maximum_login_attempts'] = 5;
3. Login attempts log file  log/
    Functionality written in application/models/ion_auth_model.php
    function is_max_login_attempts_exceeded
4. See all users,create new user/group : 
    Login with admin@admin.com password and go to /auth

Possible improvements
    1. Add manage hobbies option
    2. Implement 'only 5 hobbies' functionality
    3. Show only online users or mark them with icon
    4. Add scrollbar and lazy loading for users list 
