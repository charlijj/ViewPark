<div class="logout-button" id="logoutButton">
    <span>LOG OUT</span>
</div>

<script>
    const logoutButton = document.getElementById("logoutButton");

    logoutButton.addEventListener("click", () => {
        window.localStorage.setItem("LOGIN_STATUS", "0");
        window.location.reload();
    });
    
    LOGIN_STATUS = window.localStorage.getItem("LOGIN_STATUS");

    if (LOGIN_STATUS == 0)
    {
        logoutButton.style.display = "none";
    }
    else {
        logoutButton.style.display = "flex";
    }
</script>