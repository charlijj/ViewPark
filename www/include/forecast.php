<!-- Forecast Selection Modal -->
<div class="forecast-container">

    <div class="forecast-title">
        Availability Forecast
    </div>

    <div class="forecast-graph-container">
        <canvas id="forecast-graph"></canvas>
    </div>

    <div class="day-select">

		<label for="forecast-day">View forecast for:</label>
		<select id="forecast-day" name="forecast-day">
			<option value="0">Sunday</option>
			<option value="1">Monday</option>
			<option value="2">Tuesday</option>
			<option value="3">Wednesday</option>
			<option value="4">Thursday</option>
			<option value="5">Friday</option>
			<option value="6">Saturday</option>
		</select>

		<button id="day-select-submit" onclick="getForecastFromModal();"> Go </button>
    </div>
</div>
