(function(){var a,i,n;n=function(){return"true"===$("#con_arbol").val()&&$.fn.arbolInit(),$.fn.gridRequest(),-1!==["new","edit","create"].indexOf($("#action_name").val())?a():void 0},$.fn.gridRequest=function(a){var i,n;return i=["id","nombre","estado","desc","idfiscal"],n=[["Estado","5%"],["Nombre","20%"],["Idfiscal","auto","N\xb0 Id"],["Desc","auto","Descripci\xf3n"]],$.fn.gridPrepDatos(i,n,a)},$(document).on("page:load",n),$(document).ready(n),a=function(){return""===$("#rba_organizacion_catfiscal_id option:selected").val()?$("#rba_organizacion_idfiscal").prop("disabled",!0):i(),$("#rba_organizacion_catfiscal_id").change(function(){return i()})},i=function(){var a;return a=$("#rba_organizacion_catfiscal_id option:selected").data("mascara"),null!==a&&void 0!==a?($("#rba_organizacion_idfiscal").prop("disabled",!1),$("#rba_organizacion_idfiscal").inputmask(a)):$("#rba_organizacion_idfiscal").prop("disabled",!0)}}).call(this);