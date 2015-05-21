ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest($('#nodo_actual').val())
	switch $('#action_name').val()
		when 'new', 'edit','create'
			interruptor_organizacion()
			$('#rco_cuenta_cuentatipo_id').change ->
				interruptor_organizacion()

interruptor_organizacion = () ->
	if $('#rco_cuenta_cuentatipo_id option:selected').data("codigo") == 2.1
		$('#rco_cuenta_organizacion_id').prop('disabled', false)
		$('.organizacion_div').show()
	else
		$('#rco_cuenta_organizacion_id').prop('disabled', true)
		$('.organizacion_div').hide()



$.fn.gridRequest = (query) ->
	nombres = ['id','codigo','nombre','tipo','grupo','desc','estado']
	propiedades = [['Codigo','auto'],['Nombre','auto'],['Tipo','auto'],
	['Grupo','auto'],['desc','auto', 'Descripción'],['Estado','auto']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
	
$(document).on('page:load', ready)
$(document).ready(ready)