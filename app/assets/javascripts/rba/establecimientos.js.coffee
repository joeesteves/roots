ready =  ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','superficie', 'desc']
	propiedades = [
		['Codigo','auto']
		['Nombre','auto']
		['desc','auto', 'Descripcion']
		['Superficie', 'auto']
	]
	
	$.fn.gridPrepDatos(nombres, propiedades, query, undefined)
	$('.agregar_campos').click () ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$('#container').append($(this).data('fields').replace(regexp, time))
		$.fn.initChosen()
		$('.chosen-single:visible').last().focus()
		activaComportamientoLinea()
		return false

	activaComportamientoLinea()		

activaComportamientoLinea = () ->
	$('.simil_agrega_campos').click () ->
		$('.agregar_campos').click()
		return false
	$('.quitar_campos').click () ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		try $('.chosen-single:visible')[1].focus()
		return false



	
$(document).on('page:load', ready)
$(document).ready(ready)
