(function(){var n;n=function(){return"true"===$("#con_arbol").val()&&$.fn.arbolInit(),$.fn.gridRequest($("#nodo_actual").val())},$.fn.gridRequest=function(n){var e,o;return e=["id","nombre","estado","desc"],o=[["Estado","5%"],["Nombre","40%"],["Desc","auto","Descripci\xf3n"]],$.fn.gridPrepDatos(e,o,n)},$(document).on("page:load",n),$(document).ready(n)}).call(this);