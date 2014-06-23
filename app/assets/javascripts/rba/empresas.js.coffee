ready =  ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()

	jQuery.fn.gridRequest()
jQuery.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','catfiscal', 'cuit', 'empresagrupo']
	propiedades = [
		['Codigo','auto']
		['Nombre','auto']
		['catfiscal','auto', 'Categoria Fiscal']
		['cuit', 'auto', 'C.U.I.T.']
		['empresagrupo', 'auto', 'Grupo']
	]
	
	jQuery.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
