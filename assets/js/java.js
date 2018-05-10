function agregarPubli() {
	if (window.File && window.FileReader && window.FileList && window.Blob) {
  // Great success! All the File APIs are supported.
	} else {
	  alert('The File APIs are not fully supported in this browser.');
	}

	/*

var files = evt.target.files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate.toLocaleDateString(), '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);


	*/
		var titulo=document.getElementById('tituloPublicacion').value;
		var texto=document.getElementById('textoPublicacion').value;
		var imagen=document.getElementById('imagenPublicacion').value;
	if (titulo=="" || texto=="") {
		alert("Es obligatorio escribir título o texto !")
	}else{

		$.ajax({ 
			data: {titulo:titulo,texto:texto,imagen:imagen},
			url: 'agregarPublicacion.php', 
			type: 'POST', 
			beforeSend: function () {
				$("#modalBody").html(" <img src=\"img/carga.gif\" /> Cargando ");
			},
			success:function (response) {$("#modalBody").html(response);location.reload(); }});	
	}
}


function modificarSeg(accion,seguidor,seguido) {

		$.ajax({ 
			data: {accion:accion,seguidor:seguidor,seguido:seguido},
			url: 'modificarSeg.php', 
			type: 'POST', 
			beforeSend: function () {
				$("#cabeceraUser").html(" <img src=\"img/carga.gif\" /> Cargando ");
			},
			//success:function (response) {alert("Vale cabrón!");}});	
			success:function (response) {location.reload();}});	

}


function verEstadisticas(id) {

		$.ajax({ 
			data: {id:id},
			url: 'estadisticas.php', 
			type: 'POST', 
			beforeSend: function () {
				$("#contenidoInferior").html(" <img src=\"img/carga.gif\" /> Cargando ");
			},
			//success:function (response) {alert("Vale cabrón!");}});	
			success:function (response) {$("#contenidoInferior").html(response);}});	

}


function comprobarRepetirPassword(argument) {
	
}