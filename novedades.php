  
<?php 

include_once('cabecera.php');
/*Incluimos fichero de conexión sql*/
include_once("sql.php");

/*Comprobamos si el usuario tiene sesión iniciada*/
 include_once("navbar.php"); 

if (!isset($_SESSION["ID"])) {
	header('Location: /');
	
}



echo "<div class='container'>";

/*Consultamos publicaciones de usuario*/

$consultarPublis = $gbd->prepare("select * from Publicaciones where IDUser IN (select seguido from Amigos where seguidor=".$_SESSION['ID'].") order by FHCreado desc ");
$consultarPublis->execute();
$arrayConsultarPublis=$consultarPublis->fetchAll();


while($row = array_shift($arrayConsultarPublis)) {
	$consultarUsuario = $gbd->prepare("select * from Usuarios where ID ='".$row['IDUser']."' limit 1 ");
	$consultarUsuario->execute();
	$arrayConsultarUsuario=$consultarUsuario->fetchAll();

	//echo $arrayConsultarUsuario[0];

	echo "<div class='panel panel-default'>";
	  echo "<div class='panel panel-heading'>";
		    echo "<a href='user.php?usu=".$arrayConsultarUsuario[0]["ID"]."' <h2 class='panel-title'>".$arrayConsultarUsuario[0]["Nombre"]."</h2></a>";

	  echo "</div>";
	  echo "<div class='panel panel-body' style='color:black';>";
	    echo "<IMG SRC='assets/img/".$arrayConsultarUsuario[0]['ID']."/perfil.jpeg' WIDTH=250 HEIGHT=220 BORDER=2 VSPACE=3 HSPACE=3 ALT='Foto de perfil'>";
	   	echo "<h3>".$row['Titulo']."</h3>";
	    echo $row['Contenido'];
	  echo "</div>";
	   echo "<div class='panel panel-footer' >";
	    echo $row['FHCreado'];
	  echo "</div>"; 
	echo"</div>";
	//echo $row["Titulo"];
}

echo "</div>";

?>


</div>
<?php 
include_once('pie.php')
?>
