(function(){var o;o=function(){return"true"===$("#con_arbol").val()&&$.fn.arbolInit(),$.fn.gridRequest()},$.fn.gridRequest=function(o){var a,r;return a=["id","estado","codigo","rp","nombre","alias","desc","color","madre","padre"],r=[["Estado","auto"],["Codigo","auto"],["Rp","auto"],["Nombre","auto"],["Alias","auto"],["Desc","auto","Descripci\xf3n"],["Color","auto"],["Madre","auto"],["Padre","auto"]],$.fn.gridPrepDatos(a,r,o)},$(document).on("page:load",o),$(document).ready(o)}).call(this);