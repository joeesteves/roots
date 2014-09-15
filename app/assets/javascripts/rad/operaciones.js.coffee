ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	$('.calcCuota').change ->
		calcularCuota()

$.fn.gridRequest = (query) ->
	nombres = ['id','fecha','operaciontipo_id', 'importe']
	propiedades = [['Fecha','20%'],['Importe','20%'],['Operaciontipo_id','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	

calcularCuota = () -> 
	importe = $('#rad_operacion_importe').val()
	cuotas = $('#rad_operacion_cuotas').val()
	importeCuota = (importe/cuotas).toFixed(2)
	$('#rad_operacion_cuotaimporte').val(importeCuota)

$(document).on('page:load', ready)
$(document).ready(ready)