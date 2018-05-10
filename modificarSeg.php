<?php 

include 'sql.php';

/*Este fichero sirve para follow y unfollow */

$accion=$_POST["accion"];
$seguidor=$_POST["seguidor"];
$seguido=$_POST["seguido"];


/*FOLLOW*/
if ($accion=="seguir") {
	$querySeguirUser="Insert into Amigos (seguidor, seguido) VALUES ('$seguidor','$seguido')";
	$seguirUser=$gbd->prepare($querySeguirUser);
	$seguirUser->execute();

	// print_r($seguirUser->errorInfo());

/*UNFOLLOW*/
}else{
	$queryNoSeguirUser="delete from Amigos where seguidor='$seguidor' and seguido='$seguido' ";
	$NoseguirUser=$gbd->prepare($queryNoSeguirUser);
	$NoseguirUser->execute();
}


?>