ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest($('#nodo_actual').val())


$.fn.gridRequest = (query) ->
	nombres = ['id','nombre','estado','desc']
	propiedades = [['Estado','5%'],['Nombre','40%'],['Desc','auto','Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)
