jQuery.fn.index = (columnas_datos_array, columnas_prop_array) ->
	if $('#action_name').val() == 'index'		
		a = []
		a.push({"name": nombre}) for nombre in columnas_datos_array
		b = JSON.stringify(a)
		columnas_datos_json = JSON.parse(b)
		
		c = []
		c.push({text: dato[0], datafield: dato[0].toLowerCase(), width: dato[1]}) for dato in columnas_prop_array
		
		d = JSON.stringify(c)
		columnas_prop_json = JSON.parse(d)
		columnas_prop_json.push
			text: 'Editar'
			datafield: 'Editar'
			columntype: 'button'
			cellsrenderer: () -> return "Editar"
			buttonclick: (row) -> jQuery.fn.editar(row)
		console.log(c)
		console.log(d)
		console.log(columnas_prop_json)
		jQuery.fn.grid(columnas_datos_json, columnas_prop_json)

	else if $('#esForm').val() == 'true'
	 	$('input:text:not(.topbar_input)').first().focus()
