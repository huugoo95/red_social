<?php 

	include 'cabecera.php';
 ?>
  <!-- Modal  para agregar publicaciones -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    	
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" >Crear una nueva publicación</h4>
        </div>
        <form enctype="multipart/form-data" action="" id="formulario_publicacion">
        <div class="modal-body" id="modalBody">
        <input type="text" class="form-control" id="tituloPublicacion" name="titulo" placeholder="Título de publicacion"><br>
        <textarea class="form-control" rows="4" id="textoPublicacion" name="texto" placeholder="Escribe aquí el texto que desea añadir"></textarea><br>
        <input id="imagenPublicacion" type="file" name="imagenPublicacion">
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" onclick="agregarPubli();" class="btn btn-info">Agregar</button>
        </div>
      </div>
      
    </div>
  </div>
  
<?php 

/*Incluimos fichero de conexión sql*/
	include_once("sql.php");

/*Se puede llegar a este dichero de 4 formas

	*Desde el formulario de registro
	*Desde el formulario de login
	*Desde la barra de navegacion "Mi perfil"
	*Accediendo al perfil de otro usuario

*/


/*Comprobamos si tenemos que validar un registro*/
		if (isset($_POST["Nombre"])) {
			foreach($_POST as $nombre_campo => $valor){
			   $asignacion = "\$" . $nombre_campo . "='" . $valor . "';";
			   eval($asignacion);
			   //echo "$valor";
			}

			$gbd->exec("SET CHARACTER SET utf8");
			$gbd->exec("INSERT INTO Usuarios (Nombre,Apellidos,Pais,Email,Password) VALUES('$Nombre','$Apellidos','$Pais','$Email','$password') ");
			$consultarId = "SELECT ID FROM Usuarios where Nombre='$Nombre' and Email='$Email' limit 1";
			//echo "INSERT INTO Usuarios (Nombre,Apellidos,Pais,Email,Password) VALUES('$Nombre','$Apellidos','$Pais','$Email','$Password') ";
			session_start();
 			$_SESSION["Nombre"]="$Nombre";
 			//$_SESSION["ID"]="$ID";
			foreach ($gbd->query($consultarId) as $row) {
	 			$_SESSION["ID"]=$row['ID'];
    		} 	

    		//Creamos carpeta de imagenes del usuario, donde se guardarán sus fotos subidas y de perfil
	   		$numero_carpeta=$_SESSION["ID"];
	   		$antigua = umask(0);
			mkdir("assets/img/$numero_carpeta",0770,true); 
			umask($antigua);
			copy("assets/img/homer.jpg","assets/img/".$numero_carpeta."/perfil.jpeg");

		}

/*Comprobamos si tenemos qe validar un logueo*/

		if (isset($_POST["logueo"])) {

			foreach($_POST as $nombre_campo => $valor){
			    $asignacion = "\$" . $nombre_campo . "='" . $valor . "';";
		   		eval($asignacion);

			}
			$gbd->exec("SET CHARACTER SET utf8");
			$consultarUser="select * from Usuarios where Email='$Mail' and Password='$passwordLogin' limit 1";

			/*$cuenta = $gbd->rowCount($consultarUser);
			echo $cuenta."12345";
			if ($cuenta==0) {
				header('Location: index.php?error');
			}*/

			foreach ($gbd->query($consultarUser) as $row) {
			session_start();
	        	$_SESSION["Nombre"]=$row['Nombre'];
	 			$_SESSION["ID"]=$row['ID'];
    		}



		}


/*Comprobamos si el usuario tiene sesión iniciada*/
 include_once("navbar.php"); 

if (!isset($_SESSION["Nombre"])) {
	header('Location: /index.php');
}
/*Comprobamos si accedemos al perfil propio o a otro perfil*/
if (!isset($_GET["usu"]) || $_GET["usu"]==$_SESSION["ID"] ) {
	$usu=$_SESSION['ID'];
	$yo=true;

}else{
	$usu=$_GET["usu"];
	$yo=false;
	$FHActual=date("Y-m-d H:i:s"); 
	$gbd->exec("INSERT INTO Visitas (userA,userB,FHVisita) VALUES('".$_SESSION["ID"]."','".$_GET["usu"]."','$FHActual') ");

}


