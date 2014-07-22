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

	$('form').on 'click', '.simil_agrega_campos', () ->
		$('.agregar_campos').click()
	
	$('form').on 'click', '.quitar_campos', () ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		$('.chosen-single:visible')[1].focus()

	
$(document).on('page:load', ready)
$(document).ready(ready)
