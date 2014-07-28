ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','cuenta',['debe','float'],'haber',['saldo','float'],'desc']
	propiedades = [['id','20%'],['Fecha','auto'],['Cuenta','auto'],['Debe','auto'],
	['Haber','auto'],['Saldo','auto'],['desc','auto', 'Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades, query, 'cuenta')	
	
$(document).on('page:load', ready)
$(document).ready(ready)