echo "<div class='container'>";
	$consultarUsu="select * from Usuarios where ID='$usu' limit 1";
//echo $consultarUsu;
	foreach ($gbd->query($consultarUsu) as $row) {

	echo "<div class='row'>";
		echo "<div class='col-md-4' id='cabeceraUser'>";
		echo "<IMG  SRC='assets/img/$usu/perfil.jpeg' WIDTH=250 HEIGHT=220 BORDER=2 VSPACE=3 HSPACE=3 ALT='Foto de perfil'>";
		echo "</div>";

		echo "<div class='col-md-6'>";
			echo "<h2>".$row["Nombre"]." ".$row["Apellidos"]."</h2>" ;
			echo "<br>Nacido el ".$row['FHNacimiento']."";
			echo "<br>".$row['Descripcion']."";
			//echo "<br>$row['Nombre']";
		echo "</div>";
		echo "<div class='col-md-2'>";
		if ($yo==true) {
			echo "<button data-toggle='modal' data-target='#myModal' class='btn btn-default'><i class='fa fa-pencil-square-o'  aria-hidden='true'></i> Escribir publicacion</button>" ;
			//echo "<button class='btn btn-default'><i class='fa fa-user-circle-o' aria-hidden='true'></i> Editar perfil</button>" ;
			echo "<button class='btn btn-default' onclick='verEstadisticas(".$_SESSION['ID'].");'><i class='fa fa-line-chart' aria-hidden='true'></i> Ver estadísticas</button>" ;
			echo "<a href='export.php?pdf=1' <button class='btn btn-default' ><i class='fa fa-file-pdf-o' aria-hidden='true'></i> Exportar publicaciones</button></a>" ;
		}else{
			$consultarSegQuery="select * from Amigos where seguidor='".$_SESSION['ID']."' and seguido='$usu' limit 1";
			//echo $consultarSegQuery;
			$consultarSeg=$gbd->prepare($consultarSegQuery);
			$consultarSeg->execute();

			$seguido = $consultarSeg->rowCount();

			if ($seguido==0) {
				echo "<button class='btn btn-info' onclick=modificarSeg('seguir',".$_SESSION['ID'].",$usu);><i class='fa fa-user-plus' aria-hidden='true'></i>Seguir usuario</button>" ;				
			}else{
				echo "<button class='btn btn-danger' onclick=modificarSeg('Noseguir',".$_SESSION['ID'].",$usu);><i class='fa fa-user-times' aria-hidden='true'></i>Dejar de seguir</button>" ;				
			}

		}
		echo "</div>";



echo "</div><br>";


echo "<div id='contenidoInferior'>";
	/*Consultamos publicaciones de usuario*/

	$consultarPublis = $gbd->prepare("select * from Publicaciones where IDUser='$usu' order by FHCreado desc ");
	$consultarPublis->execute();
	$arrayConsultarPublis=$consultarPublis->fetchAll();

	while($row = array_shift($arrayConsultarPublis)) {
	echo "<div class='panel panel-default'>";
	  echo "<div class='panel panel-heading'>";
	    echo "<h3 class='panel-title'>".$row['Titulo']."</h3>";
	  echo "</div>";
	  echo "<div class='panel panel-body'>";
	    echo "<IMG SRC='assets/img/publicaciones/".$row['IDPubli']."/".$row['img']."' WIDTH=250 HEIGHT=220 BORDER=2 VSPACE=3 HSPACE=3 ALT='Foto de publicacion'>";
	    echo $row['Contenido'];
	  echo "</div>";
	   echo "<div class='panel panel-footer';>";
	    echo $row['FHCreado'];
	  echo "</div>"; 
	echo"</div>";


		//echo $row["Titulo"];
	}
echo "<div>";


	}

echo "</div>";


?>
<!--Modales-->




</div>
<?php include 'pie.php'; ?>
