ready = ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()
	jQuery.fn.gridRequest()

jQuery.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','desc',]
	propiedades = [['Codigo','20%'],['Nombre','20%'],['Descripción','auto']]
	jQuery.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
