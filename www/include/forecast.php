<?php

    include_once("database.php");

    $db = new Database;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // If the form was submitted, get the selected day of the week from the POST data
        $selected_day = $_POST['forecast-day'];
      
        // Set the $forecast_day variable to the selected day
        $forecast_day = $selected_day;
    } else {
        // If the form was not submitted, set the $forecast_day variable to the current day
        $forecast_day = date('l'); // 'l' format returns the full name of the day of the week (e.g. "Monday")
    }

?>

<div class="forecast-container">
    <div class="forecast-title">
        <?php echo $forecast_day ?> Forecast
    </div>
    <div class="forecast-graph-container">
        <canvas id="forecast-graph"></canvas>
    </div>
    <div class="day-select">
        <label for="forecast-day">View forecast for:</label>
            <select id="forecast-day" name="forecast-day">
                <option value="monday">Monday</option>
                <option value="tuesday">Tuesday</option>
                <option value="wednesday">Wednesday</option>
                <option value="thursday">Thursday</option>
                <option value="friday">Friday</option>
                <option value="saturday">Saturday</option>
                <option value="sunday">Sunday</option>
            </select>
    </div>
</div>
