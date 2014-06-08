ready = ->
	nombres = ['id','codigo', 'nombre','catfiscal', 'cuit', 'empresagrupo']
	propiedades = [
		['Codigo','15%']
		['Nombre','15%']
		['catfiscal','25%', 'Categoria Fiscal']
		['cuit', '20%	', 'C.U.I.T.']
		['empresagrupo', '15%', 'Grupo']
	]
	jQuery.fn.gridPrepDatos(nombres, propiedades)
	$('#rba_empresa_cuit').inputmask('99-99999999-9') if $('#esForm').val() == 'true'	
	
$(document).on('page:load', ready)
$(document).ready(ready)
