function agregarPubli() {

	var formulario = $("#formulario_publicacion");
    formdata = new FormData(formulario[0]);

	if (document.getElementById('tituloPublicacion').value=="" || document.getElementById('textoPublicacion').value=="") {
		alert("Es obligatorio escribir título y texto !")
	}else{
		$.ajax({ 
			data: formdata,
			url: 'agregarPublicacion.php', 
			type: 'POST',
			processData: false,
			contentType: false,			
			beforeSend: function () {
				$("#modalBody").html(" <img src=\"assets/img/carga.gif\" /> Cargando ");
			},
			success:function (response) {
				$("#modalBody").html(response);location.reload(); 
			}
		});	
	}
}


function modificarSeg(accion,seguidor,seguido) {

		$.ajax({ 
			data: {accion:accion,seguidor:seguidor,seguido:seguido},
			url: 'modificarSeg.php', 
			type: 'POST', 
			beforeSend: function () {
				$("#cabeceraUser").html(" <img src=\"assets/img/carga.gif\" /> Cargando ");
			},
			//success:function (response) {alert("Vale cabrón!");}});	
			success:function (response) {location.reload();}});	

}


function verEstadisticas(id) {

		$.ajax({ 
			data: {"id":id},
			url: 'estadisticas.php', 
			type: 'POST', 
			beforeSend: function () {
				$("#contenidoInferior").html(" <img src=\"assets/img/carga.gif\" /> Cargando ");
			},
			//success:function (response) {alert("Vale mozo!");}});	
			success:function (response) {$("#contenidoInferior").html(response);}});	

}


function comprobarRepetirPassword(argument) {
	
}