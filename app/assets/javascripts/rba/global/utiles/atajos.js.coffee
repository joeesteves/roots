jQuery.fn.atajos = () ->
	$(document).keyup (e) -> 
		e.preventDefault()
		e.stopPropagation()
		if e.ctrlKey && e.shiftKey && e.keyCode==65 # Ctrl + Shift + A
			if $('#nodo_actual').val() == ''
				nodo = ''
			else
				nodo = '?nodo=' + $('#nodo_actual').val()
			$(location).attr('href',$('#controller_full_path').val()+'/new'+ nodo)