ready = ->
	if $('#action_name').val() == 'index'	
		jQuery.fn.acciones()
jQuery.fn.acciones = () ->
	$('#borrar').click ->
		$.ajax
			type: "POST"
			url: $('#controller_full_path').val() + '/borrar_seleccion'
			data:
				ids: jQuery.fn.getSelected()
			dataType: "script"
			complete: ->
				$('#jqxgrid').jqxGrid('updatebounddata')
				$("#jqxgrid").jqxGrid('clearselection')
	$('#nuevo').click ->
		if $('#nodo_actual').val() == ''
			nodo = ''
		else
			nodo = '?nodo=' + $('#nodo_actual').val()
		$(location).attr('href',$('#controller_full_path').val()+'/new'+ nodo)
	
	if $('#con_arbol').val() == 'true'
		$('#copiar').show()
		$('#pegar').show()

		$('#copiar').click ->
			$('#items_seleccionados').val(jQuery.fn.getSelected())
			console.log(jQuery.fn.getSelected())
		$('#pegar').click ->
			$.ajax
				type: "POST"
				url: $('#root_path').val() + 'rba/mover_items'
				data:
					arbol: $('#arbol_actual').val()
					nodo: $('#nodo_actual').val()
					items: $('#items_seleccionados').val()
				dataType: "script"
				complete: ->
					$('#jqxgrid').jqxGrid('updatebounddata')
					$("#jqxgrid").jqxGrid('clearselection')
					$('#items_seleccionados').val('')
	else
		$('#copiar').hide()
		$('#pegar').hide()




#Funcion le da funcionalidad al boton editar de la grilla def en index_grid
jQuery.fn.editar = (row) ->
	id = $("#jqxgrid").jqxGrid('getrowdata', row).id
	url = $('#controller_full_path').val() + "/" + id + "/edit"
	$(location).attr('href',url)

#Funcion para convertir los nombres que pasa cada index en un json utilizado por fx grid para obtener un array de objetos seleccionados
jQuery.fn.getSelected = ->
	seleccion = $('#jqxgrid').jqxGrid('getselectedrowindexes')
	seleccion_ids	= []
	$.each(seleccion, (row) ->
		seleccion_ids.push($('#jqxgrid').jqxGrid('getrowdata', seleccion[row]).id))
	seleccion_ids


$(document).on('page:load', ready)
$(document).ready(ready)
