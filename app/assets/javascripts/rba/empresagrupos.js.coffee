ready = ->
	nombres = ['id','codigo', 'nombre','desc',]
	propiedades = [['Codigo','20%'],['Nombre','20%'],['Descripción','auto']]
	jQuery.fn.index(nombres, propiedades)
	
$(document).on('page:load', ready)
$(document).ready(ready)
