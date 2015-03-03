ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('.calcularValores').change ->
		calcularValores($('#rad_operacion_operaciontipo_id option:selected').data('codigo'), $(this))
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
			containerClass = 'ContainerDebe' 
		else
			afterRow = '.row.haber:last'
			containerClass = 'ContainerHaber'
		if $(afterRow).length != 0
			$(afterRow).after($(this).data('fields').replace(regexp, time)) 
		else
			$("#container."+containerClass).append($(this).data('fields').replace(regexp, time)) 			
		$.fn.initChosen()
		$('.chosen-single:visible').last().focus()
		activaCalculos()
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
activaCalculos = () ->
	$('.row.debe input[name*=valor]').change ->
		total = 0
		$.each $('.row.debe input[name*=valor]'), () ->
			valor = 0
			valor = $(this).val() if $(this).val() != ""
			total += parseInt(valor)
		$('#rad_operacion_cuotaimporte').val(total.toFixed(2)).change()
activaCuentasCompatiblesOnChange = (saldoTipo) ->
	switch saldoTipo
		when "debe" then (
			$('.row.debe select, .row.haber select').unbind("change")
			$('.row.debe select').change ->
				actualizarCompatibles(["buscaPorCta", getCuentaId("debe"),"debe"])
		)
		when "haber" then (
			$('.row.debe select, .row.haber select').unbind("change")
			$('.row.haber select').change ->
				actualizarCompatibles(["buscaPorCta", getCuentaId("haber"),"haber"])
		)
actualizarCuentas = (operaciontipo_codigo) ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rco/cuentas/x_operacion_tipo'
		data:
			operaciontipo_codigo: operaciontipo_codigo
		dataType: "script"
		)
actualizarCompatibles = (opcionesArray) ->
	if opcionesArray[0] == "buscaPorReg"
		data =
			rad_operacion_id: opcionesArray[1]
			saldoTipo: opcionesArray[2]
	else #buscaPorCta
		data = 
			saldoTipo: opcionesArray[2]
			cuenta_id: opcionesArray[1]
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
calcularValores = (opTipo, obj) ->
	pf = '#rad_operacion_' #pf
	importe = $(pf + 'importe').val()
	cuotas = $(pf + 'cuotas').val()
	importeCuota = $(pf + 'cuotaimporte').val(importeCuota)
	switch obj.attr('id')
		when 'rad_operacion_cuotas'
	 		valorAActualizar = (cuotas * importeCuota).toFixed(2)
	 		idQueSeActualiza = 'importe'	
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
	$('#rad_operacion_importe').change()
getCuentaId = (saldoTipo) ->
	switch saldoTipo
		when "debe" then $('.row.debe:first select option:selected').val()
		when "haber" then $('.row.haber:first select option:selected').val()
interruptorCuotas = (posicion) ->
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('readonly', posicion)
interruptorRdosxmes = (posicion) ->
	$('#rad_operacion_rdosxmes').prop('disabled', posicion)
	$('#rad_operacion_rdosxmes').prop('checked', !posicion)
	setPlaceHolder(!posicion)
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
$.fn.defineUiXOpTipo = (opcionesArray) ->
	# [cuenta_id, saldoTipo] si es edit [rad_operacion_id]
	# opcionesArray [opCodigo, operacion_id (si es edit)]
	switch opcionesArray[0]
		#MOV DE FONDOS
		when 0 then interruptorCuotas(true); interruptorRdosxmes(true)
		#PROVISIÓN EGRESOS, EGRESOS Y COBRANZAS
		when -1, 2, -3 then (
			if opcionesArray[0] == -3
				interruptorRdosxmes(false)
				activaCalculos()
			else
				interruptorRdosxmes(true)
			if opcionesArray[1] == undefined
				actualizarCompatibles(["buscaPorCta", getCuentaId("haber"),"haber"])
			else
				actualizarCompatibles(["buscaPorReg", opcionesArray[1], "haber"])
			activaCuentasCompatiblesOnChange("haber")
		)
		#PROVISIÓN INGRESOS, INGRESOS Y PAGOS
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
	$('a').prop('tabindex',-1)
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