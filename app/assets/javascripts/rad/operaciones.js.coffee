ready = ->
	$.fn.comun()
	$('.calcularValores').change ->
		calcularValores({})
	$('#rad_operacion_operaciontipo_id').change ->
		interruptorCuotas("I"); interruptorRdosxmes("O")
		actualizarCuentas()
	$('#rad_operacion_organizacion_id').change ->
		actualizarCompatibles()
	switch $('#action_name').val()
		when 'new' then actualizarCuentas()
		when 'edit','create' then $.fn.defineUiXOpTipo()
	$('.agregar_campos_D, .agregar_campos_H').click () ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		if $(this).attr("class").match(/agregar_campos_D/g) != null
			after_row = '.row.debe'
			container_class = 'ContainerDebe'
		else
			after_row = '.row.haber'
			container_class = 'ContainerHaber'
		if $(after_row).length != 0
			$(after_row + ':last').after($(this).data('fields').replace(regexp, time))
			$(after_row + ':last select').empty().append($(after_row + ':first select option').clone()).trigger("chosen:updated")
		else
			$("#container."+container_class).append($(this).data('fields').replace(regexp, time)) 			
		$.fn.initChosen()
		activaCalculos(false)
		setPlaceHolder($('#rad_operacion_rdosxmes').prop('checked'))
		return false
	$('form').on 'click', '.simil_agrega_campos_D', () ->
		$('.agregar_campos_D').click()
		return false
	$('form').on 'click', '.simil_agrega_campos_H', () ->
		$('.agregar_campos_H').click()
		return false
	$('form').on 'click', '.quitar_campos', () ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').find('input.valor').val(0)
		$(this).closest('.row').find('input._destroy').val('true')
		$(this).closest('.row').hide()
		calculos()
		$('.chosen-single:visible')[1].focus()
		return false
	$('#rad_operacion_rdosxmes').click () ->
		setPlaceHolder($(this).prop('checked'))
		
activaCalculos = (ejecuta) ->
	lineasVivas = '.row.' + String(getInvSaldoAplicacion())
	calculos() if ejecuta == true
	$(lineasVivas + ' input[name*=valor], #rad_operacion_rdosxmes').change ->
		calculos()

armaArrayConOpcionesAgrupadas = (ood) ->
	cuenta_ant = undefined
	disponible = 0
	index = -1
	array = []
	$.each opcionesSeleccionadasOrdenadas(ood), () ->
		cuenta_actual = $(this).data("cuenta")
		if cuenta_actual == cuenta_ant
			disponible +=  parseFloat($(this).data("disponible"))
		else
			index += 1
			disponible = parseFloat($(this).data("disponible"))
		array[index] = {"cuenta": cuenta_actual, "disponible": disponible}
		cuenta_ant = cuenta_actual
	array

armaOpDesdeArrayConOpciones = (ood) ->
	opciones = armaArrayConOpcionesAgrupadas(ood)
	saldo_tipo = getSaldoAplicacion()
	seleccionarCuentas = () ->
		$('.row.' + saldo_tipo).each (i) ->
			$('select.' + saldo_tipo, this).val(opciones[i].cuenta)
			$('input[type=text].' + saldo_tipo, this).val(opciones[i].disponible.toFixed(2))
		$('.row.' + saldo_tipo + ' select').trigger("chosen:updated")
	if opciones.length  != $('.row.' + saldo_tipo).length
		$('.row.' + saldo_tipo).not(':first').empty()
		num = opciones.length
		while num -= 1
			$('a.agregar_campos_' + saldo_tipo[0].toUpperCase()).click()
	seleccionarCuentas()

actualizarCuentas = ()  ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rco/cuentas/x_operacion_tipo'
		data:
			operaciontipo_codigo: getOpTipo()
		dataType: "script"
		)

actualizarCompatibles = () ->
	switch $('#action_name').val()
		when 'edit' then (
			data =
				saldo_tipo: getSaldoAplicacion()
				rad_operacion_id: getOperacionId()
				operaciontipo_codigo: getOpTipo()
		)
		when 'new','create' then (
			data = 
				saldo_tipo: getSaldoAplicacion()
				organizacion_id: getOrganizacionId()
				operaciontipo_codigo: getOpTipo()
		)
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rad/operaciones/compatibles'
		data: data
		dataType: "script"
		)

