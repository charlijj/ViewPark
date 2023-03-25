<?php

    session_start(); // start session to access $_SESSION super globals 

    include_once("database.php");

    $db = new Database;
    $session = new SessionEntry;

    if (isset($_SESSION["USER_ID"]))
    {
        $userID = $_SESSION["USER_ID"];
    }
    else {
        $userID = "NONE";
    }

    if (isset($_SESSION["LOT_ID"]))
    {
        $lotID= $_SESSION["LOT_ID"];
        $startTime = $_SESSION["PARK_START"];
        $endTime = $_SESSION["PARK_END"];
    }
    else {
        $lotID = "NONE";
        $startTime = "";
        $endTime = "";
    }
?>


<!-- Div to mark the session portion of the page-->
<div id="session"></div>

<!-- Div to hold the session information-->
<div class="session-container"> 
    <h2 style="margin: 0;">Current Session</h2>
    <p>Logged in as: <?php echo $userID;?></p>
    <p>Parking at lot: <?php echo $lotID;?></p>
    <p>From: <?php echo $startTime;?></p>
    <p>To: <?php echo $endTime;?></p>
    <div id="loginModal"></div>
</div>

<!-- Script to show login modal and block session info when user is not logged in -->
<!-- Will probably be moved into its own file eventually -->
<script>
    const LOGIN_STATUS = window.localStorage.getItem("LOGIN_STATUS");
    const loginModal = document.getElementById("loginModal");

    if (LOGIN_STATUS == "0") // if user is not logged in display login modal
    {
        loginModal.innerHTML = `
            <?php
                include("login_modal.php");
            ?>
        `;
    }
    else {
        loginModal.innerHTML = ``; // loginModal div becomes nothing when user logs in, showing what is in session-container
    }
</script>