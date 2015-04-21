$.fn.animalesDisponibles = (origcategoria_id, origrodeo_id, origestado_id) ->
	$.ajax
		type: "POST"
		url: $('#root_path').val() + 'rga/animales/disponibles'
		data:
			origcategoria_id: origcategoria_id
			origrodeo_id: origrodeo_id
			origestado_id: origestado_id
		dataType: "script"

$.fn.rgaActualizarCategorias = (evento_id) ->
	$.ajax
		type: "GET"
		url: $('#root_path').val() + 'rga/eventos/' + evento_id + '/actualizar_categorias'
		dataType: "script"

$.fn.rgaActualizarEstados = (evento_id, categoria_id, solicitante) ->
	$.ajax
		type: "GET"
		url: $('#root_path').val() + 'rga/eventos/' + evento_id + '/actualizar_estados'
		data:
			categoria_id: categoria_id
			solicitante: solicitante
		dataType: "script"
