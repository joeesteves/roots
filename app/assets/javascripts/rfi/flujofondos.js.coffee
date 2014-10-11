ready = ->
	if $('#action_name').val() == 'index'
		$.fn.agregarFiltros([['hasta','date'],['rco/cuentas','select']])
$(document).on('page:load', ready)
$(document).ready(ready)