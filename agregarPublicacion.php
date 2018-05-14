<?php 
print_r($_FILES);

include 'sql.php';
session_start();
$Titulo=$_POST["titulo"];
$Contenido=$_POST["texto"];
//$imagen=$_POST["imagen"];
$hoy = date("Y-m-d H:i:s"); 
    $carpetaDestino="img/";

 
    # si hay algun archivo que subir
/*
    if($_FILES["archivo"]["name"][0])

    {

 

        # recorremos todos los arhivos que se han subido

        for($i=0;$i<count($_FILES["archivo"]["name"]);$i++)

        {

 

            # si es un formato de imagen

            if($_FILES["archivo"]["type"][$i]=="image/jpeg" || $_FILES["archivo"]["type"][$i]=="image/pjpeg" || $_FILES["archivo"]["type"][$i]=="image/gif" || $_FILES["archivo"]["type"][$i]=="image/png")

            {

 

                # si exsite la carpeta o se ha creado

                if(file_exists($carpetaDestino) || @mkdir($carpetaDestino))

                {

                    $origen=$_FILES["archivo"]["tmp_name"][$i];

                    $destino=$carpetaDestino.$_FILES["archivo"]["name"][$i];

 

                    # movemos el archivo

                    if(@move_uploaded_file($origen, $destino))

                    {

                        echo "<br>".$_FILES["archivo"]["name"][$i]." movido correctamente";

                    }else{

                        echo "<br>No se ha podido mover el archivo: ".$_FILES["archivo"]["name"][$i];

                    }

                }else{

                    echo "<br>No se ha podido crear la carpeta: up/".$user;

                }

            }else{

                echo "<br>".$_FILES["archivo"]["name"][$i]." - NO es imagen jpg";

            }

        }

    }else{

        echo "<br>No se ha subido ninguna imagen";

    }*/
/*if ($_FILES['imagen']['type'] == "image/jpeg") {
	if ($_FILES['imagen']['size'] <= 2000000) {
	copy($_FILES['imagen']['tmp_name'], "nuevaImagen.jpg");
	}
}*/

        if (isset($_POST["imagen"])){   //si tiene imagenes para subir      
            $nombreDirectorio ="ima";  
            for ($i=0;$i<count($_FILES["imagenes"]["name"]);$i++){
                if (file_exists($nombreDirectorio) || mkdir($nombreDirectorio,0777,true)){ //mkdir crea la ruta de directorio, si no existe

                    $origen=$_FILES["imagenes"]["tmp_name"][$i];
                    $destino=$nombreDirectorio."/".$_FILES["imagenes"]["name"][$i];

                    if(move_uploaded_file($origen, $destino))
                    {
                        echo "Fichero subido: ".$_FILES["imagenes"]["name"][$i]."<br/>";
                        echo "<img src=\"$destino\"  alt=\"foto\"><br/>"; 
                    } else {
                        echo "Ha habido algún error al subir el archivo<br/>";
                    }

                } else {
                    echo "No se ha creado la carpeta<br/>";
                }
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

$queryInsert="Insert into Publicaciones (IDUser, Titulo, Contenido, img, FHCreado) VALUES (".$_SESSION['ID'].", '$Titulo','$Contenido','$imagen', '$hoy')";

$gbd->query($queryInsert);

//header("Refresh:3");
 ?>