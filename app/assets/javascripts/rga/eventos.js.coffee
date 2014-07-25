ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('#rga_evento_destestado_ids_chosen').css('width','100%')
	$('#rga_evento_origestado_ids_chosen').css('width','100%')
	muestraEstados($('#eventoTipoCodigo').val())
	$('#rga_evento_eventotipo_id').change ->
		codigo = $('#rga_evento_eventotipo_id option:selected').data('codigo')
		muestraEstados(codigo)

	$('#rco_asiento_moneda_id').change () ->
		codigo = $('#rco_asiento_moneda_id option:selected').data('cot')
		$('#rco_asiento_cotizacion').val(cot)

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','estado','desc','tipo']
	propiedades = [['Estado','auto'],['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción'],['Tipo','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

muestraEstados = (eventoTipoCodigo) ->
	if eventoTipoCodigo == "O"
		muestraOrigen()
	else if eventoTipoCodigo == "D"
		muestraDestino()
	else 
		muestraAmbas()

muestraOrigen = () ->
	$('#destestados').hide()
	$('#origestados').removeClass('small-6')
	$('#origestados').addClass('small-12')	
	$('#origestados').show()

muestraDestino = () ->
	$('#origestados').hide()
	$('#destestados').removeClass('small-6')
	$('#destestados').addClass('small-12')
	$('#destestados').show()

muestraAmbas = () ->
	$('#destestados, #origestados').removeClass('small-12')
	$('#destestados, #origestados').addClass('small-6')
	$('#origestados').show()
	$('#destestados').show()
	












$(document).on('page:load', ready)
$(document).ready(ready)
