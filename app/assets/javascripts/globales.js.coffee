jQuery.fn.grid = (col_nombres, col_props)->
	jQuery.fn.acciones()
	url = $('#controller_path').val() + '.json'
	source =
	datatype: "json",
	datafields: jQuery.fn.fill_datafields(col_nombres),
	id: 'id',
	url: url

	dataAdapter = new $.jqx.dataAdapter(source)
	$("#jqxgrid").jqxGrid
		source: dataAdapter,
		ready: ->
			$("#jqxgrid").jqxGrid('hidecolumn', 'id')
		columnsresize: true,
		columns: col_props,
		width: '100%',
		groupable: true,
		selectionmode: 'checkbox',
		filterable: true,
		pageable: true

jQuery.fn.acciones = () ->
	$('#borrar').click ->
		$.ajax
			type: "POST"
			url: $('#controller_path').val() + '/delete_selection'
			data:
				ids: jQuery.fn.getSelected()
			dataType: "script"
			complete: ->
				$('#jqxgrid').jqxGrid('updatebounddata')
				$("#jqxgrid").jqxGrid('clearselection')

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid
jQuery.fn.fill_datafields = (col_nombres) ->
	a = []
	a.push({"name": nombre}) for nombre in col_nombres
	b = JSON.stringify(a)
	c = JSON.parse(b)

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid para obtener un array de objetos seleccionados

jQuery.fn.getSelected = ->
	seleccion = $('#jqxgrid').jqxGrid('getselectedrowindexes')
	seleccion_ids	= []
	$.each(seleccion, (k,v) ->
		seleccion_ids.push($('#jqxgrid').jqxGrid('getrowdata', v).id))
	return seleccion_ids