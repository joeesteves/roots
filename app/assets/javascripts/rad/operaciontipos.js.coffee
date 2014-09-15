ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','estado']
	propiedades = [['Codigo','20%'],['Nombre','20%'],['Estado','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)