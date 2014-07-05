ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('form').on 'click', '.agregar_campos', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#container').append($(this).data('fields').replace(regexp, time))
    event.preventDefault()
	$('form').on 'click', '.quitar_campos', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		event.preventDefault()
$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','moneda','cotizacion']
	propiedades = [['Fecha','auto'],['Moneda','auto'],['Cotizacion','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
	
$(document).on('page:load', ready)
$(document).ready(ready)