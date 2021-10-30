<?php
include 'topbar.php';
?>
<html>
    <body>
        <h2>Generate Account</h2>
        <h3>Confirm the imported student detail</h3>
        <table>
            <tr>
                <th>Title</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Family Name</th>
                <th>Sex</th>
                <th>Username</th>
                <th>Email</th>
                <th>Student ID</th>
                <th>FAN</th>
            </tr>
            <?php
            if (isset($_POST["submit_file"])) {
                $file = "excel/" . $_FILES["file"]["name"];
                $file_open = fopen($file, "r");
                $_SESSION["file"] = $file;
                fgets($file_open);  // read one line for nothing (skip header)
                while (($csv = fgetcsv($file_open, 1000, ",")) !== false) {
                    $title = $csv[0];
                    $first_name = $csv[1];
                    $middle_name = $csv[2];
                    $family_name = $csv[3];
                    $sex = $csv[4];
                    $username = $csv[5];
                    $email = $csv[6];
                    $student_id = $csv[7];
                    $fan = $csv[8];
                    ?> 
                    <td>
                        <?php echo $title; ?>
                    </td>
                    <td>
                        <?php echo $first_name; ?>
                    </td>
                    <td>
                        <?php echo $middle_name; ?>
                    </td>
                    <td>
                        <?php echo $family_name; ?>
                    </td>
                    <td>
                        <?php echo $sex; ?>
                    </td>
                    <td>
                        <?php echo $username; ?>
                    </td>
                    <td>
                        <?php echo $email; ?>
                    </td>
                    <td>
                        <?php echo $student_id; ?>
                    </td>
                    <td>
                        <?php echo $fan; ?>
                    </td>
                </tr>
                <?php
            }
        }
        ?>
    </table>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
        <input type="submit" value="Confirm" name="confirm_submit" class="confirmbtn">
    </form>
    <?php
    $today = date('Y-m-d H:i:s');
    if (isset($_POST["confirm_submit"])) {
        if (include 'DBconnect.php') {
            $file = $_SESSION["file"];
            $file_open = fopen($file, "r");
            fgets($file_open);  // read one line for nothing (skip header)
            while (($csv = fgetcsv($file_open, 200, ",")) !== false) {
                $vm1 = $conn->query("select max(vm1_port) from users");
                $row = mysqli_fetch_array($vm1);
                $vm1 = $row["max(vm1_port)"] + 1;
//            echo $vm1;
                $vm2 = $conn->query("select max(vm2_port) from users");
                $row = mysqli_fetch_array($vm2);
                $vm2 = $row["max(vm2_port)"] + 1;
//            echo $vm2;
                $title = $csv[0];
                $first_name = $csv[1];
                $middle_name = $csv[2];
                $family_name = $csv[3];
                $gender = $csv[4];
                $user_name = $csv[5];
                $email = $csv[6];
                if ($email == "") {
                    $email = "notset@flinders.edu.au";
                }
                $student_id = $csv[7];
                $fan = $csv[8];
                $uploader = $_SESSION["username"];
                $sql = "SELECT * FROM `users` WHERE `username` =  '$user_name'";
                $result = $conn->query($sql) or die(mysqli_error());
                if ($result->num_rows == 0) {
                    $sql = $sql = "INSERT INTO `users`( `role_id`, `title`, `first_name`, `middle_name`, `family_name`, `username`, `password`, `FAN`, `creted_date`, `created_by`, `email_address`,`vm1_port`, `vm2_port`) "
                            . "VALUES ('3','$title','$first_name','$middle_name','$last_name','$user_name',md5('$user_name'),'$fan','$today','$uploader','notset@flinders.edu.au','$vm1','$vm2')";
                    if ($conn->query($sql) === FALSE) {
                        echo "Error: " . $sql . "<br>" . $conn->error;
                    }
                }
            }
        }

        echo "Upload completed";
        header('refresh:5; url=moduleManage.php');
        exit;
    }
    ?>