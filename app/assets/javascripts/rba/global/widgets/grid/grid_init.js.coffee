$.fn.gridInit = (col_nombres, col_props, query, agrupar) -> 
	if $('#con_arbol').val() == 'true'
		if query == undefined || query == ''
			queryUrl = '?nodo=raiz'
		else
			queryUrl = '?nodo='+ query
	else
		queryUrl = ''
			
	$("#cargando").css('display', 'block')
	$("#jqxgrid").jqxGrid('destroy')
	$(".panelGrid" ).append('<div id="jqxgrid"></div>')
	url = $('#controller_full_path').val() + '.json' + queryUrl
	
	source =
	datatype: "json"
	datafields: col_nombres
	id: 'id'
	url: url
	sortcolumn: 'id'
	
	dataAdapter = new $.jqx.dataAdapter(source)
	opciones = 
		height: '100%',
		source: dataAdapter,
		ready: ->
			$('#jqxgrid').jqxGrid('localizestrings', $.fn.gridLoc())
			$('#gridpagerlistjqxgrid').css('width','auto')
			$('#cargando').css('display', 'none')
			#  $('#jqxgrid').jqxGrid('sortby', col_nombres[0].name, 'asc')
			$('#jqxgrid').on 'groupschanged', () -> 
				#$('#jqxgrid').jqxGrid('sortby', col_nombres[0].name, 'asc')
			$('#jqxgrid').on 'rowdoubleclick', (event) -> 
    		args = event.args
    		row = args.rowindex
    		$.fn.editaRow(row)
		columnsresize: true,
		columns: col_props,
		width: '100%',
		groupable: true,
		sortable: true,
		selectionmode: 'multiplerowsextended', #'checkbox', 'multiplerows'
		filterable: true,
		pageable: true,
		pagesizeoptions: ['25','50','100'],
		pagesize: 25
		groupsexpandedbydefault: true

	$("#jqxgrid").jqxGrid(opciones)

	if agrupar != undefined
		$('#jqxgrid').on 'bindingcomplete', () ->
			$("#jqxgrid").jqxGrid('addgroup', agrupar)
			$('#jqxgrid').jqxGrid('sortby', col_nombres[0].name, 'asc')