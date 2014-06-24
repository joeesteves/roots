# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()

	$.fn.gridRequest()
$.fn.gridRequest = (query) ->
	nombres = ['id','nombre', 'autor','categoria', 'editorial']
	propiedades = [
		['Nombre','auto']
		['Autor','auto']
		['Categoria','auto']
		['Editorial', 'auto']
	]
	
	$.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
