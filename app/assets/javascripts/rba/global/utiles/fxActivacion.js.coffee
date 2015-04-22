ready = ->
	$(this).foundation()
	if $('#esForm').val() == 'true'
		$.fn.activarCalcular()
		$.fn.activarFechaAutocompletado()
		$.fn.completaHoy()
		$('input').inputmask() # en el f.text_field :campo, 'data-inputmask' => "'mask:' '99-999-9'", {}
	switch $('#action_name').val() 
		when 'index' then (	
			$.fn.acciones()
			$.fn.atajos()
		)
		when 'new' then (
			$('input[id$="estado"]').prop('checked',true).prop('tabindex', -1) if $('input[id$="estado"]').length != 0
		)
		else (
			$.fn.atajos()
			$.fn.acciones()
		)
$(document).ready(ready)
$(document).on('page:load', ready)	