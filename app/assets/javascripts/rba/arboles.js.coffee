ready = ->
	nombres = ['id','nombre', 'model_id']
	propiedades = [['Nombre','20%']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)
	
$(document).on('page:load', ready)
$(document).ready(ready)
