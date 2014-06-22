ready =  ->
	if $('#con_arbol').val() == 'true'
		jQuery.fn.arbolInit()

	jQuery.fn.gridRequest()
jQuery.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','catfiscal', 'cuit', 'empresagrupo']
	propiedades = [
		['Codigo','15%']
		['Nombre','15%']
		['catfiscal','25%', 'Categoria Fiscal']
		['cuit', '20%	', 'C.U.I.T.']
		['empresagrupo', '15%', 'Grupo']
	]
	
	jQuery.fn.gridPrepDatos(nombres, propiedades, query)
	
$(document).on('page:load', ready)
$(document).ready(ready)
