<div class="availability-container">
    <div class="availability-container-item" id="lot1">
        <p>Parking Lot 1</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot2">
        <p>Parking Lot 2</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot3">
        <p>Parking Lot 3</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot4">
        <p>Parking Lot 4</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot5">
        <p>Parking Lot 5</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot6">
        <p>Parking Lot 6</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot7">
        <p>Parking Lot 7</p>
        <p>Availability: some%</p>
    </div>
    <div class="availability-container-item" id="lot8">
        <p>Parking Lot 8</p>
        <p>Availability: some%</p>
    </div>
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