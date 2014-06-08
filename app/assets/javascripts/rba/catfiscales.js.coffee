ready = ->
	nombres = ['id','codigo','nombre','desc']
	propiedades = [['Codigo','20%'],['Nombre','20%'],['Desc','auto','Descripción']]
	jQuery.fn.gridPrepDatos(nombres, propiedades)	
$(document).on('page:load', ready)
$(document).ready(ready)