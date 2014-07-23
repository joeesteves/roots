ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','estado','codigo','rp','nombre','alias','desc','color','madre','padre']
	propiedades = [['Estado','auto'],['Codigo','auto'],['Rp','auto'],['Nombre','auto'],['Alias','auto'],['Desc','auto','Descripción'],['Color','auto'],['Madre','auto'],['Padre','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

$(document).on('page:load', ready)
$(document).ready(ready)