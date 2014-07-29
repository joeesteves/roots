ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	if $('#action_name').val() == 'edit'
		$('#rga_registro_evento_id').prop('disabled',true).trigger("chosen:updated")
	$('#rga_registro_evento_id').change ->
		empresa_id = 1
		establecimiento_id = 1
		origcategoria_id = 1
		origrodeo_id = 1 
		origestado_id = 25
		$.fn.animalesDisponibles(empresa_id,establecimiento_id,origcategoria_id, origrodeo_id, origestado_id)

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','origcategoria','origrodeo','origestado','destcategoria','destrodeo','destestado','cantidad','peso','dest']
	propiedades = [['Fecha','auto'],['origcategoria','auto'],['origrodeo','auto'],['origestado','auto'],['destcategoria','auto'],['destrodeo','auto'],['destestado','auto'],['cantidad','auto'],['peso','auto'],['desc','auto','Descripcion']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

$(document).on('page:load', ready)
$(document).ready(ready)