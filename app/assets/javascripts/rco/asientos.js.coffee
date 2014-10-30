ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

	if $('#action_name').val() != 'index'
		sumInicial()
		ActSumDebe()
		ActSumHaber()
		controlBoton()
		
	else
		$.fn.agregarFiltros([['desde','date'],['hasta','date'],['rco/cuentas','select']])
		


	$('#rco_asiento_moneda_id').change () ->
		cot = $('#rco_asiento_moneda_id option:selected').data('cot')
		$('#rco_asiento_cotizacion').val(cot)
	
	$('input, textarea').change () ->
		controlBoton()
	
	$('.agregar_campos').click () ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#container').append($(this).data('fields').replace(regexp, time))
    $.fn.activarCalcular()
    $.fn.initChosen()
    $('.chosen-single:visible').last().focus()
    cuentas = $('.cuenta')
    cuentasLength = cuentas.length
    if (cuentasLength > 1)
 	   cuentas.last().val(cuentas[cuentasLength-2].value).trigger("chosen:updated")
 	  re = new RegExp("[0-9]")
 	  fechas = $('.fecha')
 	  fechasLenght = fechas.length
 	  if (fechasLenght > 1)
	 	  if([''].indexOf($('#vtos').val()) == -1 && re.test($('#vtos').val()))
 		  	fechaBase = new Date(fechas[fechasLenght-2].value)
 		  	fechaBase.setDate(fechaBase.getDate() + parseInt($('#vtos').val()))
 		  	fechaCalculada = $.fn.armaFechas(fechaBase.getDate()+1,fechaBase.getMonth()+1,fechaBase.getFullYear())
 		  	fechas.last().val(fechaCalculada)

	$('form').on 'click', '.simil_agrega_campos', () ->
		$('.agregar_campos').click()

	
	$('form').on 'click', '.quitar_campos', () ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		sumInicial()
		controlBoton()
		$('.chosen-single:visible')[1].focus()

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','desc','importe','moneda','cotizacion']
	propiedades = [['Fecha','auto'],['desc','auto','Descripcion'],['Importe','auto'],
	['Moneda','auto'],['Cotizacion','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

sumInicial = () ->
	sumDebe()
	sumHaber()
	difDebeHaber()

ActSumDebe = () ->
	$('form').on 'change', '.debe', () ->
		controlBoton()
		sumDebe()
		difDebeHaber()
				
ActSumHaber = () ->
	$('form').on 'change', '.haber', () ->
		controlBoton()
		sumHaber()
		difDebeHaber()

sumDebe = () ->
	debe = 0
	$('.debe:visible').each ->
		debe += parseFloat($(this).val())
	$('#debe').val(parseFloat(debe.toFixed(4)))	

sumHaber = () ->
	haber = 0
	$('.haber:visible').each ->
		haber += parseFloat($(this).val())
	$('#haber').val(parseFloat(haber.toFixed(4)))	


difDebeHaber = () ->
	$('#diferencia').val($('#debe').val() - $('#haber').val())

submitOn = (valor) ->
	if valor == true
		$("input[type=submit]").removeAttr("disabled")
	else	
		$("input[type=submit]").attr("disabled", "disabled")

controlBoton = () ->
	if $('#debe').val() == $('#haber').val() && ['0',''].indexOf($('#debe').val()) == -1
		submitOn(true)
	else
		submitOn(false)

$(document).on('page:load', ready)
$(document).ready(ready)

