//= require chosen-jquery
ready = () ->
	if $('#esForm').val() == 'true'
		$.fn.initChosen()

$.fn.initChosen = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
$(document).ready(ready)
$(document).on('page:load',ready)