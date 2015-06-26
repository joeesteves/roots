ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	if $('#action_name').val() == 'index'
		# captura las variables de filtros
		$('#filtro_desde').val($.fn.primerDiaDelMesActual()) if  $('#filtro_desde').val() == ""
		$('#filtro_hasta').val($.fn.ultimoDiaDelMesActual()) if  $('#filtro_hasta').val() == ""
		desde = $('#filtro_desde').val()
		hasta = $('#filtro_hasta').val()
		cuentas = $('#filtro_cuentas').val().split(" ")
		filtro_ver_saldos_checked = $('#filtro_ver_saldos_checked').val()
		if filtro_ver_saldos_checked == "true"
			ver_saldos_checked = '&ver_saldos_checked=1'
		else
			ver_saldos_checked = ''
		cuentaUrl = ''
		$.each cuentas, (i,v) -> 
			cuentaUrl += '&cuentas[]='+v

		$.fn.agregarFiltros([['desde','date',desde],['hasta','date',hasta],['ver_saldos', 'checkbox'],['rco/cuentas','select',cuentas]])
		query = '?desde='+desde+'&hasta='+hasta+ver_saldos_checked+cuentaUrl
		$('#ver_saldos').prop('checked',$('#filtro_ver_saldos_checked').val())
	$.fn.gridRequest(query)

$.fn.gridRequest = (query) ->
	nombres = ['orden','id','fecha','id_padre','cuenta',['debe','float'],['haber','float'],['saldo','float'],['desc','string'],['organizacion','string']]
	propiedades = [['Id','5%'],['Fecha','auto'],['Cuenta','auto'],['Debe','auto'],
	['Haber','auto'],['Saldo','auto'],['desc','auto', 'Descripción'],['organizacion','auto', 'Organizacion']]
	$.fn.gridPrepDatos(nombres, propiedades, query, 'cuenta')	
	
$(document).on('page:load', ready)
$(document).ready(ready)