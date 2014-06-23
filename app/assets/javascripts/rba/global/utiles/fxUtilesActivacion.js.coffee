ready = ->
	jQuery.fn.activarCalcular()
	jQuery.fn.atajos()
	
$(document).ready(ready)
$(document).on('page:load', ready)	