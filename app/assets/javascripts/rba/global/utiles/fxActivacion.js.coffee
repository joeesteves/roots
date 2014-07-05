ready = ->
	$(this).foundation()
	if $('#esForm').val() == 'true'
		$.fn.activarCalcular()
		$.fn.activarFechaAutocompletado()
	if $('#action_name').val() == 'index'	
		$.fn.acciones()
		$.fn.atajos()
	
$(document).ready(ready)
$(document).on('page:load', ready)	