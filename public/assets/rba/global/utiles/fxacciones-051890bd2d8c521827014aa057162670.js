(function(){$.fn.acciones=function(){return $("#borrar").click(function(){return $.fn.borrar()}),$("#nuevo").click(function(){return $.fn.nuevo()}),$("#editar").click(function(){return $.fn.editar()}),"true"===$("#con_arbol").val()?($("#copiar").show(),$("#pegar").show(),$("#copiar").click(function(){return $.fn.copiar()}),$("#pegar").click(function(){return $.fn.pegar()})):($("#copiar").hide(),$("#pegar").hide()),$("#importar").click(function(){return $.fn.cerrarMenu()})},$.fn.borrar=function(){return confirm("Quiere borrar "+$.fn.getSelected().length+" elementos ?")?$.ajax({type:"POST",url:$("#controller_full_path").val()+"/borrar_seleccion",data:{ids:$.fn.getSelected()},dataType:"script",complete:function(){return $("#jqxgrid").jqxGrid("updatebounddata"),$("#jqxgrid").jqxGrid("clearselection")}}):void 0},$.fn.nuevo=function(){var r;return r=""===$("#nodo_actual").val()?"":"?nodo="+$("#nodo_actual").val(),$(location).attr("href",$("#controller_full_path").val()+"/new"+r)},$.fn.editar=function(){var r,e;return r=$.fn.getSelected(),e=$("#nodo_actual").val(),$(location).attr("href",$("#controller_full_path").val()+"/editar_multiples?items="+r+"&nodo="+e)},$.fn.copiar=function(){return $("#items_seleccionados").val($.fn.getSelected())},$.fn.pegar=function(){return $.ajax({type:"POST",url:$("#root_path").val()+"rba/mover_items",data:{controller_path:$("#controller_path").val(),nodo:$("#nodo_actual").val(),items:$("#items_seleccionados").val()},dataType:"script",complete:function(){return $("#jqxgrid").jqxGrid("updatebounddata"),$("#jqxgrid").jqxGrid("clearselection"),$("#items_seleccionados").val("")}})},$.fn.abrirFiltros=function(){return $("#filtro").foundation("reveal","open")},$.fn.editaRow=function(r){var e,t;return"/rco/registros"===$("#controller_full_path").val()?(e=$("#jqxgrid").jqxGrid("getrowdata",r).id_padre,t="/rco/asientos/"+e+"/edit"):(e=$("#jqxgrid").jqxGrid("getrowdata",r).id,t=$("#controller_full_path").val()+"/"+e+"/edit"),$(location).attr("href",t)},$.fn.getSelected=function(){var r,e;return r=$("#jqxgrid").jqxGrid("getselectedrowindexes"),e=[],$.each(r,function(t){return e.push($("#jqxgrid").jqxGrid("getrowdata",r[t]).id)}),e},$.fn.cerrarMenu=function(){return $(".has-dropdown").removeClass("hover")}}).call(this);