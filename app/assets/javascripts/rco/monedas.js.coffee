ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre']
	propiedades = [['Codigo','auto'],['Nombre','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
	
$(document).on('page:load', ready)
$(document).ready(ready)