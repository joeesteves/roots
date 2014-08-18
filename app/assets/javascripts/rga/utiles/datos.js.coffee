$.fn.animalesDisponibles = (empresa_id, establecimiento_id, origcategoria_id, origrodeo_id, origestado_id) ->
	$.ajax
		type: "POST"
		url: $('#root_path').val() + 'rga/animales/disponibles'
		data:
			empresa_id: empresa_id
			establecimiento_id: establecimiento_id
			origcategoria_id: origcategoria_id
			origrodeo_id: origrodeo_id
			origestado_id: origestado_id
		dataType: "script"

$.fn.eventoTipoCodigo = (evento_id) ->
	$.ajax
		type: "GET"
		url: $('#root_path').val() + 'rga/eventos/' + evento_id + '/tipocodigo'
		dataType: "script"
