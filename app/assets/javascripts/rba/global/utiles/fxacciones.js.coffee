$.fn.acciones = () ->
	$('#borrar').click ->
		$.fn.borrar()
	$('#nuevo').click ->
		$.fn.nuevo()	
	$('#editar').click ->
		$.fn.editar()
	if $('#con_arbol').val() == 'true'
		$('#copiar').show()
		$('#pegar').show()
		$('#copiar').click ->
			$.fn.copiar()
		$('#pegar').click ->
			$.fn.pegar()
	else
		$('#copiar').hide()
		$('#pegar').hide()
	$('#importar').click ->
		$.fn.cerrarMenu()

$.fn.borrar = () ->
	if confirm('Quiere borrar ' + $.fn.getSelected().length + ' elementos ?')
		$.ajax
			type: "POST"
			url: $('#controller_full_path').val() + '/borrar_seleccion'
			data:
				ids: $.fn.getSelected()
			dataType: "script"
			complete: ->
				$('#jqxgrid').jqxGrid('updatebounddata')
				$("#jqxgrid").jqxGrid('clearselection')
		
$.fn.nuevo = () ->
	if $('#nodo_actual').val() == ''
		nodo = ''
	else
		nodo = '?nodo=' + $('#nodo_actual').val()
	$(location).attr('href',$('#controller_full_path').val()+'/new'+ nodo)
	
$.fn.editar = () ->
	items = $.fn.getSelected()
	nodo = $('#nodo_actual').val()
	$(location).attr('href',$('#controller_full_path').val()+
		'/editar_multiples?items='+ items + '&nodo=' + nodo)

$.fn.copiar = () ->
		$('#items_seleccionados').val($.fn.getSelected())

$.fn.pegar = () ->
	$.ajax
		type: "POST"
		url: $('#root_path').val() + 'rba/mover_items'
		data:
			controller_path: $('#controller_path').val()
			nodo: $('#nodo_actual').val()
			items: $('#items_seleccionados').val()
		dataType: "script"
		complete: ->
			$('#jqxgrid').jqxGrid('updatebounddata')
			$("#jqxgrid").jqxGrid('clearselection')
			$('#items_seleccionados').val('')
	
# Funcion global para revelar div id=filtro
$.fn.abrirFiltros = () ->
	$('#filtro').foundation('reveal', 'open')

#Funcion le da funcionalidad al boton editar de la grilla def en grid_prep_datos
$.fn.editaRow = (row) ->
	if $('#controller_full_path').val() == "/rco/registros"
		id = $("#jqxgrid").jqxGrid('getrowdata', row).id_padre
		url = "/rco/asientos" + "/" + id + "/edit"
	else
		id = $("#jqxgrid").jqxGrid('getrowdata', row).id
		url = $('#controller_full_path').val() + "/" + id + "/edit"
	$(location).attr('href',url)

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid para obtener un array de objetos seleccionados
$.fn.getSelected = ->
	seleccion = $('#jqxgrid').jqxGrid('getselectedrowindexes')
	seleccion_ids	= []
	$.each(seleccion, (row) ->
		seleccion_ids.push($('#jqxgrid').jqxGrid('getrowdata', seleccion[row]).id))
	seleccion_ids

$.fn.cerrarMenu = ->
	$('.has-dropdown').removeClass('hover')