ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	sumInicial()
	sumDebe()
	sumHaber()
	$('input, textarea').change () ->
		controlBoton()
	$('form').on 'click', '.agregar_campos', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#container').append($(this).data('fields').replace(regexp, time))
    $.fn.activarCalcular()
    sumDebe()
    sumHaber()
    $.fn.initChosen()
    $('.chosen-single:visible')[1].focus()
    event.preventDefault()
	$('form').on 'click', '.quitar_campos', (event) ->
		$(this).parent().prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide().addClass('hidden')
		sumInicial()
		controlBoton()
		$('.chosen-single:visible')[1].focus()
		event.preventDefault()

	$("input[type=submit]").attr("disabled", "disabled")
$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','moneda','cotizacion']
	propiedades = [['Fecha','auto'],['Moneda','auto'],['Cotizacion','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)

sumDebe = () ->
	$('.debe').change ->
		controlBoton()
		$('#debe').val(0)
		$('.debe:visible').each ->
			$('#debe').val(parseFloat($('#debe').val()) + parseFloat($(this).val()))
		$('#diferencia').val($('#debe').val() - $('#haber').val())
sumHaber = () ->
	$('.haber').change ->
		controlBoton()
		$('#haber').val(0)
		$('.haber:visible').each ->
			$('#haber').val(parseFloat($('#haber').val()) + parseFloat($(this).val()))
		$('#diferencia').val($('#debe').val() - $('#haber').val())
sumInicial = () ->
	$('#debe').val(0)
	$('#haber').val(0)
	$('.debe:visible').each ->
		$('#debe').val(parseFloat($('#debe').val()) + parseFloat($(this).val()))
	$('.haber:visible').each ->
			$('#haber').val(parseFloat($('#haber').val()) + parseFloat($(this).val()))
	$('#diferencia').val($('#debe').val() - $('#haber').val())

controlBoton = () ->
	if $('#debe').val() == $('#haber').val() && $('#debe').val() != ""
		$("input[type=submit]").removeAttr("disabled")
	else
		$("input[type=submit]").attr("disabled", "disabled")

		
$(document).on('page:load', ready)
$(document).ready(ready)