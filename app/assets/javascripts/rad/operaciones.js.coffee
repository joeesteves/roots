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
		$.fn.defineUiXOpTipo([$('#rad_operacion_operaciontipo_id option:selected').data('codigo'), undefined])
		
	switch $('#action_name').val()
		when 'new' then actualizarCuentas($('#rad_operacion_operaciontipo_id option:selected').data('codigo'))		
		when 'edit' then $.fn.defineUiXOpTipo([$('#rad_operacion_operaciontipo_id option:selected').data('codigo'), $('#rad_operacion_id').val()])
		when 'create' then $.fn.defineUiXOpTipo([$('#rad_operacion_operaciontipo_id option:selected').data('codigo'), undefined])

	$('.agregar_campos_D, .agregar_campos_H').click () ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		if $(this).attr("class").match(/agregar_campos_D/g) != null
			afterRow = '.row.debe:last' 
		else
			afterRow = '.row.haber:last'
		$(afterRow).after($(this).data('fields').replace(regexp, time))
		
		$.fn.initChosen()
		$('.chosen-single:visible').last().focus()
		return false

	$('form').on 'click', '.simil_agrega_campos_D', () ->
		$('.agregar_campos_D').click()
		return false
	$('form').on 'click', '.simil_agrega_campos_H', () ->
		$('.agregar_campos_H').click()
		return false

	$('form').on 'click', '.quitar_campos', () ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').remove()
		$('.chosen-single:visible')[1].focus()
		return false


$.fn.defineUiXOpTipo = (opcionesArray) ->
	# opcionesArray [opCodigo, operacion_id (si es edit)]
	switch opcionesArray[0]
		#MOV DE FONDOS
		when 0 then interruptorCuotas(true); interruptorRdosxmes(true)
		#EGRESOS Y COBRANZAS
		when -1, 2, -3 then (
			if opcionesArray[0] == -3
				interruptorRdosxmes(false) 
			else
				interruptorRdosxmes(true) 
			if opcionesArray[1] == undefined
				actualizarCompatibles(["buscaPorCta", getCuentaId("haber"),"haber"])
			else
				actualizarCompatibles(["buscaPorReg", opcionesArray[1], "haber"])
			activaCuentasCompatiblesOnChange("haber")
		)
		#INGRESOS Y PAGOS
		when 1, -2, 3 then (
			if opcionesArray[0] == 3
				interruptorRdosxmes(false) 
			else
				interruptorRdosxmes(true) 
			if opcionesArray[1] == undefined
				actualizarCompatibles(["buscaPorCta", getCuentaId("debe"),"debe"])
			else
				actualizarCompatibles(["buscaPorReg", opcionesArray[1], "debe"])
			activaCuentasCompatiblesOnChange("debe")
		)

interruptorCuotas = (posicion) ->
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('readonly', posicion)
interruptorRdosxmes = (posicion) ->
	$('#rad_operacion_rdosxmes').prop('disabled', posicion)
	$('#rad_operacion_rdosxmes').prop('checked', false) if posicion == true

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
				actualizarCompatibles(["buscaPorCta", getCuentaId("debe"),"debe"])
		)
		when "haber" then (
			$('#rad_operacion_ctaD_id, #rad_operacion_ctaH_id').unbind("change")
			$('#rad_operacion_ctaH_id').change ->
				actualizarCompatibles(["buscaPorCta", getCuentaId("haber"),"haber"])
		)
# [cuenta_id, saldoTipo] si es edit [rad_operacion_id]
actualizarCompatibles = (opcionesArray) ->
	if opcionesArray[0] == "buscaPorReg"
		data =
			rad_operacion_id: opcionesArray[1]
			saldoTipo: opcionesArray[2]
	else
		data = 
			saldoTipo: opcionesArray[2]
			cuenta_id: opcionesArray[1]
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rad/operaciones/compatibles'
		data: data
		dataType: "script"
    )

getCuentaId = (saldoTipo) ->
	switch saldoTipo
		when "debe" then $('#rad_operacion_ctaD_id option:selected').val()
		when "haber" then $('#rad_operacion_ctaH_id option:selected').val()

$.fn.cargaCompatibles = (datos) ->
	$('#compatibles').empty()
	$('#compatibles').append('<select  data-placeholder="Seleccionar registros" id="aplicaciones" name="aplicaciones[]" multiple></select>')
	$.each datos, (i) ->
		opcion = '<option id="'+ this.id + '" value="'+ this.id + ', ' + this.disponible + '" data-disponible="'+ this.disponible + '"' +
		'data-aplicado="'+ this.aplicadoATransaccion + '"' +
		'data-desc="'+this.desc+'">' + 
		this.desc + 
		' -- disp: '+ this.disponible +
		' -- venc: ' + this.fecha + 
		'</option>'
		$('#aplicaciones').append(opcion)
	$('#aplicaciones').change ->
		$('#compatiblesImporte').empty()
		$('#aplicaciones option:selected').each ->
			agregaEditorRegistro($(this),'onSelect')
		calculaImporte()
		$('#compatiblesImporte input').focus()

	$.fn.initChosen()

$.fn.seleccionaAplicados = (aplicados_ids) ->
	$('#aplicaciones ' + aplicados_ids).prop("selected", true).trigger("chosen:updated")
	$.each $('#aplicaciones ' + aplicados_ids), () ->
		agregaEditorRegistro($(this),'onRecord')

calculaImporte = () ->
	$('#rad_operacion_importe').val(0)
	$('#compatiblesImporte input').each ->
		id = $(this).attr("id").substr(4)
		opcion = $('#aplicaciones #' + id )
		$(this).val(opcion.data("disponible")) if parseFloat($(this).val()) > parseFloat(opcion.data("disponible")) 
		$('#rad_operacion_importe').val(parseFloat($('#rad_operacion_importe').val()) + parseFloat($(this).val()))
		opcion.val(id + ', ' + $(this).val()) 
	$('#rad_operacion_importe').change()
	
agregaEditorRegistro = (registro, momento) ->
	id = "reg_" + registro.attr("id")
	if registro.data("aplicado") == 'undefined' || momento == 'onSelect'
		valorEditorRegistro = registro.data("disponible")
	else
		valorEditorRegistro = registro.data("aplicado")

	$('#compatiblesImporte').append('<span>Ref: '+registro.data("desc")+'</span><input id='+id+' name='+id+' type="text" value="' + valorEditorRegistro + '">')
	$('#compatiblesImporte input').change ->
		calculaImporte()


$(document).on('page:load', ready)
$(document).ready(ready)