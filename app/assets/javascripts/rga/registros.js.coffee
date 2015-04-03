ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$.fn.dynamicFormRegistros($('#eventoTipoCodigo').val())
	if $('#action_name').val() == 'edit'
		$('#rga_registro_evento_id').prop('disabled',true).trigger("chosen:updated")
	$('#rga_registro_evento_id').change ->
		evento_tipo_codigo = $('#rga_registro_evento_id option:selected').data('codigo')
		$.fn.dynamicFormRegistros(evento_tipo_codigo)		
		$.fn.rgaActualizarSelectores($('#rga_registro_evento_id').val())
	$('.actualizaDisponible').change -> 
		empresa_id = $('#empresa_actual_id').val()
		establecimiento_id = $('#establecimiento_actual_id').val()
		origcategoria_id = $('#rga_registro_origcategoria_id').val()
		origrodeo_id = $('#rga_registro_origrodeo_id').val()
		origestado_id = $('#rga_registro_origestado_id').val()
		$.fn.animalesDisponibles(empresa_id,establecimiento_id,origcategoria_id, origrodeo_id, origestado_id)

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','origcategoria','origrodeo','origestado','destcategoria','destrodeo','destestado','cantidad','peso','dest']
	propiedades = [['Fecha','auto'],['origcategoria','auto'],['origrodeo','auto'],['origestado','auto'],['destcategoria','auto'],['destrodeo','auto'],['destestado','auto'],['cantidad','auto'],['peso','auto'],['desc','auto','Descripcion']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

$.fn.dynamicFormRegistros = (eventoTipoCodigo) ->
	switch parseInt(eventoTipoCodigo)
		when -1 
			$.fn.dynamicForm(['origcategoria', 'origrodeo', 'origestado', 'divDisponibles'], ['destcategoria','destrodeo','destestado'])
		when 1
			$.fn.dynamicForm(['destcategoria','destrodeo','destestado'],['origcategoria', 'origrodeo', 'origestado','divDisponibles'])
		when 2
			$.fn.dynamicForm(['destcategoria','destrodeo','destestado','origcategoria', 'origrodeo', 'origestado','divDisponibles'],[])


$(document).on('page:load', ready)
$(document).ready(ready)