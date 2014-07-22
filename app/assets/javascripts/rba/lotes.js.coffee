ready =  ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre', 'desc','establecimiento']
	propiedades = [
		['Establecimiento', 'auto']
		['Codigo','auto']
		['Nombre','auto']
		['desc','auto', 'Descripcion']
	]
	
	$.fn.gridPrepDatos(nombres, propiedades, query)

	
$(document).on('page:load', ready)
$(document).ready(ready)
