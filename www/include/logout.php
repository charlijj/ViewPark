<?php if (isset($_SESSION['USER_ID'])) { ?>	
	<div class="account-action-container ">
		<div class='logout-button' id='logoutButton'>
			<span>LOG OUT</span>
		</div>
		<div class='edit-account-button' id='editAccountButton'>
			<span>EDIT ACCOUNT</span>
		</div>
	</div>


	<script>
		const logoutButton = document.getElementById("logoutButton");
		const editAccountButton = document.getElementById("editAccountButton");

		logoutButton.addEventListener("click", () => {
			window.location = window.location.href + "?logout=1";
		});

		editAccountButton.addEventListener("click", () => {
			window.location = "edit_account.php";
		});
	</script>
<?php } ?>
