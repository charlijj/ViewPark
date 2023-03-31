<!-- Div to mark the session portion of the page-->
<div id="session"></div>

<!-- Div to hold the session information-->
<div class="session-container"> 

    <h2 style="margin: 0;">Current Session</h2>

    <p>
		Logged in as: <?php echo $_SESSION['USER_ID'];?>
	</p>

    <p>
		Parking at lot: <?php echo $_SESSION['LOT_ID']; ?>
	</p>

    <p>
		From: <?php echo $_SESSION['PARK_START']; ?>
	</p>

    <p>
		To: <?php echo $_SESSION['PARK_END']; ?>
	</p>


    <div id="loginModal">
		<?php
			if (!isset($_SESSION['USER_ID']))
				include("login_modal.php");
		?>
	</div>
</div>
