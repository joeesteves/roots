ready = ->
	if $('#action_name').val() == 'index'
		col_nombres = ["id","nombre","apellido","mail"]
		col_props =  [
			{ text: 'Nombre', datafield: 'nombre', width: '20%' },
			{ text: 'Apellido', datafield: 'apellido', width: ' 20%' },
			{ text: 'Mail', datafield: 'mail', width: 'auto' },
			{ text: 'Editar', datafield: 'Editar', columntype: 'button',cellsrenderer: ->
	      return 'Editar'
			buttonclick: (row) ->
				jQuery.fn.editar(row)
			}
			]

		jQuery.fn.grid(col_nombres, col_props) 
	else if $('#esForm').val() == 'true'
		$('#rba_usuario_usuario').focus()

$(document).ready(ready)
$(document).on('page:load', ready)