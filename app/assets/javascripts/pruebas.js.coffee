# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()

	jQuery.fn.gridRequest()
jQuery.fn.gridRequest = (query) ->
	nombres = ['id','nombre', 'apellido']
	propiedades = [
		['Nombre','auto']
		['Apellido','auto']
	]
	
	jQuery.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
