<?php

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

            session_start();

            $_SESSION["userID"] = $username;
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
