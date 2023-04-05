<?php
    include_once("include/start_session.php");
?>

<?php
    include_once("include/head.php");
?>

<?php
	include_once 'include/database.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST'){

		$type 	= $_POST['user-type'];
		$email 	= $_POST['email'];	
		$name	= $_POST['username'];
		$pass	= $_POST['password'];
		$repass	= $_POST['re_password'];
		
		$db = new Database;

		$hint = new UserEntry;
		$hint->email = $email;
		$query = $db->get_users($hint);

		if(count($query[1]) > 0){
            echo "<script>alert(`Account already exists with email $email!`)</script>";
		
		}elseif($pass != $repass){
            echo "<script>alert(`Passwords do not match!`)</script>";
	
		}else{
			$user = new UserEntry;
			$user->userType = $type;
			$user->email = $email;
			$user->userName = $name;
			$user->password = $pass;
			$user->registrationDate = time();	

			// Try to create user account
			$db->create_user($user);

			// Check database to see if it was added
			$results = $db->get_users($user);
			$success = $results[0];
			$rows	 = $results[1];

			if(count($rows) == 1){

				echo "New account made";
				echo "<script>alert(`New Account Created, Welcome $name!`)</script>";
				echo "<script>window.location = `index.php`</script>";

				$_SESSION["USER_ID"] = $rows[0]['userId']; // set current user session global
			}
            else {
                echo "<script>console.log(`account creation failed`)</script>";
            }
		}
	}
?>

<div class="create-account-container">

    <h1>Create a new account</h1>

    <div class="line"></div>

    <form action="create_account.php" method="post" class="create-account-form">
        <p>What type of user are you?</p>
        <div class="user-type-container">
            <label for="user-type">General Parking User: 
                <input type="radio" name="user-type" value="1" checked>
            </label>

            <label for="user-type" style="margin-left: 25px;">Staff Parking User: 
                <input type="radio" name="user-type" value="2">
            </label>
        </div>
        <label for="email">Enter your email: 
            <input type="email" name="email" required>
        </label>

        <label for="name">Enter your user name: 
            <input type="text" name="username" required>
        </label>

        <label for="password">Enter your password: 
            <input type="password" name="password" required>
        </label>

        <label for="password">Renter your password: 
            <input type="password" name="re_password" required>
        </label>

        <input type="submit" id="submitButton" class="create-account-form-button" value="Create Account">
        <input type="reset" id="resetButton" class="create-account-form-button" value="Clear">
    </form>
</div>

<?php
    include_once("include/tail.php");
?>
