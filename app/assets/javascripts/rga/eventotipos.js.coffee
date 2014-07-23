ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','estado','desc']
	propiedades = [['Estado','auto'],['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)
