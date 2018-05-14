
<?php

require_once 'assets/dompdf/autoload.inc.php';
include_once("sql.php");

session_start();
$usu=$_SESSION['ID'];
$nombre=$_SESSION['Nombre'];

use Dompdf\Dompdf;

if ( ! isset($_GET['pdf']) ) {
	$content = '<html>';
	$content .= '<head>';
	$content .= '<style>';
	$content .= 'body { font-family: DejaVu Sans; }';
	$content .= '</style>';
	$content .= '</head><body>';
	$content .= '<h1>Ejemplo generaci&oacute;n PDF</h1>';
	$content .= '<a href="export.php?pdf=1">Generar documento PDF</a>';
	$content .= '</body></html>';
	echo $content;
	exit;
}

$content = '<html>';
$content .= '<head>';
$content.='<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">';

$content .= '<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">';
$content .= '<style>';
 $content .= 'body{
    background: url("img/fondoWEB.jpg");
    color: white;
  }
  #myModal{
    color: black;

  }
  .panel-primary{
    border-radius:20px;

  }';
$content .= '</style>';
$content .= '</head><body>';
$content .= '<div class="container">';
$content .= '<h1>Publicaciones de $nombre </h1>';

$consultarPublis = $gbd->prepare("select * from Publicaciones where IDUser='$usu' order by FHCreado desc ");
$consultarPublis->execute();
$arrayConsultarPublis=$consultarPublis->fetchAll();

while($row = array_shift($arrayConsultarPublis)) {
$content .= "<div class='panel panel-primary'>";
$content .= "<div class='panel panel-heading'>";
$content .= "<h3 class='panel-title'>".$row['Titulo']."</h3>";
$content .=  "</div>";
$content .= "<div class='panel panel-body' style='color:black';>";
$content .= "<IMG  style='border-radius:20px' SRC='img/$usu/perfil.jpeg' WIDTH=250 HEIGHT=220 BORDER=2 VSPACE=3 HSPACE=3 ALT='Foto de publicacion'>";
$content .= $row['Contenido'];
$content .= "</div>";
$content .= "<div class='panel panel-footer' style='color:black';>";
$content .=  $row['FHCreado'];
$content .= "</div>"; 
$content .= "</div>";
}
$content .= '</body></html>';

//echo $content; exit;


$dompdf = new Dompdf();
$dompdf->loadHtml($content);
$dompdf->setPaper('A4', 'landscape'); // (Opcional) Configurar papel y orientación
$dompdf->render(); // Generar el PDF desde contenido HTML
$pdf = $dompdf->output(); // Obtener el PDF generado
$dompdf->stream(); // Enviar el PDF generado al navegador