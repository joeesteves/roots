ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','estado','desc','desde', 'hasta']
	propiedades = [['Estado','auto'],['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción'],['desde','auto'],['hasta','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)
