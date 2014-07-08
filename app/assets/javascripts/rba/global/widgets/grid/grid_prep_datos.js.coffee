$.fn.gridPrepDatos = (columnas_datos_array, columnas_prop_array, query, agrupar) ->
	if $('#action_name').val() == 'index'		
		columnas_datos_json = []
		columnas_datos_json.push({name: nombre}) for nombre in columnas_datos_array

		columnas_prop_json = []
		for dato in columnas_prop_array
			if dato[2] != undefined
				titulo = dato[2]
			else
				titulo = dato[0]
			columnas_prop_json.push({text: titulo, datafield: dato[0].toLowerCase(), width: dato[1]}) 
		# CODIGO PARA ACTIVAR UNA COLUMNA CON EL BOTON EDITAR
		# FUE REEMPLAZADO POR DOBLE-CLICK
		# columnas_prop_json.push
		# 	text: 'Editar'
		# 	datafield: 'Editar'
		# 	columntype: 'button'
		# 	width: '5%'
		# 	cellsrenderer: () -> 'Editar'
		# 	buttonclick: (row) -> $.fn.editaRow(row)
			
		$.fn.gridInit(columnas_datos_json, columnas_prop_json, query, agrupar)

	 
