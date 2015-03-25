ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('.calcularValores').change ->
		calcularValores(false)
	$('#rad_operacion_operaciontipo_id').change ->
		interruptorCuotas(false); interruptorRdosxmes(true)
		actualizarCuentas(getOpTipo())
	$('#rad_operacion_organizacion_id').change ->
		actualizarCompatibles({"modo_busqueda": "busca_por_org"})
	switch $('#action_name').val()
		when 'new' then actualizarCuentas(getOpTipo())
		when 'edit' then $.fn.defineUiXOpTipo({"op_tipo": getOpTipo(), "operacion_id":  $('#rad_operacion_id').val()})
		when 'create' then $.fn.defineUiXOpTipo({"op_tipo": getOpTipo(), "operacion_id": undefined})
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
			$(after_row +':last').after($(this).data('fields').replace(regexp, time))
			$(after_row +':last select').empty().append($(after_row+':first select option').clone()).trigger("chosen:updated")
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
		$(this).closest('.row').remove()
		$('.chosen-single:visible')[1].focus()
		return false
	$('#rad_operacion_rdosxmes').click () ->
		setPlaceHolder($(this).prop('checked'))
activaCalculos = (ejecuta) ->
	lineasVivas = '.row.' + String(getLineasVivas())
	calculos(lineasVivas) if ejecuta == true
	$(lineasVivas + ' input[name*=valor], #rad_operacion_rdosxmes').change ->
		calculos(lineasVivas)

armaArrayConOpcionesAgrupadas = () ->
	cuenta_ant = undefined
	disponible = 0
	index = -1
	array = []
	$.each opcionesSeleccionadasOrdenadas(), () ->
		cuenta_actual = $(this).data("cuenta")
		if cuenta_actual == cuenta_ant
			disponible +=  parseFloat($(this).data("disponible"))
		else
			index += 1
			disponible = parseFloat($(this).data("disponible"))
		array[index] = {"cuenta": cuenta_actual, "disponible": disponible}
		cuenta_ant = cuenta_actual
	array

opcionesSeleccionadasOrdenadas = () ->	
	$('#aplicaciones option:selected').sort (a,b) -> 
		$(a).data("cuenta") - $(b).data("cuenta")

armaOpDesdeArrayConOpciones = () ->
	opciones = armaArrayConOpcionesAgrupadas()
	saldo_tipo = getLineasAplicacion()
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
# activaCuentasCompatiblesOnChange = () ->
# 	switch getLineasAplicacion()
# 		when "debe" then (
# 			$('.row.debe select, .row.haber select').unbind("change")
# 			$('.row.debe select').change ->
# 				actualizarCompatibles({"modo_busqueda":"busca_por_org"})
# 		)
# 		when "haber" then (
# 			$('.row.debe select, .row.haber select').unbind("change")
# 			$('.row.haber select').change ->
# 				actualizarCompatibles({"modo_busqueda":"busca_por_org"})
# 		)
actualizarCuentas = (op_tipo) ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rco/cuentas/x_operacion_tipo'
		data:
			operaciontipo_codigo: op_tipo
		dataType: "script"
		)
actualizarCompatibles = (opciones) ->
	switch opciones.modo_busqueda 
		when "busca_por_reg" then (
			data =
				saldo_tipo: getLineasAplicacion()
				rad_operacion_id: opciones.operacion_id
		)
		when "busca_por_org" then (
			data = 
				saldo_tipo: getLineasAplicacion()
				organizacion_id: getOrganizacionId()
		)
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rad/operaciones/compatibles'
		data: data
		dataType: "script"
		)
agregaEditorRegistro = (registro, momento) ->
	id = "reg_" + registro.attr("id")
	if registro.data("aplicado") == 'undefined' || momento == 'onSelect'
		valorEditorRegistro = registro.data("disponible")
	else
		valorEditorRegistro = registro.data("aplicado")
	$('#compatiblesImporte').append('<span>Ref '+registro.data("desc")+'</span><input id='+id+' name='+id+' type="text" value="' + valorEditorRegistro + '">')
	$('#compatiblesImporte input').change ->
		calculaImporteDesdeAplicaciones()
calcularValores = (desdeAplicacion) ->
	op_tipo = $('#rad_operacion_operaciontipo_id option:selected').data('codigo')
	pf = '#rad_operacion_' #pf
	importe = $(pf + 'importe').val()
	cuotas = $(pf + 'cuotas').val()
	importeCuota = $(pf + 'cuotaimporte').val(importeCuota)
	switch op_tipo
		when -3,2,-1
			contraPartida = 'input.haber'
		when 1,-2,3
			contraPartida = 'input.debe'
	switch getRMes()
		when true
	 		valorAActualizar = (cuotas * importeCuota).toFixed(2)
	 		idQueSeActualiza = 'importe'
	 		$(contraPartida).val(importeCuota)
 		when false
	 		valorAActualizar = (importe / cuotas).toFixed(2)
	 		idQueSeActualiza = 'cuotaimporte'
	 		if desdeAplicacion == true
	 			lineaViva = getLineasVivas()
	 			$('input.'+lineaViva).val(importe)
 			else
	 			$(contraPartida).val(importe)
	$(pf + idQueSeActualiza).val(valorAActualizar)
