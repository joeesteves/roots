(function(){$.fn.gridPrepDatos=function(n,t,e,i){var r,a,o,f,d,u,h,l,s,c;if("index"===$("#action_name").val()){for(r=[],f=function(n){return r.push($.isArray(n)?{name:n[0],type:n[1]}:{name:n})},d=0,h=n.length;h>d;d++)s=n[d],f(s);for(a=[],u=0,l=t.length;l>u;u++)o=t[u],c=void 0!==o[2]?o[2]:o[0],a.push({text:c,datafield:o[0].toLowerCase(),width:o[1]});return $.fn.gridInit(r,a,e,i)}}}).call(this);