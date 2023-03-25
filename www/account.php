<?php
    include_once("include/head.php");
?>

<?php
    include_once("include/tail.php");
?>

<?php

    session_start(); // start session to access $_SESSION super globals 

    include("include/database.php");

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $username = $_POST["username"];
        $password = $_POST["password"];

        $db = new Database;
        $user = new UserEntry;
        $user->userName = $username;
        $user->password = $password;

        if (count($db->get_users($user)[1]) == 1) // if user credentials are valid
        {
            // set LOGIN_STATUS to true and reload page, makes the login modals disappear 
            echo "<script>
                window.localStorage.setItem(\"LOGIN_STATUS\", \"1\"); 
                window.location = \"index.php\";
                </script>
            ";

            $_SESSION["USER_ID"] = $username; // set current user session global
        }
        else
        {
            echo "<script>
                alert(\"Invalid Login\")
                window.location = \"index.php\";
                </script>";
        }
    }
?>