calculaImporteDesdeAplicaciones = () ->
	$('#rad_operacion_importe').val(0)
	$('#compatiblesImporte input').each ->
		id = $(this).attr("id").substr(4)
		opcion = $('#aplicaciones #' + id )
		$(this).val(opcion.data("disponible")) if parseFloat($(this).val()) > parseFloat(opcion.data("disponible"))
		importe = parseFloat($('#rad_operacion_importe').val()) + parseFloat($(this).val())
		$('#rad_operacion_importe').val(importe.toFixed(2))
		opcion.val(id + ', ' + $(this).val()) 
	# $('#rad_operacion_importe').change()
		calcularValores(true)
		armaOpDesdeArrayConOpciones()
calculos = (lineasVivas) ->
	total = 0
	$.each $(lineasVivas + ' input[name*=valor]'), () ->
		valor = 0
		valor = $(this).val() if $(this).val() != ""
		total += parseInt(valor)
	switch getRMes()
		when true then rm = 'cuotaimporte'
		when false then rm = 'importe'
	$('#rad_operacion_'+rm).val(total.toFixed(2)).change()
getCuentaId = (saldo_tipo) ->
	switch saldo_tipo
		when "debe" then $('.row.debe:first select option:selected').val()
		when "haber" then $('.row.haber:first select option:selected').val()
getLineasAplicacion = () ->
	switch getOpTipo()
		when 1,-2,3
			saldo_tipo = "debe"
		when -3, 2,-1
			saldo_tipo = "haber"
getLineasVivas = () ->
	switch getOpTipo()
		when -3, 2,-1
			saldo_tipo = "debe"
		when 1,-2,3
			saldo_tipo = "haber"
getOrganizacionId = () ->
	$('#rad_operacion_organizacion_id').val()
getRMes = () ->
	$('#rad_operacion_rdosxmes').prop('checked')
getOpTipo = () ->
	$('#rad_operacion_operaciontipo_id option:selected').data('codigo')
interruptorInputsYAgregarLinea = (queHabilito) ->
	switch queHabilito
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
		when 'movientoFondos'
			posicion = false
			rev = !
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos').hide()
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos').hide()
	$('input.debe').prop('readonly',rev+!posicion)
	$('input.haber').prop('readonly',posicion)
	$('[readonly]').prop('tabindex',-1)
interruptorCuotas = (posicion) ->
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('readonly', posicion)
interruptorRdosxmes = (posicion) ->
	$('#rad_operacion_rdosxmes').prop('disabled', posicion)
	$('#rad_operacion_rdosxmes').prop('checked', !posicion)
	setPlaceHolder(!posicion)
interruptorOrganizacion = (io) ->
	switch io
		when 'i' then $('#rad_operacion_organizacion_id').prop('disabled',false).parent().show()
		when 'o' then $('#rad_operacion_organizacion_id').prop('disabled',true).parent().hide()
setPlaceHolder = (posicion) ->
	placeHolder = "Valor mensual" if posicion == true
	placeHolder = "Valor" if posicion == false	
	$('input[name*=valor]').attr("placeholder", placeHolder)
$.fn.cargaCompatibles = (datos) ->
	$('#compatibles').empty()
	$('#compatiblesImporte').empty()
	if datos.length != 0
		$('#compatibles').append('<span>Aplicar</span><select  data-placeholder="Seleccionar registros" id="aplicaciones" name="aplicaciones[]" multiple></select>')
		$.each datos, (i) ->
			opcion = '<option id="'+ this.id + '" value="'+ this.id + ', ' + this.disponible + '" data-disponible="'+ this.disponible + '"' +
			'data-aplicado="'+ this.aplicadoATransaccion + '"' +
			'data-cuenta="'+ this.cuenta_id + '"' +
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
			calculaImporteDesdeAplicaciones()
			$('#compatiblesImporte input').focus()
		$.fn.initChosen()
$.fn.defineUiXOpTipo = (opciones) ->
	# [cuenta_id, saldo_tipo] si es edit [rad_operacion_id]
	# opcionesArray [opCodigo, operacion_id (si es edit)]
	switch opciones.op_tipo
		#MOV DE FONDOS
		when 0 then (
			interruptorCuotas(true)
			interruptorRdosxmes(true)
			interruptorOrganizacion('o')
			interruptorInputsYAgregarLinea('movientoFondos')
		)
		#PROVISIÓN EGRESOS, EGRESOS Y COBRANZAS
		when -1, 2, -3 then (
			interruptorOrganizacion('i')
			if opciones.op_tipo == -3
				interruptorRdosxmes(false)
			else
				interruptorRdosxmes(true)
			if opciones.operacion_id == undefined
				actualizarCompatibles({"modo_busqueda":"busca_por_org"})
			else
				actualizarCompatibles({"modo_busqueda":"busca_por_reg", "operacion_id": opciones.operacion_id})
			# activaCuentasCompatiblesOnChange()
			interruptorInputsYAgregarLinea('debe')
			$('.row.haber').not(':first').remove()
		)
		#PROVISIÓN INGRESOS, INGRESOS Y PAGOS
		when 1, -2, 3 then (
			interruptorOrganizacion('i')
			if opciones.op_tipo == 3
				interruptorRdosxmes(false)
			else
				interruptorRdosxmes(true) 
			if opciones.operacion_id == undefined
				actualizarCompatibles({"modo_busqueda":"busca_por_org"})
			else
				actualizarCompatibles({"modo_busqueda":"busca_por_reg", "operacion_id": opciones.operacion_id})
			# activaCuentasCompatiblesOnChange()
			interruptorInputsYAgregarLinea('haber')
			$('.row.debe').not(':first').remove()
		)
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