<?php 

$dsn = 'mysql:dbname=RedSocial;host=192.168.0.17;charset=UTF8';
$usuario = 'root';
$contraseña = 'oonujohc95pi';

//echo "string";
/*$mysqlic = new mysqli("83.165.22.246", "root", "oonujohc95pi", "RedSocial");
echo "hoa";
if ($mysqli->connect_errno) {
    printf("Falló la conexión: %s\n", $mysqli->connect_error);
    //exit();
}else{
	echo "string";
}*/

try {
    $gbd = new PDO($dsn, $usuario, $contraseña);
} catch (PDOException $e) {
    echo 'Falló la conexión: ' . $e->getMessage();
}
phpinfo();
 ?>