ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','nombre', 'modelo']
	propiedades = [['Nombre','auto'],['Modelo','auto']]
	$.fn.gridPrepDatos(nombres, propiedades)
	
$(document).on('page:load', ready)
$(document).ready(ready)
