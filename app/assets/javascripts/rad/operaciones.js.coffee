ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('.calcCuota').change ->
		calcularCuota()
	$('.calcCuotaInv').change ->
		calcularCuotaInv()
	$('#rad_operacion_operaciontipo_id').change ->
		if $('#rad_operacion_operaciontipo_id option:selected').data('codigo') == 0
			$('#rad_operacion_cuotas, #rad_operacion_rdosxmes, #rad_operacion_cuotaimporte')
			.prop('disabled', true)
		else
			$('#rad_operacion_cuotas, #rad_operacion_rdosxmes, #rad_operacion_cuotaimporte')
			.prop('disabled', false)
		actualizarCuentas($('#rad_operacion_operaciontipo_id option:selected').data('codigo'))


$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','operaciontipo_id', 'importe']
	propiedades = [['Fecha','20%'],['Importe','20%'],['Operaciontipo_id','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	

calcularCuota = () -> 
	importe = $('#rad_operacion_importe').val()
	cuotas = $('#rad_operacion_cuotas').val()
	importeCuota = (importe/cuotas).toFixed(2)
	$('#rad_operacion_cuotaimporte').val(importeCuota)

calcularCuotaInv = () -> 
	cuotas = $('#rad_operacion_cuotas').val()
	importeCuota = $('#rad_operacion_cuotaimporte').val()
	importe = (importeCuota * cuotas).toFixed(2)
	$('#rad_operacion_importe').val(importe)

actualizarCuentas = (operaciontipo_codigo) ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rco/cuentas/cuentas_para_operacion'
		data:
			operaciontipo_codigo: operaciontipo_codigo
		dataType: "script"
    )
		

$(document).on('page:load', ready)
$(document).ready(ready)