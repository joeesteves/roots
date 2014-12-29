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
		cuentaUrl = ''
		$.each cuentas, (i,v) -> 
			cuentaUrl += '&cuentas[]='+v

		$.fn.agregarFiltros([['desde','date',desde],['hasta','date',hasta],['rco/cuentas','select',cuentas]])
		query = '?desde='+desde+'&hasta='+hasta+cuentaUrl
	$.fn.gridRequest(query)

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','cuenta',['debe','float'],'haber',['saldo','float'],'desc','desc_asiento']
	propiedades = [['id','20%'],['Fecha','auto'],['Cuenta','auto'],['Debe','auto'],
	['Haber','auto'],['Saldo','auto'],['desc','auto', 'Descripción'],['desc_asiento','auto', 'Descripción Asiento']]
	$.fn.gridPrepDatos(nombres, propiedades, query, 'cuenta')	
	
$(document).on('page:load', ready)
$(document).ready(ready)