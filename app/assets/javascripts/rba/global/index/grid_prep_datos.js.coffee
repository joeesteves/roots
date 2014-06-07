jQuery.fn.gridPrepDatos = (columnas_datos_array, columnas_prop_array) ->
	if $('#action_name').val() == 'index'		
		columnas_datos_json = []
		columnas_datos_json.push({name: nombre}) for nombre in columnas_datos_array

		columnas_prop_json = []
		columnas_prop_json.push({text: dato[0], datafield: dato[0].toLowerCase(), width: dato[1]}) for dato in columnas_prop_array
		
		columnas_prop_json.push
			text: 'Editar'
			datafield: 'Editar'
			columntype: 'button'
			cellsrenderer: () -> 'Editar'
			buttonclick: (row) -> jQuery.fn.editar(row)

		jQuery.fn.gridInit(columnas_datos_json, columnas_prop_json)

	else if $('#esForm').val() == 'true'
	 	$('input:text:not(.topbar_input)').first().focus()
