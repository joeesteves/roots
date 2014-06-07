jQuery.fn.acciones = () ->
	$('#borrar').click ->
		$.ajax
			type: "POST"
			url: $('#controller_path').val() + '/borrar_seleccion'
			data:
				ids: jQuery.fn.getSelected()
			dataType: "script"
			complete: ->
				$('#jqxgrid').jqxGrid('updatebounddata')
				$("#jqxgrid").jqxGrid('clearselection')
	$('#nuevo').click ->
		$(location).attr('href',$('#controller_path').val()+'/new')

#Funcion le da funcionalidad al boton editar de la grilla def en index_grid
jQuery.fn.editar = (row) ->
	id = $("#jqxgrid").jqxGrid('getrowdata', row).id
	url = $('#controller_path').val() + "/" + id + "/edit"
	$(location).attr('href',url)

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid para obtener un array de objetos seleccionados
jQuery.fn.getSelected = ->
	seleccion = $('#jqxgrid').jqxGrid('getselectedrowindexes')
	seleccion_ids	= []
	$.each(seleccion, (row) ->
		seleccion_ids.push($('#jqxgrid').jqxGrid('getrowdata', seleccion[row]).id))
	seleccion_ids