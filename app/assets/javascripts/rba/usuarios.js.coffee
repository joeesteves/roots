ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest($('#nodo_actual').val())

$.fn.gridRequest = (query) ->
	nombres = ['id','nombre','apellido','mail']
	propiedades = [['Nombre','auto'],['Apellido','auto'],['Mail','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
	
$(document).on('page:load', ready)
$(document).ready(ready)