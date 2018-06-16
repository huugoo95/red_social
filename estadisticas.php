
<?php 

include_once("sql.php");
$id_user=$_POST['id'];


$consultarPublis = $gbd->prepare("select count(*) as cuenta, FHVisita from Visitas where userB='$id_user' group by day(FHVisita) ");
$consultarPublis->execute();
$arrayConsultarPublis=$consultarPublis->fetchAll();

while($row = array_shift($arrayConsultarPublis)) {
   $fecha_ms=strtotime($row['FHVisita']." GMT")*1000;
   $total_visitas[] = [$fecha_ms,(float)$row['cuenta']];
}
/*
echo "<pre>";
echo json_encode($total_visitas);
echo "</pre>";
die();*/
 ?>


<div id="graf">

</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/stock/modules/export-data.js"></script>

<div id="container" style="height: 400px; min-width: 310px"></div>
<script type="text/javascript">

  // Create the chart
  Highcharts.stockChart('container', {


    rangeSelector: {
      selected: 1
    },

    title: {
      text: 'Visitas diarias a tu perfil'
    },

    series: [{
      name: 'visitas',
      data: <?php echo json_encode($total_visitas); ?>,
      tooltip: {
        valueDecimals: 2
      }
    }]
  });



</script>
