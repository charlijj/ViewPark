<?php if (isset($_SESSION['USER_ID'])) { ?>	
	<div class='logout-button' id='logoutButton'>
		<span>LOG OUT</span>
	</div>

	<script>
		const logoutButton = document.getElementById("logoutButton");

		logoutButton.addEventListener("click", () => {
			window.location = window.location.href + "?logout=1";
		});
	</script>
<?php } ?>
