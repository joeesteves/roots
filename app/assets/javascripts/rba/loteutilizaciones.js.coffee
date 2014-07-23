ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','estado','desc','campana','actividad','lote','superficie']
	propiedades = [['Estado','auto'],['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción'],['Campana','auto','Campaña'],['Actividad','auto'],['Lote','auto'],['Superficie','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)

