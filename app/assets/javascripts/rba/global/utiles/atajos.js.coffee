$.fn.atajos = () ->
	$(document).keyup (e) -> 
		e.preventDefault()
		e.stopPropagation()
		if e.ctrlKey && e.altKey
			switch e.keyCode
				when 65 # Ctrl + Shift + A
					$.fn.nuevo()
				when 69 # Ctrl + Shift + S
					$.fn.editar()
				when 68 # Ctrl + Shift + D
					$.fn.borrar()
				when 67 # Ctrl + Shift + S
					$.fn.copiar()
				when 86 # Ctrl + Shift + D
					$.fn.pegar()
				when 70 # Crtl + Shift + F
					$.fn.abrirFiltros()		