





<div id="container" class="container">

</div>
<script src="js/java.js?w"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>


<script type="text/javascript">
	
	var seriesOptions = [],
    seriesCounter = 0,
    names = ['MSFT', 'AAPL', 'GOOG'];

function createChart() {

    Highcharts.stockChart('container', {

        rangeSelector: {
            selected: 4
        },

        title: {
		    text: 'Visitas diarias a mi perfil'
		},

        yAxis: {
            labels: {
                formatter: function () {
                    return (this.value > 0 ? ' + ' : '') + this.value + '%';
                }
            },
            plotLines: [{
                value: 0,
                width: 2,
                color: 'silver'
            }]
        },

        plotOptions: {
            series: {
                compare: 'percent',
                showInNavigator: true
            }
        },
                tooltip: {
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>',
            valueDecimals: 2,
            split: true
        },
<?php
    include_once("sql.php");

$consultarPublis = $gbd->prepare("select count(*) as cuenta from Visitas where userB='3' group by FHVisita ");
$consultarPublis->execute();
$arrayConsultarPublis=$consultarPublis->fetchAll();

while($row = array_shift($arrayConsultarPublis)) {
   $data[] = $row['cuenta'];

    }
?>
        series: [{
         data: [<?php echo join($data, ',') ?>],
         pointStart: 0,
         pointInterval
      }]
    });
}
/*
$.each(names, function (i, name) {

    $.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=' + name.toLowerCase() + '-c.json&callback=?',    function (data) {

        seriesOptions[i] = {
            name: name,
            data: data
        };

        // As we're loading the data asynchronously, we don't know what order it will arrive. So
        // we keep a counter and create the chart when all the data is loaded.
        seriesCounter += 1;

        if (seriesCounter === names.length) {
            createChart();
        }
    });
})*/
</script>

</body>
</html>