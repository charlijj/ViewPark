<?php

    // Enter form code here
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../style/style.css">
    <link rel="stylesheet" href="../style/create_account_style.css">
    <title>View Park</title>
</head>
<body>
<div class="create-account-container">
    <h1>Create a new account</h1>
    <div class="line"></div>
    <form action="createAccount.php" method="post" class="create-account-form">
        <p>What type of user are you?</p>
        <div class="user-type-container">
            <label for="user-type">General Parking User: 
                <input type="radio" name="user-type" value="general" checked>
            </label>

            <label for="user-type" style="margin-left: 25px;">Staff Parking User: 
                <input type="radio" name="user-type" value="staff">
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
