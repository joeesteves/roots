ready = ->
	$('#filtro_desde').val($.fn.primerDiaDelMesActual()) if  $('#filtro_desde').val() == ""
	$('#filtro_hasta').val($.fn.ultimoDiaDelMesActual()) if  $('#filtro_hasta').val() == ""
	desde = $('#filtro_desde').val()
	hasta = $('#filtro_hasta').val()
	$.fn.agregarFiltros([['desde','date',desde],['hasta','date',hasta]])

$(document).on('page:load', ready)
$(document).ready(ready)