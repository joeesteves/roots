ready = ->
	nombres = ['id','nombre','apellido','mail']
	propiedades = [['Nombre','20%'],['Apellido','20%'],['Mail','auto']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)	
$(document).on('page:load', ready)
$(document).ready(ready)