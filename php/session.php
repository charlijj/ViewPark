<!-- Div to mark the session portion of the page-->
<div id="session"></div>

<!-- Div to hold the session information-->
<div class="session-container"> 
    <h2 style="margin: 0;">Current Session</h2>
    <p>session info</p>
    <div id="loginModal"></div>
</div>

<!-- Script to show login modal and block session info when user is not logged in -->
<!-- Will probably be moved into its own file eventually -->
<script>
    const LOGIN_STATUS = window.localStorage.getItem("LOGIN_STATUS");
    const loginModal = document.getElementById("loginModal");

    if (LOGIN_STATUS == "0") // if user is not logged in display login modal
    {
        loginModal.innerHTML = `
            <?php
                include("login-modal.php");
            ?>
        `;
    }
    else {
        loginModal.innerHTML = ``; // loginModal div becomes nothing when user logs in, showing what is in session-container
    }
</script>