//= require index_acciones

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
			$("#jqxgrid").jqxGrid()
		#		$("#jqxgrid").jqxGrid('hidecolumn', 'id')
		columnsresize: true,
		columns: col_props,
		width: '100%',
		groupable: true,
		selectionmode: 'checkbox',
		filterable: true,
		pageable: true

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid
jQuery.fn.fill_datafields = (col_nombres) ->
	a = []
	a.push({"name": nombre}) for nombre in col_nombres
	b = JSON.stringify(a)
	c = JSON.parse(b)




