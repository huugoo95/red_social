<?php 
/*echo "<pre>";
print_r($_FILES);
echo "</pre>";
echo "<pre>";
print_r($_POST);
echo "</pre>";
*/

include 'sql.php';
session_start();
$Titulo=$_POST["titulo"];
$Contenido=$_POST["texto"];

$hoy = date("Y-m-d H:i:s"); 

//Insertamos la publicacion (título y contenido)
$queryInsert="Insert into Publicaciones (IDUser, Titulo, Contenido, FHCreado) VALUES (".$_SESSION['ID'].", '$Titulo','$Contenido', '$hoy')";
$gbd->query($queryInsert);

$query_leer_id = "SELECT max(IDPubli) from Publicaciones where IDUser=".$_SESSION['ID']." " ;
$leer_id = $gbd->prepare($query_leer_id, array(PDO::ATTR_CURSOR => PDO::CURSOR_SCROLL));
$leer_id->execute();

while ($fila = $leer_id->fetch(PDO::FETCH_NUM, PDO::FETCH_ORI_NEXT)) {
  $id_carpeta = $fila[0];
}

$nombreDirectorio ="assets/img/publicaciones/$id_carpeta"; 
//echo $nombreDirectorio;

//Creamos carpeta donde se alojará la imagen y moveremos allí la imagen
if (isset($_FILES["imagenPublicacion"])){   //si existe imagen para subir      
    $nombreDirectorio ="assets/img/publicaciones/$id_carpeta";  
    if (mkdir($nombreDirectorio,0770,true)){ //mkdir crea la ruta de directorio, si no existe

        $origen=$_FILES["imagenPublicacion"]["tmp_name"];
        $destino=$nombreDirectorio."/".$_FILES["imagenPublicacion"]["name"];
        $ruta_img_sql="UPDATE Publicaciones set img='".$_FILES['imagenPublicacion']['name']."' where IDPubli='$id_carpeta' ";
        echo "\n $ruta_img_sql";
        $gbd->query($ruta_img_sql);

        if(move_uploaded_file($origen, $destino))
        {
            echo "Fichero subido: ".$_FILES["imagenPublicacion"]["name"]."<br/>";
            echo "<img src=\"$destino\"  alt=\"foto\"><br/>"; 
        } else {
            echo "Ha habido algún error al subir el archivo<br/>";
        }

    }else {
        echo "No se ha creado la carpeta<br/>";
    }
}else {

    /*?>
                Inserción de fotografías:
                <p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"])?>" method="post" enctype="multipart/form-data">
                    Selecciona las fotografías:<input type="file" name="imagenes[]" multiple="multiple"/><br/><br/>
                    Guardar en? <input type="text" name="dir"/><br/><br/>
                    <input type ="submit" name="submit" value="Enviar">
                </form>
                </p>

    <?php */          
}                   


?>