agregaEditorRegistro = (registro, momento, ood) ->
	id = "reg_" + registro.attr("id")
	if registro.data("aplicado") == 'undefined' || momento == 'onSelect'
		valorEditorRegistro = parseFloat(registro.data("disponible"))
	else
		valorEditorRegistro = parseFloat(registro.data("aplicado"))
	$('#compatibles_origen_importe').append('<span>Ref ' + registro.data("desc") + '</span><input id=' + id + ' name=' + id + ' type="text" value="' + valorEditorRegistro + '">')
	$('#compatibles_origen_importe input').change ->
		calculaImporteDesdeAplicaciones(ood)

calcularValores = (opciones) ->
	pf = '#rad_operacion_' #pf
	importe = $(pf + 'importe').val()
	cuotas = $(pf + 'cuotas').val()
	importeCuota = $(pf + 'cuotaimporte').val(importeCuota)
	switch getOpTipo()
		when -3,2,-1
			contraPartida = 'input.haber'
		when 1,-2,3
			contraPartida = 'input.debe'
	switch getRMes()
		when true
	 		valorAActualizar = (cuotas * importeCuota).toFixed(2)
	 		idQueSeActualiza = 'importe'
	 		$(contraPartida).val(importeCuota)
	 		$('input.'+getSaldoAplicacion()).val(importeCuota)
 		when false
	 		valorAActualizar = (importe / cuotas).toFixed(2)
	 		idQueSeActualiza = 'cuotaimporte'
	 		if opciones.solicitante == 'edita_registros'
	 			$('input.'+getInvSaldoAplicacion()).val(importe)
	 			$('input.'+getSaldoAplicacion()).val(importe)
 			else
	 			$(contraPartida).val(importe)
	$(pf + idQueSeActualiza).val(valorAActualizar)

#solo debe usarse en compatibles en origen!
calculaImporteDesdeAplicaciones = (ood) ->
	$('#rad_operacion_importe').val(0)
	$('#compatibles_' + ood + '_importe input').each ->
		id = $(this).attr("id").substr(4)
		opcion = $('#aplicaciones_' + ood + ' #' + id)
		$(this).val(opcion.data("disponible")) if parseFloat($(this).val()) > parseFloat(opcion.data("disponible"))
		importe = parseFloat($('#rad_operacion_importe').val()) + parseFloat($(this).val())
		$('#rad_operacion_importe').val(importe.toFixed(2))
		opcion.val(id + ', ' + $(this).val()) 
		armaOpDesdeArrayConOpciones(ood)
		calcularValores({"solicitante": "edita_registros"})

calculos = () ->
	lineasVivas = '.row.' + String(getInvSaldoAplicacion())
	total = 0
	$.each $(lineasVivas + ' input[name*=valor]'), () ->
		valor = 0
		valor = $(this).val() if $(this).val() != ""
		total += parseFloat(valor)
	switch getRMes()
		when true then rm = 'cuotaimporte'
		when false then rm = 'importe'
	$('#rad_operacion_'+rm).val(total.toFixed(2)).change()
getCuentaId = (saldo_tipo) ->
	switch saldo_tipo
		when "debe" then $('.row.debe:first select option:selected').val()
		when "haber" then $('.row.haber:first select option:selected').val()
getSaldoAplicacion = () ->
	switch getOpTipo()
		when -1,-2,3
			saldo_tipo = "debe"
		when -3, 2, 1
			saldo_tipo = "haber"
getInvSaldoAplicacion = () ->
	switch getOpTipo()
		when -3, 2,-1
			saldo_tipo = "debe"
		when 1,-2,3
			saldo_tipo = "haber"
		when 0
			saldo_tipo = "movimiento_fondos"
getOrganizacionId = () ->
	$('#rad_operacion_organizacion_id').val()
getOperacionId = () ->
	$('#rad_operacion_id').val()
getRMes = () ->
	$('#rad_operacion_rdosxmes').prop('checked')
getOpTipo = () ->
	$('#rad_operacion_operaciontipo_id option:selected').data('codigo')
