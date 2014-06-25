ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','tipo','grupo','desc','estado']
	propiedades = [['Codigo','auto'],['Nombre','auto'],['Tipo','auto'],
	['Grupo','auto'],['desc','auto', 'Descripción'],['Estado','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
	
$(document).on('page:load', ready)
$(document).ready(ready)