<!--Fichero utilizado para buscar posibles amigos dentro de la red social-->
<?php 
	include 'cabecera.php';
	include 'sql.php';
	include 'navbar.php';
?>

<div class="container-fluid">

<?php 

		$amiwi=$_POST["amiwi"];

		echo "<h2>Resultados para la búsqueda '$amiwi'</h2>";
		$gbd->exec("SET CHARACTER SET utf8");
		$consultarAmiwis = $gbd->prepare("select * from Usuarios where ID<>".$_SESSION['ID']." and Nombre like '%$amiwi%' ");
		$consultarAmiwis->execute();
		$arrayConsultarAmiwis=$consultarAmiwis->fetchAll();

		while($row = array_shift($arrayConsultarAmiwis)) {
			echo "<div class='panel panel-default'>";
			  echo "<div class='panel panel-heading'>";
			    echo "<a href='user.php?usu=".$row['ID']."' <h2 class='panel-title'>".$row['Nombre']."</h2></a>";
			  echo "</div>";
			  echo "<div class='panel panel-body' >";
	    		echo "<IMG SRC='assets/img/".$row['ID']."/perfil.jpeg' WIDTH=250 HEIGHT=220 BORDER=2 VSPACE=3 HSPACE=3 ALT='Foto de perfil'>";
			     echo $row['Descripcion'];
			  echo "</div>";
			   echo "<div class='panel panel-footer' >";
			    echo $row['FHCreado'];
			  echo "</div>"; 
			echo"</div>";
			//echo $row["Titulo"];bre like '$amiwi' 
		}
		
echo "</div>";
include_once("pie.php"); 
?>



