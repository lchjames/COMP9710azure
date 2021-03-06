<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$today = date("Y-m-d H:i:s");
$date = "";
$username = "";
$Lusername = "";
$email = "";
$passwd = "";
$Lpasswd = "";
$repasswd = "";
$title = "";
$first_name = "";
$middle_name = "";
$last_name = "";
$fan = "";
$role = "";

$usernameErr = "";
$LusernameErr = "";
$emailErr = "";
$passwdErr = "";
$LpasswdErr = "";
$repasswdErr = "";
$fanErr = "";

$allow_username_to_input = FALSE;
$allow_email_to_input = FALSE;
$allow_passwd_to_input = FALSE;

if (basename($_SERVER['PHP_SELF']) != "index.php" && $_SESSION["loggedin"] != true) {
    header("location: index.php");
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['register_submit'])) {
    $title = $_POST['title'];
    $first_name = $_POST['firstName'];
    $middle_name = $_POST['midName'];
    $last_name = $_POST['lastName'];
    $user_name = $_POST['username'];
    $fan = $_POST['fan'];
    $role = $_POST['role'];
    if ($fan != null) {
        if (include 'DBConnect.php') {
            $vm1 = $conn->query("select max(vm1_port) from users");
            $row = mysqli_fetch_array($vm1);
            $vm1 = $row["max(vm1_port)"] + 1;
//            echo $vm1;
            $vm2 = $conn->query("select max(vm2_port) from users");
            $row = mysqli_fetch_array($vm2);
            $vm2 = $row["max(vm2_port)"] + 1;
//            echo $vm2;
            $sql = "SELECT * FROM `users` WHERE `username` =  '$user_name'";
            $result = $conn->query($sql) or die(mysqli_error());
            if ($result->num_rows == 0) {
                $uploader = $_SESSION["username"];
                $sql = "INSERT INTO `users`( `role_id`, `title`, `first_name`, `middle_name`, `family_name`, `username`, `password`, `FAN`, `creted_date`, `created_by`, `email_address`,`vm1_port`, `vm2_port`) "
                        . "VALUES ('$role','$title','$first_name','$middle_name','$last_name','$user_name',md5('$user_name'),'$fan','$today','$uploader','notset@flinders.edu.au','$vm1','$vm2')";
                if ($conn->query($sql) === FALSE) {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                } else {
                    echo "User " . $user_name . " has been created.";
                }
                $conn->close();
            }
            else{
                echo "User" . $user_name . " exist";
            }
        }
        header("location: editUser.php");
    } else {
        $fanErr = "FAN cannot be empty.";
        header('Location: generateAccount.php');
    }
} elseif ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['login_submit'])) {
    if (empty($_POST["Lusername"])) {
        $LusernameErr = "Username is required";
        $allow_username_to_input = FALSE;
    } else {
        $Lusername = $_POST["Lusername"];
        $allow_username_to_input = TRUE;
    }
    if (empty($_POST["Lpasswd"])) {
        $LpasswdErr = "Password is required";
        $allow_passwd_to_input = FALSE;
    } else {
        $Lpasswd = $_POST["Lpasswd"];
        //$hash = password_hash($Lpasswd, PASSWORD_DEFAULT);
        //echo $hash;
        $allow_passwd_to_input = TRUE;
    }

    if ($allow_username_to_input == TRUE && $allow_passwd_to_input == TRUE) {
        if (include 'DBConnect.php') {
            $sql = "SELECT * FROM users WHERE  username = '$Lusername' && password = md5('$Lpasswd')";
            $result = $conn->query($sql)or die(mysqli_error());
            if ($result === FALSE) {
                echo "Error: " . $sql . "<br>" . $conn->error;
            } elseif ($result->num_rows == 0) {
                $LusernameErr = 'Username or Password Incorrect';
                $LpasswdErr = 'Username or Password Incorrect';
            } elseif ($result->num_rows > 0) {
// Password is correct, so start a new session
                $row = mysqli_fetch_array($result);
// Store data in session variables
                $_SESSION["loggedin"] = true;
                $_SESSION["username"] = $row ['username'];
                $_SESSION["usertype"] = $row ['role_id'];
                $_SESSION["userid"] = $row ['user_id'];
                $_SESSION["load"] = "none";
            }
            if ($conn->query($sql) === FALSE) {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        } else {
            $LusernameErr = "User not exists";
        }
        $conn->close();
        if ($_SESSION["usertype"] == 3) {
            header('Location: user.php');
        } else {
            header('Location: moduleManage.php');
            if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
                // Redirect user to activity page
                if ($_SESSION["usertype"] == 3) {
                    header('Location: user.php');
                } else {
                    header('Location: moduleManage.php');
                }
            }
        }
    }
}
?>

