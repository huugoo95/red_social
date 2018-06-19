<?php

$dsn = 'mysql:dbname=RedSocial;host=localhost;charset=UTF8';
$usuario = 'hugo';
$contraseña = 'abcd1234.PI';

/*
$mysqli = new mysqli("localhost", "pi", "abcd1234.", "RedSocial");
echo "hoa";
if ($mysqli->connect_errno) {
    printf("Falló la conexión: %s\n", $mysqli->connect_error);
    //exit();
}else{
	echo "me conecto ";
}
*/

try {
    $gbd = new PDO($dsn, $usuario, $contraseña);
} catch (PDOException $e) {
    echo 'Falló la conexión: ' . $e->getMessage();
}


 ?>
