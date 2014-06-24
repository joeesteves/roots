ready = ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()
	
	jQuery.fn.gridRequest()
	
	filtrarNodosPadres()

jQuery.fn.gridRequest = () ->	
	nombres = ['id','arbol', 'nombre', 'padre_id']
	propiedades = [['Id','auto'],['Arbol','auto'],['Nombre','auto'], ['Padre_id','auto']]
	agrupar = 'arbol'
	jQuery.fn.gridPrepDatos(nombres, propiedades, undefined, agrupar)

filtrarNodosPadres = () ->
	$('#rba_nodo_padre_id').parent().hide()
	padres = $('#rba_nodo_padre_id').html()
	$('#rba_nodo_arbol_id').change ->	
		arbol = $('#rba_nodo_arbol_id :selected').text()
		arbol_esc = arbol.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
		opciones = $(padres).filter("optgroup[label='#{arbol_esc}']").html()
		if opciones
			$('#rba_nodo_padre_id').html(opciones)
			$('#rba_nodo_padre_id').parent().show()
			$('#rba_nodo_padre_id').trigger("chosen:updated")
		else
			$('#rba_nodo_padre_id').parent().hide()
			$('#rba_nodo_padre_id').empty()
			$('#rba_nodo_padre_id').trigger("chosen:updated")


$(document).on('page:load', ready)
$(document).ready(ready)
