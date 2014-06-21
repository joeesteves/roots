ready = ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()
	jQuery.fn.gridRequest()
	filtrarNodosPadres()

jQuery.fn.gridRequest = () ->	
	nombres = ['id','nombre', 'padre_id']
	propiedades = [['Id','20%'],['Nombre','20%'], ['Padre_id','20%']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)

filtrarNodosPadres = () ->
	$('#rba_nodo_padre_id').parent().hide()
	$('#rba_nodo_arbol_id').change ->
			padres = $('#rba_nodo_padre_id').html()
			arbol = $('#rba_nodo_arbol_id :selected').text()
			arbol_esc = arbol.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
			opciones = $(padres).filter("optgroup[label='#{arbol_esc}']").html()
			if opciones
				$('#rba_nodo_padre_id').html(opciones)
				$('#rba_nodo_padre_id').parent().show()
			else
				$('#rba_nodo_padre_id').parent().hide()
				$('#rba_nodo_padre_id').empty()
			$('#rba_nodo_padre_id').trigger("chosen:updated");

$(document).on('page:load', ready)
$(document).ready(ready)
