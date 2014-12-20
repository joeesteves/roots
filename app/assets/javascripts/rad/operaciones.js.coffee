ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('.calcCuota').change ->
		calcularCuota()
	$('.calcCuotaInv').change ->
		calcularCuotaInv()
	$('#rad_operacion_operaciontipo_id').change ->
		interruptorCuotas(false); interruptorRdosxmes(true)
		actualizarCuentas($('#rad_operacion_operaciontipo_id option:selected').data('codigo'))
		defineUiXOpTipo($('#rad_operacion_operaciontipo_id option:selected').data('codigo'))
		
	if $('#action_name').val() != 'index'
		defineUiXOpTipo($('#rad_operacion_operaciontipo_id option:selected').data('codigo'))
		actualizarCuentas($('#rad_operacion_operaciontipo_id option:selected').data('codigo')) if $('#action_name').val() != 'edit'	

defineUiXOpTipo = (opTipoCodigo) ->
	switch opTipoCodigo
		#MOV DE FONDOS
		when 0 then interruptorCuotas(true); interruptorRdosxmes(true)
		#EGRESOS Y COBRANZAS
		when -1, 2 then (
			interruptorRdosxmes(false) if opTipoCodigo == -1
			actualizarCompatibles(getCuentaId("haber"),"debe")	
			activaCuentasCompatiblesOnChange("haber")
		)
		#INGRESOS Y PAGOS
		when 1, -2 then (
			interruptorRdosxmes(false) if opTipoCodigo == 1
			actualizarCompatibles(getCuentaId("debe"),"haber")
			activaCuentasCompatiblesOnChange("debe")
		)

interruptorCuotas = (posicion) ->
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('disabled', posicion)
interruptorRdosxmes = (posicion) ->
	$('#rad_operacion_rdosxmes').prop('disabled', posicion)

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','tipo', 'importe','desc','cuotaimporte']
	propiedades = [['Fecha','20%'],['Tipo','auto'],['Importe','20%'],['desc','auto', 'Descripción'],['cuotaimporte','auto','Cuota']]
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
		url: $('#root_path').val() + 'rco/cuentas/x_operacion_tipo'
		data:
			operaciontipo_codigo: operaciontipo_codigo
		dataType: "script"
		)

activaCuentasCompatiblesOnChange = (saldoTipo) ->
	switch saldoTipo
		when "debe" then (
			$('#rad_operacion_ctaD_id, #rad_operacion_ctaH_id').unbind("change")
			$('#rad_operacion_ctaD_id').change ->
				actualizarCompatibles(getCuentaId("debe"),"haber")
				alert("debe")
		)
		when "haber" then (
			$('#rad_operacion_ctaD_id, #rad_operacion_ctaH_id').unbind("change")
			$('#rad_operacion_ctaH_id').change ->
				actualizarCompatibles(getCuentaId("haber"),"debe")
				alert("haber")
		)

actualizarCompatibles = (cuenta_id, saldoTipo) ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rad/operaciones/compatibles'
		data:
			saldoTipo: saldoTipo
			cuenta_id: cuenta_id
		dataType: "script"
    )

getCuentaId = (saldoTipo) ->
	switch saldoTipo
		when "debe" then $('#rad_operacion_ctaD_id option:selected').val()
		when "haber" then $('#rad_operacion_ctaH_id option:selected').val()

$.fn.cargaCompatibles = (datos) ->
	$('#compatibles').empty()
	$('#compatibles').append('<select id="aplicaciones" name="aplicaciones[]" multiple></select>')
	$.each datos, (i) ->
		opcion = '<option value="'+ this.id + ', ' + this.disponible + '">' + 
		this.desc + 
		' disponible: '+ this.disponible +
		'</option>'
		$('#aplicaciones').append(opcion)
	$.fn.initChosen()

$(document).on('page:load', ready)
$(document).ready(ready)