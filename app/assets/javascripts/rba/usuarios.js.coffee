ready = ->
	if $('#action_name').val() == 'index'
		col_nombres = ["id","nombre","apellido","mail"]
		col_props =  [
			{ text: 'Id', datafield: 'id', width: 'auto' },
			{ text: 'Nombre', datafield: 'nombre', width: '20%' },
			{ text: 'Apellido', datafield: 'apellido', width: ' 20%' },
			{ text: 'Mail', datafield: 'mail', width: 'auto' },
			]
		jQuery.fn.grid(col_nombres, col_props) 

$(document).ready(ready)
$(document).on('page:load', ready)
