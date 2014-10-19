ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest($('#nodo_actual').val())

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','desc']
	propiedades = [['Codigo','20%'],['Nombre','20%'],['desc','auto','Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
