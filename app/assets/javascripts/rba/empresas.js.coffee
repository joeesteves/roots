ready =  ->
	if $('#con_arbol').val() == 'true'
		$.fn.arbolInit()
	$.fn.gridRequest()

$.fn.gridRequest = (query) ->
	nombres = ['id','codigo', 'nombre','catfiscal', 'cuit', 'empresagrupo']
	propiedades = [
		['Codigo','auto']
		['Nombre','auto']
		['catfiscal','auto', 'Categoria Fiscal']
		['cuit', 'auto', 'C.U.I.T.']
		['empresagrupo', 'auto', 'Grupo']
	]
	
	$.fn.gridPrepDatos(nombres, propiedades, query, undefined)
	
$(document).on('page:load', ready)
$(document).ready(ready)
