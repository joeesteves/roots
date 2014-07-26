ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','origcategoria','origrodeo','origestado','destcategoria','destrodeo','destestado','cantidad','peso','dest']
	propiedades = [['Fecha','auto'],['origcategoria','auto'],['origrodeo','auto'],['origestado','auto'],['destcategoria','auto'],['destrodeo','auto'],['destestado','auto'],['cantidad','auto'],['peso','auto'],['desc','auto','Descripcion']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

$(document).on('page:load', ready)
$(document).ready(ready)