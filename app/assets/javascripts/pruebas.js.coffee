ready = ->
	if $('#action_name').val() == 'index'
		_url = "pruebas.json"
		col_nombres = ["id","nombre","apellido"]
		col_props =  [
			{ text: 'Id', datafield: 'id', width: 'auto' },
			{ text: 'Nombre', datafield: 'nombre', width: '50%' },
			{ text: 'Apellido', datafield: 'apellido', width: ' 50%' },
			]
		jQuery.fn.grid(col_nombres, col_props) 

$(document).ready(ready)
$(document).on('page:load', ready)