$.fn.arbolInit = (modelo) ->
  if modelo == undefined
    modelo = $('#controller_path').val()
  $('#arbol_actual').val(modelo) # sirve para la accion pegar
  pdata = $.getJSON($('#root_path').val()+
    'rba/nodos.json?modelo=' + modelo
    (data) ->
      source = 
      datatype: "json"
      datafields: [
        {name: 'id'}
        {name: 'padre_id'}
        {name: 'nombre'} 
      ]
      id: 'id'
      localdata: data
      
      dataAdapter = new $.jqx.dataAdapter(source)
      dataAdapter.dataBind()
    
      records = dataAdapter.getRecordsHierarchy(
        'id'
        'padre_id'
        'items'
        [{ name: 'nombre', map: 'label'}]
      )
      
      $('#jqxTree').jqxTree({ source: records, width: '100%'})
      $('#jqxTree').jqxTree('expandAll')
  )
  
  $("#jqxTree").on(
    'dragEnd'
    (event) -> 
      itemLabel = event.args.id;
      itemValue = event.args.value;
      $.ajax(
        type: "PATCH"
        url: 'nodos/'+$('#jqxTree').jqxTree('getSelectedItem').id
        data:
          rba_nodo:
            padre_id: $('#jqxTree').jqxTree('getSelectedItem').parentElement.id
        dataType: "json"
      )   
      $('#jqxgrid').jqxGrid('updatebounddata')
  )
  $('#jqxTree').on(
    'select'
    (event) ->
      args = event.args
      item = $('#jqxTree').jqxTree('getItem', args.element)
      label = item.label
      $.fn.gridRequest(item.id)
      $('#nodo_actual').val(item.id)
  ) 