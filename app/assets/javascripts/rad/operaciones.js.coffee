ready = ->
	$.fn.comun()
	$('.calcular_valores').change -> 
		calcular_valores_desde_totales()
	# .calcular_valores importe, cuotaimporte y cuota
	$('#rad_operacion_operaciontipo_id').change ->
		interruptor_cuotas('i')
		interruptor_rmes('o')
		actualizar_cuentas()
		actualizar_compatibles()
	$('#rad_operacion_organizacion_id').change ->
		actualizar_compatibles()
	switch $('#action_name').val()
		when 'new' then actualizar_cuentas()
		when 'edit','create' then $.fn.defineUiXOpTipo()
	agregar_lineas_init()
	
		
agregar_lineas_init = () ->
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
			$("#container." + container_class).append($(this).data('fields').replace(regexp, time))
		$.fn.initChosen()
		calcular_desde_lineas_vivas_init(false)
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
		calcular_desde_lineas_vivas()
		$('.chosen-single:visible')[1].focus()
		return false
	$('#rad_operacion_rdosxmes').click () ->
		setPlaceHolder($(this).prop('checked'))

ordena_cuentas_opciones_seleccionadas = () ->	
	$('#aplicaciones_origen option:selected').sort (a,b) -> 
		$(a).data("cuenta") - $(b).data("cuenta")

array_cuentas_agrupadas = () ->
	cuenta_ant = undefined
	disponible = 0
	aplicado = 0
	index = -1
	array = []
	$.each ordena_cuentas_opciones_seleccionadas(), () ->
		cuenta_actual = $(this).data("cuenta")
		if cuenta_actual == cuenta_ant
			disponible +=  parseFloat($(this).data("disponible"))
			aplicado +=  parseFloat($(this).data("aplicado"))
		else
			index += 1
			disponible = parseFloat($(this).data("disponible"))
			aplicado =  parseFloat($(this).data("aplicado"))
		array[index] = {"cuenta": cuenta_actual, "disponible": disponible, "aplicado": aplicado}
		cuenta_ant = cuenta_actual
	array
	
actualizar_cuentas_lineas_vivas_x_aplicaciones = () ->
	opciones = array_cuentas_agrupadas()
	lineas_vivas = get_origen()
	if opciones.length  != $('.row.' + lineas_vivas).length
		$('.row.' + lineas_vivas).not(':first').remove()
		num = opciones.length
		while num -= 1
			$('a.agregar_campos_' + lineas_vivas[0].toUpperCase()).click()
	seleccionar_cuentas = () ->
		$('.row.' + lineas_vivas).each (i) ->
			$('select.' + lineas_vivas, this).val(opciones[i].cuenta)
			$('input[type=text].' + lineas_vivas, this).val(opciones[i].aplicado.toFixed(2))
		$('.row.' + lineas_vivas + ' select').trigger("chosen:updated")
	seleccionar_cuentas()
	calcular_desde_lineas_vivas()

actualizar_cuentas_lineas_destino = (cuenta_id) ->
	$('.row.' + get_destino() + ':first select').val(cuenta_id).trigger("chosen:updated")

actualizar_cuentas = ()  ->
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rco/cuentas/x_operacion_tipo'
		data:
			operaciontipo_codigo: get_op_tipo()
		dataType: "script"
		)

actualizar_compatibles = () ->
	switch $('#action_name').val()
		when 'edit' then (
			data =
				saldo_tipo: get_origen()
				rad_operacion_id: get_operacion_id()
				operaciontipo_codigo: get_op_tipo()
		)
		when 'new','create' then (
			data = 
				saldo_tipo: get_origen()
				organizacion_id: get_organizacion_id()
				operaciontipo_codigo: get_op_tipo()
		)
	$.ajax(
		type: "POST"
		url: $('#root_path').val() + 'rad/operaciones/compatibles'
		data: data
		dataType: "script"
		)

