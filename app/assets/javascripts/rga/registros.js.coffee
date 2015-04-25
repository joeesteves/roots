ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$.fn.dynamicFormRegistros($('#eventoTipoCodigo').val())
	if $('#action_name').val() == 'edit'
		$('#rga_registro_evento_id').prop('disabled',true).trigger("chosen:updated")
	$('#rga_registro_evento_id').change ->
		evento_tipo_codigo = getCodigo()
		$.fn.dynamicFormRegistros(evento_tipo_codigo)
		$.fn.rgaActualizarCategorias($('#rga_registro_evento_id').val(), getCodigo())
	$('#rga_registro_origcategoria_id, #rga_registro_destcategoria_id').change ->
		$.fn.rgaActualizarEstados($('#rga_registro_evento_id').val(), $(this).val(), $(this).attr('id'), getCodigo())
		$('#rga_registro_peso').val($('option:selected', this).data('peso'))
	$('.actualizaDisponible').change -> 
		origcategoria_id = $('#rga_registro_origcategoria_id').val()
		origrodeo_id = $('#rga_registro_origrodeo_id').val()
		origestado_id = $('#rga_registro_origestado_id').val()
		$.fn.animalesDisponibles(origcategoria_id, origrodeo_id, origestado_id)
	switch $('#action_name').val()
		when 'new' then $.fn.rgaActualizarCategorias($('#rga_registro_evento_id').val(), getCodigo())
		when 'mostrar_planilla' then (
			desde = $('#filtro_desde').val()
			hasta = $('#filtro_hasta').val()
			$.fn.agregarFiltros([['desde','date',desde],['hasta','date',hasta]])
		)
		when 'mostrar_existencia' then (
			hasta = $('#filtro_hasta').val()
			$.fn.agregarFiltros([['hasta','date',hasta]])
		)
getCodigo = () ->
	$('#rga_registro_evento_id option:selected').data('codigo')


$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','evento','origcategoria','origrodeo','origestado','destcategoria','destrodeo','destestado','cantidad','peso','dest']
	propiedades = [['Fecha','auto'],['Evento','auto'],['origrodeo','auto', 'Orig Rodeo'],
	['origcategoria','auto', 'Orig Categoria'],['origestado','auto','Orig Estado'],['destrodeo','auto', 'Dest Rodeo'],
	['destcategoria','auto', 'Dest Categoria'], ['destestado','auto', 'Dest Estado'],['Cantidad','auto'], ['desc','auto','Descripcion']]
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