ready = ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()
	if ['new','edit'].indexOf($('#action_name').val()) != -1
		activaActualizaMascara()

$.fn.gridRequest = (query) ->
	nombres = ['id','nombre','estado','desc']
	propiedades = [['Estado','5%'],['Nombre','20%'],['Desc','auto','Descripción']]
	$.fn.gridPrepDatos(nombres, propiedades, query)	
$(document).on('page:load', ready)
$(document).ready(ready)

activaActualizaMascara  = () ->
	if $('#rba_organizacion_catfiscal_id option:selected').val() == ""
	 $('#rba_organizacion_idfiscal').prop('disabled',true)
	else
		actualizaMascara()
	$('#rba_organizacion_catfiscal_id').change ->
		actualizaMascara()

actualizaMascara = () ->
	mascara = $('#rba_organizacion_catfiscal_id option:selected').data('mascara') 
	if mascara != null && mascara != undefined
		$('#rba_organizacion_idfiscal').prop('disabled',false)
		$('#rba_organizacion_idfiscal').inputmask(mascara)
	else
		$('#rba_organizacion_idfiscal').prop('disabled',true)