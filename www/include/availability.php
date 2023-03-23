<div class="availability-container">
	
	<?php
		include_once 'database.php';		

		$db = new Database;

		$query = $db->get_lots();

		foreach($query[1] as $lot ){
			echo "
			<div class='availability-container-item' id='lot$lot->lotId'>
				<p>$lot->lotName</p>
				<p>$lot->location</p>
				<p>$lot->fullness% full</p>
			</div>
			";
		}

	?>
	
</div>

<div class="availability-modal-container" id="availabilityModal">
    <div class="availability-modal-display">
        <div class="availability-modal-content" id="availabilityModalContent">
            
        </div>
        <div class="availability-modal-close" id="availabilityModalClose">&times;</div>
    </div>
</div>

<script>

    const availabilityItem = document.querySelectorAll('.availability-container-item');
    const availabilityModal = document.getElementById("availabilityModal");
    const availabilityModalClose = document.getElementById("availabilityModalClose");
    const availabilityModalContent = document.getElementById("availabilityModalContent");

    availabilityItem.forEach(availabilityItem => 
    {
        availabilityItem.addEventListener('click', () => {
            console.log(availabilityItem.id);
            availabilityModal.style.display = "flex";

            const LOGIN_STATUS = window.localStorage.getItem("LOGIN_STATUS");

            if (LOGIN_STATUS == "0") // if user is not logged in display login modal
            {
                availabilityModalContent.innerHTML = `
                    <?php
                        include("login-modal.php");
                    ?>
                `;
            }
            else {
                // This will be replace with another include for the forecast and other info
                availabilityModalContent.innerHTML = availabilityItem.id;
            }
        })
    });

    availabilityModalClose.addEventListener("click", () => {
        availabilityModal.style.display = "none";
    })

</script>
