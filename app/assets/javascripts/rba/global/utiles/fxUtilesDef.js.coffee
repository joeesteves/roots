#DEFINICION DE FUNCIONES UTILES 
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
	if texto != undefined && texto.match(/^[=+]/) != null 
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
		dd = hoyJs.getDate() 
		mm = hoyJs.getMonth() + 1
		yyyy = hoyJs.getFullYear()
		hoy = $.fn.armaFechas(dd,mm,yyyy)
		$(':input[type=date]').val(hoy)

$.fn.primerDiaDelMesActual = () ->
	hoyJs = new Date()
	dd = 1
	mm = hoyJs.getMonth() + 1
	yyyy = hoyJs.getFullYear()
	hoy = $.fn.armaFechas(dd,mm,yyyy)

$.fn.ultimoDiaDelMesActual = () ->
	hoyJs = new Date()
	yyyy = hoyJs.getFullYear()
	mm = hoyJs.getMonth() + 1
	if [1,3,5,7,8,10,12].indexOf(mm) != -1
		dd = 31
	else if mm == 2
		if chequearBisiesto(yyyy)
			dd = 29
		else
			dd = 28
	else
		dd = 30
	hoy = $.fn.armaFechas(dd,mm,yyyy)

chequearBisiesto = (yyyy) ->
	if yyyy % 4 == 0 
		if yyyy%100 == 0 & yyyy%400 != 0
			false
		else
			true
	else
		false


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


# funcion que agrega filtros. Se llama desde el js de cada controlador solo desde index. ver asientos.js
# se alimenta de un array triple [[nombre campo, tipo(date,text,select), valor default]] en caso de ser select el nombre 
# debe ser el controller al que llama el selector rco/cuentas traeria un listado de cuentas
# en el caso de los tipo select ahi logica en los controladores correspondientes que devuelven un js.
# para hacer llegar los parametros a la consulta json, se guardan en cada view en un hidden fiel con el prefijo filtro
# luego el gridrequest lo pasa como parametro query.
# grid_init separa los index con arbol y sin arbol. Para los con arbol el query indica el nodo de trabajo para los sin arbol los filtros

$.fn.agregarFiltros = (filtros) ->
	for filtro in filtros
		do (filtro) ->
			if filtro[1] == 'select'
				$('#filtroRow').append('<div class="small-5 columns">
			<span class="prefix">'+filtro[0].split("/")[1]+'</span>
		</div>')
				$.ajax(
        type: "GET"
        url: $('#root_path').val()+filtro[0]
        data:
        	filtro_valor: filtro[2]
        dataType: "script")
			else
				$('#filtroRow').append('<div class="small-5 columns">
			<span class="prefix">'+filtro[0]+'</span>
		</div>')
				$('#filtroRow').append('<div class="small-7 columns">
			<input type="'+filtro[1]+'" id="'+filtro[0]+'" name="'+filtro[0]+'" 
		tabindex="1" value="'+filtro[2]+'"/>
			</div>')