interruptorInputsYAgregarLinea = () ->
	saldo_tipo = getInvSaldoAplicacion()
	switch 
		when 'debe'
			posicion = true
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos').show()
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos, .debe a.quitar_campos:first').hide()
			rev
		when 'haber'
			posicion = false
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos').show()
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos, .haber a.quitar_campos:first').hide()
			rev
		when 'movimiento_fondos'
			posicion = false
			rev = !
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos').hide()
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos').hide()
	$('.row.' + saldo_tipo).not(':first').remove() if saldo_tipo != 'movimiento_fondos' && $('#action_name').val() != 'edit'
	$('input.debe').prop('readonly',rev+!posicion)
	$('input.haber').prop('readonly',posicion)
	$('[readonly]').prop('tabindex',-1)

interruptorCuotas = (IO) ->
	traduccion = traduceIO(IO)
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('readonly', !traduccion)

interruptorRdosxmes = (IO) ->
	traduccion = traduceIO(IO)
	$('#rad_operacion_rdosxmes').prop('disabled', !traduccion)
	$('#rad_operacion_rdosxmes').prop('checked', traduccion)
	setPlaceHolder(!traduccion)

interruptorOrganizacion = (IO) ->
	switch IO
		when 'I' then $('#rad_operacion_organizacion_id').prop('disabled',false).parent().show()
		when 'O' then $('#rad_operacion_organizacion_id').prop('disabled',true).parent().hide()

opcionesSeleccionadasOrdenadas = (ood) ->	
	$('#aplicaciones_' + ood + ' option:selected').sort (a,b) -> 
		$(a).data("cuenta") - $(b).data("cuenta")

setPlaceHolder = (posicion) ->
	placeHolder = "Valor mensual" if posicion == true
	placeHolder = "Valor" if posicion == false	
	$('input[name*=valor]').attr("placeholder", placeHolder)
traduceIO = (IO) ->
	switch IO
		when 'I' then true
		when 'O' then false

$.fn.cargaCompatibles = (datos, ood) ->
	$('#compatibles_' + ood).empty()
	$('#compatibles_' + ood + '_importe').empty()
	if datos.length != 0
		$('#compatibles_' + ood).append('<span>Aplicar ' + ood + '</span><select data-placeholder="Seleccionar registros" id="aplicaciones_' + ood + '" name="aplicaciones_' + ood + '[]" multiple></select>')
		$.each datos, (i) ->
			opcion = '<option id="'+ this.id + '" value="'+ this.id + ', ' + this.disponible + '" data-disponible="'+ this.disponible + '"' +
			'data-aplicado="'+ this.aplicadoATransaccion + '"' +
			'data-cuenta="'+ this.cuenta_id + '"' +
			'data-desc="'+this.desc+'">' + 
			this.desc + 
			' -- disp: '+ this.disponible +
			' -- venc: ' + this.fecha + 
			'</option>'
			$('#aplicaciones_' + ood).append(opcion)
		$('#aplicaciones_' + ood).change ->
			$('#compatibles_' + ood + '_importe').empty()
			$('#aplicaciones_' + ood + ' option:selected').each ->
				agregaEditorRegistro($(this),'onSelect', ood)
			calculaImporteDesdeAplicaciones(ood)
			$('#compatibles_' + ood + '_importe input').focus()
		$.fn.initChosen()

$.fn.defineUiXOpTipo = () ->
	op_tipo = getOpTipo()
	if op_tipo == 0
		interruptorCuotas('O')
		interruptorRdosxmes('O')
		interruptorOrganizacion('O')
	else
		interruptorOrganizacion('I')
		actualizarCompatibles()
		switch op_tipo
			when 3,-3 then (
				interruptorRdosxmes('I')
			)
			else (
				interruptorRdosxmes('0')
			)
	interruptorInputsYAgregarLinea()
	activaCalculos(true)
	$('a.agregar_campos_D, a.agregar_campos_H').prop('tabindex',-1)

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','tipo', 'importe','desc','cuotaimporte']
	propiedades = [['Fecha','20%'],['Tipo','auto'],['Importe','20%'],['desc','auto', 'Descripción'],['cuotaimporte','auto','Cuota']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	

$.fn.seleccionaAplicados = (aplicados_ids) ->
	$('#aplicaciones ' + aplicados_ids).prop("selected", true).trigger("chosen:updated")
	$.each $('#aplicaciones ' + aplicados_ids), () ->
		agregaEditorRegistro($(this),'onRecord')
		
$(document).on('page:load', ready)
$(document).ready(ready)