(function(){var e,i;i=function(){return"true"===$("#con_arbol").val()&&$.fn.arbolInit(),$.fn.gridRequest()},$.fn.gridRequest=function(i){var n,t;return n=["id","codigo","nombre","superficie","desc"],t=[["Codigo","auto"],["Nombre","auto"],["desc","auto","Descripcion"],["Superficie","auto"]],$.fn.gridPrepDatos(n,t,i,void 0),$(".agregar_campos").click(function(){var i,n;return n=(new Date).getTime(),i=new RegExp($(this).data("id"),"g"),$("#container").append($(this).data("fields").replace(i,n)),$.fn.initChosen(),$(".chosen-single:visible").last().focus(),e(),!1}),e()},e=function(){return $(".simil_agrega_campos").click(function(){return $(".agregar_campos").click(),!1}),$(".quitar_campos").click(function(){$(this).parent().prev("input[type=hidden]").val("1"),$(this).closest(".row").hide();try{$(".chosen-single:visible")[1].focus()}catch(e){}return!1})},$(document).on("page:load",i),$(document).ready(i)}).call(this);