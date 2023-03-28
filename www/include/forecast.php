<?php

    include_once("database.php");

    $db = new Database;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // If the form was submitted, get the selected day of the week from the POST data
        $forecast_day = $_POST['forecast-day'];
    } else {
        // If the form was not submitted, set the $forecast_day variable to the current day
        $forecast_day = date('w'); // 'w' format returns the day of the week as a number, where 0 is Sunday, 1 is Monday, ... 6 is Saturday
    }

    // The id of the lot that was clicked on.
    $lotId = 1;

    // The elements in $time_labels correspond to the labels on the chart, and the data we have in the database.
    // The elements are used in the $query to select availabilities at a certain hour of the day, ie. 06 means 6am, 13 means 1pm, etc.
    $chart_data = array('06' => 0, '07' => 0, '08' => 0, '09' => 0, 
                        '10' => 0, '11' => 0, '12' => 0, '13' => 0, 
                        '14' => 0, '15' => 0, '16' => 0, '17' => 0);
    
    foreach ($chart_data as $k => $v) {
        $query =   "SELECT AVG(fullness) as avg_fullness
                    FROM availability
                    WHERE lotId = :lotId
                    AND strftime('%w', date, 'unixepoch') = :forecast_day
                    AND strftime('%H', date, 'unixepoch') = :k
                    AND strftime('%M', date, 'unixepoch') BETWEEN '00' AND '59'";
        $params = array(":lotId" => $lotId, ":forecast_day" => $forecast_day, ":k" => $k);
        // Results is a single integer, containing the average fullness for $lotId at time $k
        // Assign it to $chart_data[$k] if query was successful, otherwise assign 0.
        // [$success, $results] = $db->run($query, $params);
        // $chart_data[$k] = $success ? $results[0]['avg_fullness'] : 0;
    }

?>

<div class="forecast-container">
    <div class="forecast-title">
        Availability Forecast
    </div>
    <div class="forecast-graph-container">
        <canvas id="forecast-graph"></canvas>
    </div>
    <div class="day-select">
        <form id="day-select-form" method-="post">
            <label for="forecast-day">View forecast for:</label>
                <select id="forecast-day" name="forecast-day" onchange="submitForm()">
                    <option value="0">Sunday</option>
                    <option value="1">Monday</option>
                    <option value="2">Tuesday</option>
                    <option value="3">Wednesday</option>
                    <option value="4">Thursday</option>
                    <option value="5">Friday</option>
                    <option value="6">Saturday</option>
                </select>
        </form>
    </div>
</div>

<!-- 
for when the day gets selected, need to update the value so chart gets updated 
when a new day is selected

function submitForm() {
    document.getElementById("day-select-form").submit();
}
 -->