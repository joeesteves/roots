//= require chosen-jquery
ready = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
$(document).ready(ready)
$(document).on('load',ready)