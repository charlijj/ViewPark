<?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $someCallToTheDatabase = true; // to be replace with user authentication

        $username = $_POST["username"];
        $password = $_POST["password"];

        if ($someCallToTheDatabase) // if user credentials are valid
        {
            // set LOGIN_STATUS to true and reload page, makes the login modals disappear 
            echo "<script>
                window.localStorage.setItem(\"LOGIN_STATUS\", \"1\"); 
                window.location = \"index.php\";
                </script>
            ";
        }
    }
?>
