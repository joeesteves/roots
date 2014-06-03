ready = ->
	nombres = ['id','nombre','apellido','mail']
	propiedades = [['Nombre','20%'],['Apellido','20%'],['Mail','auto']]
	jQuery.fn.index(nombres, propiedades)
	

$(document).on('page:load', ready)
$(document).ready(ready)

# if $('#action_name').val() == 'index'
	# 	col_nombres = ["id","nombre","apellido","mail"]
	# 	col_props =  [
	# 		{ text: 'Nombre', datafield: 'nombre', width: '20%' },
	# 		{ text: 'Apellido', datafield: 'apellido', width: ' 20%' },
	# 		{ text: 'Mail', datafield: 'mail', width: 'auto' },
	# 		{ text: 'Editar', datafield: 'Editar', columntype: 'button',cellsrenderer: ->
	#       return 'Editar'
	# 		buttonclick: (row) ->
	# 			jQuery.fn.editar(row)
	# 		}
	# 		]
	# 	jQuery.fn.grid(col_nombres, col_props) 
	# else if $('#esForm').val() == 'true'
	# 	$('#rba_usuario_usuario').focus()