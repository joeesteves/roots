(function(){var a,e,i,o,t,r,n,c,s,p,d,u,l,_,h,m,f,g,v,b,w,k,x,y,D;x=function(){switch($.fn.comun(),$("#rad_operacion_fecha").change(function(){return"0"===$("#edicion_venc_manual").val()?$("#rad_operacion_venc").val($(this).val()):void 0}),$("#rad_operacion_venc").change(function(){return $(this).val()!==$("#rad_operacion_fecha").val()?$("#edicion_venc_manual").val("1"):void 0}),$(".calcular_valores").change(function(){return d()}),$("#rad_operacion_operaciontipo_id").change(function(){return g("i"),w("o"),e(),a()}),$("#rad_operacion_organizacion_id").change(function(){return a()}),$("#action_name").val()){case"new":e();break;case"edit":case"create":$.fn.defineUiXOpTipo()}return r()},r=function(){return $(".agregar_campos_D, .agregar_campos_H").click(function(){var a,e,i,o;return o=(new Date).getTime(),i=new RegExp($(this).data("id"),"g"),null!==$(this).attr("class").match(/agregar_campos_D/g)?(a=".row.debe",e="ContainerDebe"):(a=".row.haber",e="ContainerHaber"),0!==$(a).length?($(a+":last").after($(this).data("fields").replace(i,o)),$(a+":last select").empty().append($(a+":first select option").clone()).trigger("chosen:updated")):$("#container."+e).append($(this).data("fields").replace(i,o)),$.fn.initChosen(),s(!1),y($("#rad_operacion_rdosxmes").prop("checked")),!1}),$("form").on("click",".simil_agrega_campos_D",function(){return $(".agregar_campos_D").click(),!1}),$("form").on("click",".simil_agrega_campos_H",function(){return $(".agregar_campos_H").click(),!1}),$("form").on("click",".quitar_campos",function(){return $(this).parent().prev("input[type=hidden]").val("1"),$(this).closest(".row").find("input.valor").val(0),$(this).closest(".row").find("input._destroy").val("true"),$(this).closest(".row").hide(),c(),$(".chosen-single:visible")[1].focus(),!1}),$("#rad_operacion_rdosxmes").click(function(){return y($(this).prop("checked"))})},k=function(){return $("#aplicaciones_origen option:selected").sort(function(a,e){return $(a).data("cuenta")-$(e).data("cuenta")})},n=function(){var a,e,i,o,t;return i=void 0,o=0,a=0,t=-1,e=[],$.each(k(),function(){var r;return r=$(this).data("cuenta"),r===i?(o+=parseFloat($(this).data("disponible")),a+=parseFloat($(this).data("aplicado"))):(t+=1,o=parseFloat($(this).data("disponible")),a=parseFloat($(this).data("aplicado"))),e[t]={cuenta:r,disponible:o,aplicado:a},i=r}),e},o=function(){var a,e,i,o;if(i=n(),a=m(),i.length!==$(".row."+a).length)for($(".row."+a).not(":first").remove(),e=i.length;e-=1;)$("a.agregar_campos_"+a[0].toUpperCase()).click();return o=function(){return $(".row."+a).each(function(e){return $("select."+a,this).val(i[e].cuenta),$("input[type=text]."+a,this).val(i[e].aplicado.toFixed(2))}),$(".row."+a+" select").trigger("chosen:updated")},o(),c()},i=function(a){return $(".row."+u()+":first select").val(a).trigger("chosen:updated")},e=function(){return $.ajax({type:"POST",url:$("#root_path").val()+"rco/cuentas/x_operacion_tipo",data:{operaciontipo_codigo:l()},dataType:"script"})},a=function(){var a;switch($("#action_name").val()){case"edit":a={saldo_tipo:m(),rad_operacion_id:_(),operaciontipo_codigo:l()};break;case"new":case"create":a={saldo_tipo:m(),organizacion_id:h(),operaciontipo_codigo:l()}}return $.ajax({type:"POST",url:$("#root_path").val()+"rad/operaciones/compatibles",data:a,dataType:"script"})},t=function(a,e,i){var o,t;return o="reg_"+a.attr("id"),t=parseFloat("undefined"===a.data("aplicado")||"onSelect"===e?a.data("disponible"):a.data("aplicado")),$("#compatibles_"+i+"_importe").append("<span>Ref "+a.data("desc")+"</span><input id="+o+" name="+o+' type="text" value="'+t+'">'),$("#compatibles_"+i+"_importe input").change(function(){return p(i)})},p=function(a){return $("#rad_operacion_importe").val(0),$("#compatibles_"+a+"_importe input").each(function(){var e,t,r,n;return e=$(this).attr("id").substr(4),t=$("#aplicaciones_"+a+" #"+e),parseFloat($(this).val())>parseFloat(t.data("disponible"))&&$(this).val(t.data("disponible")),t.data("aplicado",$(this).val()),n=t.val().split(", "),r=n[0]+", "+n[1]+", "+$(this).val(),t.val(r),"origen"===a?o():"destino"===a?i(n[1]):void 0}),d()},d=function(){var a,e,i,o,t,r;switch(r="#rad_operacion_",i=$(r+"importe").val(),a=$(r+"cuotas").val(),o=$(r+"cuotaimporte").val(o),f()){case!0:t=(a*o).toFixed(2),e="importe",$("input."+u()).val(o);break;case!1:t=(i/a).toFixed(2),e="cuotaimporte",$("input."+u()+":first").val(i)}return $(r+e).val(t)},s=function(a){var e;return e=".row."+m(),a===!0&&c(),$(e+" input[name*=valor], #rad_operacion_rdosxmes").change(function(){return c()})},c=function(){var a,e,i;switch(a=".row."+m(),i=0,$.each($(a+" input[name*=valor]"),function(){var a;return a=0,""!==$(this).val()&&(a=$(this).val()),i+=parseFloat(a)}),f()){case!0:e="cuotaimporte";break;case!1:e="importe"}return $("#rad_operacion_"+e).val(i.toFixed(2)),d()},m=function(){switch(l()){case-1:case-2:case-3:return"debe";case 1:case 2:case 3:return"haber";case 0:return"debe"}},u=function(){switch(l()){case-1:case-2:case-3:return"haber";case 1:case 2:case 3:return"debe";case 0:return"haber"}},h=function(){return $("#rad_operacion_organizacion_id").val()},_=function(){return $("#rad_operacion_id").val()},f=function(){return $("#rad_operacion_rdosxmes").prop("checked")},l=function(){return $("#rad_operacion_operaciontipo_id option:selected").data("codigo")},v=function(){var a,e,i;switch(a=m()){case"debe":e=!0,i=!e,$("a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos").show(),$("a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos, .debe a.quitar_campos:first").hide();break;case"haber":e=!1,i=!e,$("a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos").show(),$("a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos, .haber a.quitar_campos:first").hide();break;case"movimiento_fondos":e=!1,i=e,$("a.simil_agrega_campos_H, a.agregar_campos_H, .haber a.quitar_campos").hide(),$("a.simil_agrega_campos_D, a.agregar_campos_D, .debe a.quitar_campos").hide()}return"movimiento_fondos"!==a&&"edit"!==$("#action_name").val()&&$(".row."+a).not(":first").remove(),$("input.debe").prop("readonly",i),$("input.haber").prop("readonly",e),$("input[readonly]").prop("tabindex",-1),$("input:not([readonly])").removeProp("tabindex")},g=function(a){var e;return e=D(a),$("#rad_operacion_cuotas, #rad_operacion_cuotaimporte").prop("readonly",!e)},w=function(a){var e;return e=D(a),$("#rad_operacion_rdosxmes").prop("disabled",!e),$("#rad_operacion_rdosxmes").prop("checked",e),y(!e)},b=function(a){switch(a){case"i":return $("#rad_operacion_organizacion_id").prop("disabled",!1).parent().show();case"o":return $("#rad_operacion_organizacion_id").prop("disabled",!0).parent().hide()}},y=function(a){var e;return a===!0&&(e="Valor mensual"),a===!1&&(e="Valor"),$("input[name*=valor]").attr("placeholder",e)},D=function(a){switch(a){case"i":return!0;case"o":return!1}},$.fn.defineUiXOpTipo=function(){var e;if(e=l(),0===e)g("o"),w("o"),b("o");else switch(b("i"),a(),e){case 3:case-3:w("i");break;default:w("o")}return v(),s(!0),$("a.agregar_campos_D, a.agregar_campos_H").prop("tabindex",-1)},$.fn.cargaCompatibles=function(a,e){return $("#compatibles_"+e).empty(),$("#compatibles_"+e+"_importe").empty(),0!==a.length?($("#compatibles_"+e).append("<span>"+e+'</span><select data-placeholder="Seleccionar registros" id="aplicaciones_'+e+'" name="aplicaciones_'+e+'[]" multiple></select>'),$.each(a,function(){var a;return a='<option id="'+this.id+'" value="'+this.id+", "+this.cuenta_id+", "+this.disponible+'" data-disponible="'+this.disponible+'"data-aplicado="'+this.aplicado_a_registro+'"data-cuenta="'+this.cuenta_id+'"data-desc="'+this.desc+'">'+this.desc+" -- disp: "+this.disponible+" -- venc: "+this.fecha+"</option>",$("#aplicaciones_"+e).append(a)}),$("#aplicaciones_"+e).change(function(){return $("#compatibles_"+e+"_importe").empty(),$("#aplicaciones_"+e+" option:selected").each(function(){return t($(this),"onSelect",e)}),p(e),$("#compatibles_"+e+"_importe input").focus()}),$.fn.initChosen()):void 0},$.fn.seleccionaAplicados=function(a,e){return $("#aplicaciones_"+e+" "+a).prop("selected",!0).trigger("chosen:updated"),$.each($("#aplicaciones_"+e+" "+a),function(){return t($(this),"onRecord",e)})},$.fn.gridRequest=function(a){var e,i;return e=["id","fecha","tipo","importe",["desc","string"],"cuotaimporte"],i=[["Fecha","20%"],["Tipo","auto"],["Importe","20%"],["desc","auto","Descripci\xf3n"],["cuotaimporte","auto","Cuota"]],$.fn.gridPrepDatos(e,i,a,"tipo")},$(document).on("page:load",x),$(document).ready(x)}).call(this);