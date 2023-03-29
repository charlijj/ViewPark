<?php
    include_once("database.php");

    session_start(); // Start session to access $_SESSION super globals

    $db = new Database;
    $session = new SessionEntry;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        /* 
            To insert into session table, need the following items:
                sessionId			INTEGER -> CREATED AUTOMATICALLY WITH NEW ENTRY
                lotId				INTEGER 
                userId				INTEGER
                startTime			INTEGER NOT NULL
                endTime				INTEGER NOT NULL
        */

        // Get start and end times from form submission which is just hh:mm, and concatenate
        // with today's date to make full datetime string
        $startTimeStamp = date('Y-m-d') . $_POST['start-time'];
        $endTimeStamp = date('Y-m-d') . $_POST['end-time'];

        // Set the variables for the SessionEntry object, which will be inserted into database.
        $sessionId = '';    // Not sure if we need this since it's a primary key and it would be auto-generated when inserting??
        $lotId = '';        // Get somehow from the modal window that is clicked?
        $userId = $_SESSION["USER_ID"];             // $_SESSION["USER_ID] is set when user logs in.
        $startTime = strtotime($startTimeStamp);    // Converting timestamp to Unix epoch time for inserting into database
        $endTime = strtotime($endTimeStamp);        // Converting timestamp to Unix epoch time for inserting into database

        $session->set_params(array(
            'sessionId' => $sessionId,
            'lotId'     => $lotId,
            'userId'    => $userId,
            'startTime' => $startTime,
            'endTime'   => $endTime
        ));

        // Store the SessionEntry and associated variables in the database.
        $db->create_session($session);

        /*
            Need to set the following values so the values in "session.php" are populated.

                $_SESSION["LOT_ID"]
                $_SESSION["PARK_START"]
                $_SESSION["PARK_END"]
        */

        $_SESSION["LOT_ID"] = $lotId;
        $_SESSION["PARK_START"] = $startTimeStamp;  
        $_SESSION["PARK_END"] = $endTimeTimeStamp; 

    }

?>

<!-- 
value="<php echo date('H:i')?>"
sets the default value for start-time to the current time in hh:mm format.
The H in the format string represents 24 hour format (00 through 23) and
the i in the format string represents minutes with leading zeroes (00 through 59).
-->
<div class="park-container">
    <div class="park-container-content">

        <form id="park-form" method="post">
            <label for="start-time">Start Time:</label>
                <input type="time" id="start-time" name="start-time" value="<?php echo date('H:i')?>">

            <label for="end-time">End Time:</label>
                <input type="time" id="end-time" name="end-time" value="<?php echo date('H:i', strtotime('+1 hour'))>

            <input type="submit" value="Park Now">
        </form>

    </div>
</div>