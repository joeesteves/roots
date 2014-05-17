ready = ->
	if $('#action_name').val() == 'index'
		col_nombres = ["id", "nombre","apellido"]
		col_props =  [
			{ text: 'Nombre', datafield: 'nombre', width: '40%' },
			{ text: 'Apellido', datafield: 'apellido', width: ' 40%' },
			{ text: 'Editar', datafield: 'Editar', columntype: 'button',cellsrenderer: ->
	      return 'Editar'
			buttonclick: (row) ->
				jQuery.fn.editar(row)
			}
			]
		jQuery.fn.grid(col_nombres, col_props) 


$(document).ready(ready)
$(document).on('page:load', ready)