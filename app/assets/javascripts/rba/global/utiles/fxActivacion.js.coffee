ready = ->
	$(this).foundation()
	if $('#esForm').val() == 'true'
		$.fn.activarCalcular()
		$.fn.activarFechaAutocompletado()
		$.fn.completaHoy()
		$('input').inputmask() # en el f.text_field :campo, 'data-inputmask' => "'mask:' '99-999-9'", {}
	if $('#action_name').val() == 'index'	
		$.fn.acciones()
		$.fn.atajos()
	
$(document).ready(ready)
$(document).on('page:load', ready)	