agregar_editor_aplicacion = (registro, momento, ood) ->
	id = "reg_" + registro.attr("id")
	if registro.data("aplicado") == 'undefined' || momento == 'onSelect'
		valorEditorRegistro = parseFloat(registro.data("disponible"))
	else
		valorEditorRegistro = parseFloat(registro.data("aplicado"))
	$('#compatibles_' + ood + '_importe').append('<span>Ref ' + registro.data("desc") + '</span><input id=' + id + ' name=' + id + ' type="text" value="' + valorEditorRegistro + '">')
	$('#compatibles_' + ood + '_importe input').change ->
		calcular_valores_desde_aplicaciones(ood)

#solo debe usarse en compatibles en origen!
calcular_valores_desde_aplicaciones = (ood) ->
	$('#rad_operacion_importe').val(0)
	$('#compatibles_' + ood + '_importe input').each ->
		id = $(this).attr("id").substr(4) # los id de las opciones son reg_3213 al sacarle 4 dig queda el id del registro
		opcion = $('#aplicaciones_' + ood + ' #' + id)
		$(this).val(opcion.data("disponible")) if parseFloat($(this).val()) > parseFloat(opcion.data("disponible"))
		opcion.data('aplicado', $(this).val())
		opcion_valor_array = opcion.val().split(', ')
		opcion_nuevo_valor = opcion_valor_array[0] + ', ' + opcion_valor_array[1] + ', ' + $(this).val()
		opcion.val(opcion_nuevo_valor)
		if ood == 'origen'
			actualizar_cuentas_lineas_vivas_x_aplicaciones()
		else if ood == 'destino'
			actualizar_cuentas_lineas_destino(opcion_valor_array[1])
	calcular_valores_desde_totales()

calcular_valores_desde_totales = () ->
	prefijo = '#rad_operacion_' #prefijo
	importe = $(prefijo + 'importe').val()
	cuotas = $(prefijo + 'cuotas').val()
	importe_cuota = $(prefijo + 'cuotaimporte').val(importe_cuota)
	switch get_rmes()
		when true
			nuevo_valor = (cuotas * importe_cuota).toFixed(2)
			id_a_actualizar = 'importe'
			$('input.' + get_destino()).val(importe_cuota)
		when false
			nuevo_valor = (importe / cuotas).toFixed(2)
			id_a_actualizar = 'cuotaimporte'
			$('input.' + get_destino() + ':first').val(importe)
	$(prefijo + id_a_actualizar).val(nuevo_valor)

calcular_desde_lineas_vivas_init = (ejecuta) ->
	lineas_vivas = '.row.' + get_origen()
	calcular_desde_lineas_vivas() if ejecuta == true
	$(lineas_vivas + ' input[name*=valor], #rad_operacion_rdosxmes').change ->
		calcular_desde_lineas_vivas()

calcular_desde_lineas_vivas = () ->
	lineas_vivas = '.row.' + get_origen()
	total = 0
	$.each $(lineas_vivas + ' input[name*=valor]'), () ->
		valor = 0
		valor = $(this).val() if $(this).val() != ""
		total += parseFloat(valor)
	switch get_rmes()
		when true then rm = 'cuotaimporte'
		when false then rm = 'importe'
	$('#rad_operacion_'+ rm ).val(total.toFixed(2))
	calcular_valores_desde_totales()

get_origen = () ->
	switch get_op_tipo()
		when -1,-2,-3 
			"debe"
		when 1, 2, 3
			"haber"
		when 0
			"debe"
get_destino = () ->
	switch get_op_tipo()
		when -1,-2,-3
			"haber"
		when 1, 2, 3
			"debe"
		when 0
			"haber"
get_organizacion_id = () ->
	$('#rad_operacion_organizacion_id').val()
get_operacion_id = () ->
	$('#rad_operacion_id').val()
get_rmes = () ->
	$('#rad_operacion_rdosxmes').prop('checked')
get_op_tipo = () ->
	$('#rad_operacion_operaciontipo_id option:selected').data('codigo')
