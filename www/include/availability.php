<div class="availability-container">
	
	<?php
		include_once 'database.php';		
        session_start(); // Start session to access $_SESSION super globals

		$db = new Database;

		// get current users user type (general or staff)
		$query = 'SELECT userType FROM user WHERE userName=:userName';
		$params = array('userName' => $_SESSION['USER_ID']);
		$results = $db->run($query, $params);
		$success = $results[0];
		$rows = $results[1];

		if ($success && count($rows) >= 1)
		{
			$userType = $rows[0]['userType'];
		}

		$query = $db->get_lots();

		foreach($query[1] as $lot ){

			// Check the current fullness of the lot
			$query = 'SELECT fullness FROM availability WHERE lotId=:lotId ORDER BY date DESC';
			$params = array('lotId' => $lot->lotId);
			$results = $db->run($query, $params);
			$success = $results[0];
			$rows = $results[1];

			if ($success && count($rows) >= 1){
				$fullness = $rows[0]['fullness'];
				$lotType = $rows[0]['lotType'];

			}else
				$fullness = 0;

			// display only general lots for general users, all lots for staff users or if user is not logged in
			if ($lot->lotType == $userType || $userType == 2 || !isset($userType)) {
				echo "
				<div class='availability-container-item' id='lot$lot->lotId'>
					<p>$lot->lotName</p>
					<p>$lot->location</p>
					<p>$fullness% full</p>
				</div>
				";
			}
		}
	?>
	
</div>

<div class="availability-modal-container" id="availabilityModal">

    <div class="availability-modal-display">

        <div class="availability-modal-content" id="availabilityModalContent">
            <?php 

				if(isset($_SESSION['USER_ID'])){
					include 'forecast.php';
					include 'park.php';

				}else{
					include "login_modal.php";
				}

			?>
        </div>

        <div class="availability-modal-close" id="availabilityModalClose">&times;</div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

	let lotId = 0;
	let chart = null;

	const date = new Date;

    const availabilityItem = document.querySelectorAll('.availability-container-item');
    const availabilityModal = document.getElementById("availabilityModal");
    const availabilityModalClose = document.getElementById("availabilityModalClose");
    const availabilityModalContent = document.getElementById("availabilityModalContent");

    availabilityItem.forEach(availabilityItem => 
    {
        availabilityItem.addEventListener('click', () => {

            lotId = availabilityItem.id.substr(-1);

            availabilityModal.style.display = "flex";

			// Update Parking Form with the lot-id
			document.getElementById('lot-id').value = lotId;

			//show parking lot avaliability forecast and park option
			chart = loadGraph();
			updateForecast(lotId, date.getDay());
        })
    });

    availabilityModalClose.addEventListener("click", () => {
        availabilityModal.style.display = "none";
    })

	/******** GRAPH FORMATTER *********/

	function loadGraph()
	{
		if(chart != null)
			return chart;

		// Context for the actual canvas that the chart is drawn to.
		const ctx = document.getElementById('forecast-graph');

		// Time labels for the x axis of the chart.
		const graph_labels = ['6', '7', '8', '9', '10', '11', '12', '1', '2', '3', '4', '5'];

		return new Chart(ctx, {
			type: 'bar',
			data: {
				labels: graph_labels,
				datasets: [{
					label: "Fullness",
					data: [],
					borderWidth: 1,
					// Colors bars based on value of data.
					backgroundColor: function(context) {
						var value = context.dataset.data[context.dataIndex];
						if (value > 80) {
							return 'rgba(255, 99, 132, 0.2)'; // Red 
						} else if (value > 60) {
							return 'rgba(255, 221, 99, 0.2)'; // Yellow
						} else {
							return 'rgba(120, 190, 120, 0.2)'; // Green
						}
					},
					borderColor: function(context) {
						var value = context.dataset.data[context.dataIndex];
						if (value > 80) {
							return 'rgb(255, 99, 132)'; // Red
						} else if (value > 60) {
							return 'rgb(255, 221, 99)'; // Yellow
						} else {
							return 'rgb(120, 190, 120)'; // Green
						}
					}
				}]
			},
			options: {
				scales: {
					x: {
						title: {
							display: true,
							text: 'Time'
						}
					},
					y: {
						title: {
							display: true,
							text: '% Full'
						},
						beginAtZero: true,
						max: 100
					}
				}
			}
		});
	}


	/******** FORECAST FETCHER ********/

	function getForecastFromModal(){
		const forecastDay = document.getElementById("forecast-day");

		updateForecast(lotId, forecastDay.value);
	}


	function updateForecast(lot, day){
		// Update forecast day selector if not already set
		const forecastDay = document.getElementById("forecast-day");
		forecastDay.selectedIndex = day;

		// Fetch json lot data and update graph
		fetch("lots/"+lot)
		.then( (response) => response.json() )
		.then( (data) => update(data) );

		function update(data){
			chart.data.datasets[0].data = data.lot["day"+day];
			chart.update();
		}
	}

</script>
