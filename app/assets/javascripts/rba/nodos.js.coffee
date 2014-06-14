ready = ->
	nombres = ['id','nombre', 'padre_id']
	propiedades = [['Id','20%'],['Nombre','20%'], ['Padre_id','20%']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)
	
$(document).on('page:load', ready)
$(document).ready(ready)
