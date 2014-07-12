ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','moneda', 'fecha', 'cotizacion']
	propiedades = [['Fecha','auto'],['Moneda','auto'],['Cotizacion','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query, 'moneda')	
	
$(document).on('page:load', ready)
$(document).ready(ready)