<?php

include 'cabecera.php';


// Destruir todas las variables de sesión.

if ($_GET["logout"]=="si") {
  $_SESSION = array();

  // Si se desea destruir la sesión completamente, borre también la cookie de sesión.
  // Nota: ¡Esto destruirá la sesión, y no la información de la sesión!
  if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
      );
  }
  // Finalmente, destruir la sesión.
  session_destroy();
  header('Location: index.php');

}

  session_start();

//En caso de tener sesión iniciada se redirigirá a la página del usuario
if (isset($_SESSION['Nombre'])) {
    header('Location: user.php');
}  

  //Barra de navegacion
  include_once("navbar.php");
  
  ?>

  <div class='container-fluid'>
    <div class="padre-centrado">
      <div class="hijo-centrado">
        <?php
        include_once("register.php");
        include_once("login.php");
        ?>

      </div>
    </div>
  </div>

  
<?php 
include_once("pie.php");
?>
