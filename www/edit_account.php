<?php
    include_once("include/start_session.php");
?>

<?php
    include_once("include/head.php");
?>

<?php
	include_once 'include/database.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST'){

        $currPass = $_POST['curr_password'];
        $type = $_POST['user-type'];
        $email = $_POST['email'];
        $name = $_POST['username'];
        $pass = $_POST['password'];
        $repass = $_POST['re_password'];

        $db = new Database;
		$hint = new UserEntry;

		$hint->userName = $_SESSION['USER_ID'];
		$hint->password = $currPass;
        
        if(count($db->get_users($hint)[1]) == 1){

            if (isset($_POST['del_account'])){
                
                //$db->delete_row('user', $hint); // delete current user from database

                unset($_SESSION['USER_ID']);
                echo "<script>alert(`Account Deleted`);</script>";
                echo "<script>window.location = `index.php`;</script>";
            }
            else if (isset($_POST['password']) && ($pass != $repass)) {
                echo "<script>alert(`New passwords do not match!`);</script>";
            }
            else{
                $user = new UserEntry;

                $user->password = $pass;
                
                if (isset($_POST['user-type'])){
                    $user->userType = $type;
                }
                if (isset($_POST['email'])){
                    $user->userType = $email;
                }
                if (isset($_POST['username'])){
                    $user->userType = $name;
                }

                //$db->update_users($hint, $user) // update the current users data 

                echo "<script>alert(`Account updated`)</script>";
            }

		} else {
            echo "<script>alert(`Invalid credentials, failed to update account`)</script>";
        }
    }
?>

<div class="create-account-container" style="height: 950px;">

    <h1>Edit account information of <?php echo $_SESSION['USER_ID']?></h1>
    <h2><a href="index.php">Back Home</a></h2>

    <div class="line"></div>

    <form action="" method="post" class="create-account-form">

        <label for="password">Enter your current password: 
            <input type="password" name="curr_password" required>
        </label>

        <label for="password">Enter your new password: 
            <input type="password" name="password">
        </label>

        <label for="password">Renter your new password: 
            <input type="password" name="re_password">
        </label>

        <p>Change user type: </p>
        <div class="user-type-container">
            <label for="user-type">General Parking User: 
                <input type="radio" name="user-type" value="1" checked>
            </label>

            <label for="user-type" style="margin-left: 25px;">Staff Parking User: 
                <input type="radio" name="user-type" value="2">
            </label>
        </div>

        <label for="email">Change email: 
            <input type="email" name="email">
        </label>

        <label for="name">Change user name: 
            <input type="text" name="username">
        </label>

        <label for="delete-account">DELETE ACCOUNT: 
            <input type="checkbox" name="del_account">
        </label>

        <input type="submit" id="submitButton" name="submit" class="create-account-form-button" value="Update Account">
        <input type="reset" id="resetButton" class="create-account-form-button" value="Clear">
    </form>
</div>

<?php
    include_once("include/tail.php");
?>