jQuery.fn.gridPrepDatos = (columnas_datos_array, columnas_prop_array) ->
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
		
		columnas_prop_json.push
			text: 'Editar'
			datafield: 'Editar'
			columntype: 'button'
			cellsrenderer: () -> 'Editar'
			buttonclick: (row) -> jQuery.fn.editar(row)

		jQuery.fn.gridInit(columnas_datos_json, columnas_prop_json)

	else if $('#esForm').val() == 'true'
	 	$('input:text:not(.topbar_input)').first().focus()
	 	$('input').inputmask() # en el f.text_field :campo, 'data-inputmask' => "'mask:' '99-999-9'", {}
