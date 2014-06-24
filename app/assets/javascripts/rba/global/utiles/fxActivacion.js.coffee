ready = ->
	$.fn.activarCalcular()
	if $('#action_name').val() == 'index'	
		$.fn.acciones()
		$.fn.atajos()
	
$(document).ready(ready)
$(document).on('page:load', ready)	