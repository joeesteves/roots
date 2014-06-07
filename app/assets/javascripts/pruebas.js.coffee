# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	nombres = ['id','nombre','apellido']
	propiedades = [['Nombre','40%'],['Apellido','40%']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)
	

$(document).on('page:load', ready)
$(document).ready(ready)