interruptor_inputs_y_agregar_lineas = () ->
	lineas_vivas = get_origen()
	switch lineas_vivas
		when 'debe'
			posicionDebe = true
			posicionHaber = !posicionDebe
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos').show()
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos, .debe a.quitar_campos:first').hide()
		when 'haber'
			posicionDebe = false
			posicionHaber = !posicionDebe
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos').show()
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos, .haber a.quitar_campos:first').hide()
		when 'movimiento_fondos'
			posicionDebe = false
			posicionHaber = posicionDebe
			$('a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos').hide()
			$('a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos').hide()
	$('.row.' + lineas_vivas).not(':first').remove() if lineas_vivas != 'movimiento_fondos' && $('#action_name').val() != 'edit'
	$('input.debe').prop('readonly', posicionHaber)
	$('input.haber').prop('readonly', posicionDebe)
	$('input[readonly]').prop('tabindex', -1)
	$('input:not([readonly])').removeProp('tabindex')


interruptor_cuotas = (io) ->
	traduccion = traduce_io(io)
	$('#rad_operacion_cuotas, #rad_operacion_cuotaimporte').prop('readonly', !traduccion)

interruptor_rmes = (io) ->
	traduccion = traduce_io(io)
	$('#rad_operacion_rdosxmes').prop('disabled', !traduccion)
	$('#rad_operacion_rdosxmes').prop('checked', traduccion)
	setPlaceHolder(!traduccion)

interruptor_organizacion = (io) ->
	switch io
		when 'i' then $('#rad_operacion_organizacion_id').prop('disabled',false).parent().show()
		when 'o' then $('#rad_operacion_organizacion_id').prop('disabled',true).parent().hide()

setPlaceHolder = (posicion) ->
	placeHolder = "Valor mensual" if posicion == true
	placeHolder = "Valor" if posicion == false	
	$('input[name*=valor]').attr("placeholder", placeHolder)
traduce_io = (io) ->
	switch io
		when 'i' then true
		when 'o' then false

$.fn.defineUiXOpTipo = () ->
	op_tipo = get_op_tipo()
	if op_tipo == 0
		interruptor_cuotas('o')
		interruptor_rmes('o')
		interruptor_organizacion('o')
	else
		interruptor_organizacion('i')
		actualizar_compatibles()
		switch op_tipo
			when 3,-3 then (
				interruptor_rmes('i')
			)
			else (
				interruptor_rmes('o')
			)
	interruptor_inputs_y_agregar_lineas()
	calcular_desde_lineas_vivas_init(true)
	$('a.agregar_campos_D, a.agregar_campos_H').prop('tabindex',-1)

$.fn.cargaCompatibles = (datos, ood) ->
	$('#compatibles_' + ood).empty()
	$('#compatibles_' + ood + '_importe').empty()
	if datos.length != 0
		$('#compatibles_' + ood).append('<span>Ap_' + ood + '</span><select data-placeholder="Seleccionar registros" id="aplicaciones_' + ood + '" name="aplicaciones_' + ood + '[]" multiple></select>')
		$.each datos, (i) ->
			opcion = '<option id="'+ this.id + '" value="'+ this.id + ', ' + this.cuenta_id + ', ' + this.disponible + '" data-disponible="'+ this.disponible + '"' +
			'data-aplicado="'+ this.aplicado_a_registro + '"' +
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
				agregar_editor_aplicacion($(this),'onSelect', ood)
			calcular_valores_desde_aplicaciones(ood)
			$('#compatibles_' + ood + '_importe input').focus()
		$.fn.initChosen()

$.fn.seleccionaAplicados = (aplicados_ids, ood) ->
	$('#aplicaciones_' + ood + ' ' + aplicados_ids).prop("selected", true).trigger("chosen:updated")
	$.each $('#aplicaciones_' + ood + ' ' + aplicados_ids), () ->
		agregar_editor_aplicacion($(this),'onRecord', ood)
		
$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','tipo', 'importe',['desc','string'],'cuotaimporte']
	propiedades = [['Fecha','20%'],['Tipo','auto'],['Importe','20%'],['desc','auto', 'Descripción'],['cuotaimporte','auto','Cuota']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

$(document).on('page:load', ready)
$(document).ready(ready)