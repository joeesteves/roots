ready = ->
	jQuery.fn.activarCalcular = () ->
		$('input:text').focusout ->
			rta = jQuery.fn.calcular($(this).val())
			if rta == 'error'
				alert("revisar calculo")
				$(this).val('=').focus()
			else
				$(this).val(rta)
	jQuery.fn.calcular = (texto) ->
		if texto[0] == "="
			try
				fx = texto.substring(1,texto.length)
				rta = eval(fx)
			catch 
				rta = 'error'
		else 
			rta = texto
		rta

	
$(document).ready(ready)
$(document).on('page:load', ready)