<?php
    // Set session cookie parameters
    session_set_cookie_params([
        'lifetime' => 0,    // Set the cookie lifetime to 0, which means it will expire when the browser is closed.
        'path' => '/',      // Set the cookie path to "/", which means it will be available in the entire domain.
        'domain' => '',     // Set the cookie domain to an empty string, which means it will be available to the entire domain.
        'secure' => true,   // Set the "secure" flag to true, which means the cookie can only be transmitted over a secure HTTPS connection.
        'httponly' => true, // Set the "httponly" flag to true, which means the cookie can only be accessed through HTTP requests and not through client-side scripts.
        'samesite' => 'None' // Set the "samesite" attribute to 'None', which means the cookie can be sent in third-party contexts.
    ]);

    session_start();
?>

<script>console.log("<?php echo (session_status() == PHP_SESSION_ACTIVE) ? 'SESSION IS ACTIVE' : 'SESSION IS NOT ACTIVE';?>");</script>
