ready = ->
	if $('#action').val() == 'index'
		index() 
index = () ->
	url = $('#root_path').val() + "rba/usuarios.json"
	source =
  datatype: "json",
  datafields: [
      { name: 'id' },
      { name: 'nombre' },
      { name: 'apellido'},
      { name: 'mail'},

  ],
  id: 'id',
  url: url
	
	dataAdapter = new $.jqx.dataAdapter(source)
	$("#jqxgrid").jqxGrid
		source: dataAdapter,
		ready: ->
			$("#jqxgrid").jqxGrid('hidecolumn', 'id')
		columnsresize: true,
		columns: [
			{ text: 'Id', datafield: 'id', width: 'auto' },
			{ text: 'Nombre', datafield: 'nombre', width: 'auto' },
			{ text: 'Apellido', datafield: 'apellido', width: 'auto' },
			{ text: 'mail', datafield: 'mail', width: 'auto' },
			],
		width: '100%',
		groupable: true,
		selectionmode: 'checkbox',
		filterable: true,
		pageable: true
	$('#borrar').click ->
		$.ajax
			type: "POST"
			url: $('#root_path').val() + "agendas/usuarios_all"
			data:
				ids: jQuery.fn.getSelected()
			dataType: "script"

$(document).ready(ready)
$(document).on('page:load', ready)

jQuery.fn.getSelected = ->
	seleccion = $('#jqxgrid').jqxGrid('getselectedrowindexes')
	seleccion_ids	= []
	$.each(seleccion, (k,v) ->
		seleccion_ids.push($('#jqxgrid').jqxGrid('getrowdata', v).id))
	return seleccion_ids

