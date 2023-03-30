<?php

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

        // Set the variables for the SessionEntry object, which will be inserted into database.
        $sessionId = '';    // Not sure if we need this since it's a primary key and it would be auto-generated when inserting??
        $lotId = 1;         // Have 1 as default for now. Need to get somehow from the modal window that is clicked?
        $userId = $_SESSION["USER_ID"]; // $_SESSION["USER_ID] is set to user's username when they log in.
        $startTime = strtotime(date('Y-m-d') . $_POST['start-time']);   // Concatenate current date with time from form, then convert to Unix epoch time.
        $endTime = strtotime(date('Y-m-d') . $_POST['end-time']);       // Concatenate current date with time from form, then convert to Unix epoch time.

        /*
            Need to add some logic to check if user has a session active.
            Either need to check if $_SESSION["PARK_END"] is set,
            and if it is set, check if current time is sooner than the session park end time
            Can do something along the lines of:
            $currentTime = time();
            if (isset($_SESSION["PARK_END"]) && ($currentTime < strtotime($_SESSION["PARK_END"]))) { 
                // User still has an active session 
            }
        */

        // Query database to get the numeric userId associated with the username, 
        // where username is stored in $_SESSION["USER_ID"]
        $username = $_SESSION["USER_ID"];
        $query =   "SELECT userId
                    FROM user
                    WHERE username = :username";
        $params = array("username" => $username);
        $results = $db->run($query, $params);
        $success = $results[0];
        $data = $results[1];
        $userIdInt = $success ? (int)$data[0][0] : 0;

        // Set the parameters for the SessionEntry object.
        $session->set_params(array(
            'sessionId' => $sessionId,
            'lotId'     => $lotId,
            'userId'    => $userIdInt,
            'startTime' => $startTime,
            'endTime'   => $endTime
        ));

        // Store the SessionEntry object variables in the database.
        $db->create_session($session);

        /*
            Need to set the following values so the values in "session.php" are populated.

                $_SESSION["LOT_ID"]
                $_SESSION["PARK_START"]
                $_SESSION["PARK_END"]
        */

        $_SESSION["LOT_ID"] = $lotId;
        $_SESSION["PARK_START"] = date('Y-m-d H:i', $startTime);  
        $_SESSION["PARK_END"] = date('Y-m-d H:i', $endTime); 

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
                <input type="time" id="end-time" name="end-time" value="<?php echo date('H:i', strtotime('+1 hour'))?>">

            <input type="submit" value="Park Now">
        </form>

    </div>
</div>