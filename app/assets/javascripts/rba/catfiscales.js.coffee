ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = () ->
	nombres = ['id','codigo','nombre','desc']
	propiedades = [['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades)	
$(document).on('page:load', ready)
$(document).ready(ready)