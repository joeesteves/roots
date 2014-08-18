#Define la funcion para el calculo dentro de los campos
$.fn.activarCalcular = () ->
	$('input:text').focusout ->
		rta = $.fn.calcular($(this).val())
		if rta == 'error'
			alert("revisar calculo")
			$(this).val('=').focus()

		else
			$(this).val(rta)
			$(this).change()
$.fn.calcular = (texto) ->
	if texto[0] == "="
		try
			fx = texto.substring(1,texto.length)
			rta = eval(fx)
		catch 
			rta = 'error'
	else 
		rta = texto
	rta
#Activa la funcion para autocompletado inteligente de las fechas
$.fn.activarFechaAutocompletado = () ->
	$(':input[type=date]').focusout ->
		date = $(this).val().split('-')
		dd = parseInt(date[2])
		mm = parseInt(date[1])
		yyyy = parseInt(date[0])
		date = $.fn.armaFechas(dd,mm,yyyy)
		$(this).val(date)

$.fn.completaHoy = () ->
	if $(':input[type=date]').val() == ""
		hoyJs = new Date()
		dd = hoyJs.getDay() + 1 
		mm = hoyJs.getMonth() + 1
		yyyy = hoyJs.getFullYear()
		hoy = $.fn.armaFechas(dd,mm,yyyy)
		$(':input[type=date]').val(hoy)

$.fn.armaFechas = (dd,mm,yyyy) ->
	if dd < 10
			dd = "0" + dd.toString()
	else
		dd = dd.toString()
	if mm < 10
		mm = "0" + mm.toString()
	else
		mm = mm.toString()
	if yyyy < 100 
		yyyy = (yyyy + 2000).toString()
	else
		yyyy = yyyy.toString()
	date = yyyy+"-"+mm+"-"+dd

# Funcion generica para dijujar pantalla

$.fn.dynamicForm = (mostrarCampos, ocultarCampos) ->
	for campo in mostrarCampos
		do (campo) -> 
			if $.isArray(campo)
				$('#' + campo[0]).show()
				$('#' + campo[0]).addClass(campo[1])
			else
				$('#' + campo).show()
	for campo in ocultarCampos
		do (campo) -> 
			if $.isArray(campo)
				$('#' + campo[0]).hide()
				$('#' + campo[0]).removeClass(campo[1])
			else
				$('#' + campo).hide()
