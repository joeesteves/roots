!function(t){t.extend(t.jqx._jqxGrid.prototype,{_initpager:function(){var e=this.that,i=this.gridlocalization.pagergotopagestring,a=(this.gridlocalization.pagerrangestring,this.gridlocalization.pagershowrowsstring),s=(this.pagerheight-17)/2;if(this.pagerdiv=this.pagerdiv||t('<div style="width: 100%; height: 100%; position: relative;"></div>'),!this.pageable)return this.pagerdiv.remove(),void this.vScrollBar.jqxScrollBar({thumbSize:0});if(this.pagerrenderer){this.pagerdiv.children().remove();var r=this.pagerrenderer();null!=r&&this.pagerdiv.append(t(r)),this.pager.append(this.pagerdiv)}else{if(this.pagerdiv.css("top",s),this.pager.append(this.pagerdiv),this.pagergotoinput=this.pagergotoinput||t('<div style="margin-right: 7px; width: 27px; height: 17px; float: right;"><input style="margin-top: 0px; text-align: right; width: 27px;" type="text"/></div>'),this.pagergoto=this.pagergoto||t('<div style="float: right; margin-right: 7px;"></div>'),this.pagerrightbutton=this.pagerrightbutton||t('<div type="button" style="padding: 0px; margin-top: 0px; margin-right: 3px; width: 27px; float: right;"></div>'),this.pagerleftbutton=this.pagerleftbutton||t('<div type="button" style="padding: 0px; margin-top: 0px; margin-right: 3px; width: 27px; float: right;"></div>'),this.pagerdetails=this.pagerdetails||t('<div style="margin-right: 7px; float: right;"></div>'),this.pagershowrows=this.pagershowrows||t('<div style="margin-right: 7px; float: right;"></div>'),this.pagerbuttons=t('<div style="margin-right: 3px; float: right;"></div>'),this.pagershowrowscombo&&this.pagershowrowscombo.jqxDropDownList&&(this.pagershowrowscombo.remove(),this.pagershowrowscombo=null),this.pagergotoinput.attr("disabled",this.disabled),this.pagerfirstbutton=t('<div type="button" style="padding: 0px; margin-top: 0px; margin-left: 3px; margin-right: 3px; width: 27px; float: right;"></div>'),this.pagerlastbutton=t('<div type="button" style="padding: 0px; margin-top: 0px; margin-right: 3px; width: 27px; float: right;"></div>'),this.pagershowrowscombo=this.pagershowrowscombo||t('<div id="gridpagerlist" style="margin-top: 0px; margin-right: 7px; float: right;"></div>'),this.pagerdiv.children().remove(),this.pagershowrowscombo[0].id="gridpagerlist"+this.element.id,this.removeHandler(this.pagerrightbutton,"mousedown"),this.removeHandler(this.pagerrightbutton,"mouseup"),this.removeHandler(this.pagerrightbutton,"click"),this.removeHandler(this.pagerleftbutton,"mousedown"),this.removeHandler(this.pagerleftbutton,"mouseup"),this.removeHandler(this.pagerleftbutton,"click"),this.removeHandler(this.pagerfirstbutton,"mousedown"),this.removeHandler(this.pagerfirstbutton,"mouseup"),this.removeHandler(this.pagerfirstbutton,"click"),this.removeHandler(this.pagerlastbutton,"mousedown"),this.removeHandler(this.pagerlastbutton,"mouseup"),this.removeHandler(this.pagerlastbutton,"click"),this.pagerleftbutton.attr("title",this.gridlocalization.pagerpreviousbuttonstring),this.pagerrightbutton.attr("title",this.gridlocalization.pagernextbuttonstring),"simple"==this.pagermode){t.jqx.browser.msie&&t.jqx.browser.version<8&&(this.pagerbuttons.css("overflow","visible"),this.pagerbuttons.css("padding","3px")),this.pagerfirstbutton.attr("title",this.gridlocalization.pagerfirstbuttonstring),this.pagerlastbutton.attr("title",this.gridlocalization.pagerlastbuttonstring);var o=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");o.addClass(this.toThemeProperty("jqx-icon-arrow-first")),this.pagerfirstbutton.wrapInner(o);var h=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");h.addClass(this.toThemeProperty("jqx-icon-arrow-last")),this.pagerlastbutton.wrapInner(h),this.rtl?(this.pagerdiv.append(this.pagerlastbutton),this.pagerdiv.append(this.pagerrightbutton),this.pagerdiv.append(this.pagerbuttons),this.pagerdiv.append(this.pagerleftbutton),this.pagerdiv.append(this.pagerfirstbutton)):(this.pagerdiv.append(this.pagerfirstbutton),this.pagerdiv.append(this.pagerleftbutton),this.pagerdiv.append(this.pagerbuttons),this.pagerdiv.append(this.pagerrightbutton),this.pagerdiv.append(this.pagerlastbutton)),this.pagerlastbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme}),this.pagerfirstbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme});var n=this.rtl?"right":"left";this.pagerbuttons.css("float",n),this.pagerlastbutton.css("float",n),this.pagerfirstbutton.css("float",n),this.pagerrightbutton.css("float",n),this.pagerleftbutton.css("float",n),this.pagerdetails.css("float",this.rtl?"left":"right"),this.rtl?(this.pagerdetails.css("margin-left","7px"),this.pagerdetails.css("margin-right","0px")):(this.pagerdetails.css("margin-left","0px"),this.pagerdetails.css("margin-right","7px")),this.pagergotoinput.hide(),this.pagershowrowscombo.hide(),this.pagergoto.hide(),this.pagershowrows.hide()}else this.pagergotoinput.show(),this.pagershowrowscombo.show(),this.pagergoto.show(),this.pagershowrows.show(),this.rtl||(this.pagerdiv.append(this.pagerrightbutton),this.pagerdiv.append(this.pagerleftbutton));this.pagerrightbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme}),this.pagerleftbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme}),this.pagerleftbutton.find(".jqx-icon-arrow-left").remove(),this.pagerrightbutton.find(".jqx-icon-arrow-right").remove();var p=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");p.addClass(this.toThemeProperty("jqx-icon-arrow-left")),this.pagerleftbutton.wrapInner(p);var d=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");d.addClass(this.toThemeProperty("jqx-icon-arrow-right")),this.pagerrightbutton.wrapInner(d),this.rtl||this.pagerdiv.append(this.pagerdetails),"simple"!=this.pagermode&&(this.rtl?(this.pagerdiv.append(this.pagergoto),this.pagerdiv.append(this.pagergotoinput),this.pagerdiv.append(this.pagershowrows),this.pagerdiv.append(this.pagershowrowscombo),this.pagerdiv.append(this.pagerdetails),this.pagerdiv.append(this.pagerrightbutton),this.pagerdiv.append(this.pagerleftbutton)):(this.pagerdiv.append(this.pagershowrowscombo),this.pagerdiv.append(this.pagershowrows),this.pagerdiv.append(this.pagergotoinput),this.pagerdiv.append(this.pagergoto)));var g=this.pagesizeoptions;if(!this.pagershowrowscombo.jqxDropDownList)throw new Error("jqxGrid: jqxdropdownlist.js is not loaded.");this.pagershowrowscombo.jqxDropDownList({rtl:this.rtl,disabled:this.disabled,source:g,enableBrowserBoundsDetection:!0,keyboardSelection:!1,autoDropDownHeight:!0,width:"auto",height:16,theme:this.theme});for(var l=0,u=0;u<g.length;u++)this.pagesize>=g[u]&&(l=u);this.pagershowrows[0].innerHTML=a,this.pagergoto[0].innerHTML=i,this.updatepagerdetails(),this.pagershowrowscombo.jqxDropDownList({selectedIndex:l}),this.pagerpageinput=this.pagergotoinput.find("input"),this.pagerpageinput.addClass(this.toThemeProperty("jqx-input")),this.pagerpageinput.addClass(this.toThemeProperty("jqx-widget-content")),this.rtl&&this.pagerpageinput.css("direction","rtl");var e=this.that;this.removeHandler(this.pagershowrowscombo,"select"),this.addHandler(this.pagershowrowscombo,"select",function(t){if(t.args){e.vScrollInstance&&e.vScrollInstance.setPosition(0),null!=e.editcell&&e.endcelledit&&e.endcelledit(e.editcell.row,e.editcell.column,!0,!1);var i=t.args.index,a=e.dataview.pagenum*e.dataview.pagesize,s=g[i],r=e.pagesize;e.pagesize=parseInt(s),isNaN(e.pagesize)&&(e.pagesize=10),e.pagershowrowscombo.jqxDropDownList(s>=100?{width:"auto"}:{width:44}),e.dataview.pagesize=e.pagesize;var o=Math.floor(a/e.dataview.pagesize);e.prerenderrequired=!0,e._requiresupdate=!0,e._raiseEvent(10,{pagenum:o,oldpagesize:r,pagesize:e.dataview.pagesize}),e.gotopage(o),e.autoheight&&e._updatesizeonwindowresize&&(e._updatesize(!0),setTimeout(function(){e._updatesize(!0)},500))}});var v=this.pagergotoinput.find("input");v.addClass(this.toThemeProperty("jqx-grid-pager-input")),v.addClass(this.toThemeProperty("jqx-rc-all")),this.removeHandler(v,"keydown"),this.removeHandler(v,"change"),this.addHandler(v,"keydown",function(t){if(t.keyCode>=65&&t.keyCode<=90)return!1;if("13"==t.keyCode){var i=v.val();return i=parseInt(i),isNaN(i)||e.gotopage(i-1),!1}}),this.addHandler(v,"change",function(){var t=v.val();t=parseInt(t),isNaN(t)||e.gotopage(t-1)}),this.addHandler(this.pagerrightbutton,"mouseenter",function(){d.addClass(e.toThemeProperty("jqx-icon-arrow-right-hover"))}),this.addHandler(this.pagerleftbutton,"mouseenter",function(){p.addClass(e.toThemeProperty("jqx-icon-arrow-left-hover"))}),this.addHandler(this.pagerrightbutton,"mouseleave",function(){d.removeClass(e.toThemeProperty("jqx-icon-arrow-right-hover"))}),this.addHandler(this.pagerleftbutton,"mouseleave",function(){p.removeClass(e.toThemeProperty("jqx-icon-arrow-left-hover"))}),this.addHandler(this.pagerrightbutton,"mousedown",function(){d.addClass(e.toThemeProperty("jqx-icon-arrow-right-selected"))}),this.addHandler(this.pagerrightbutton,"mouseup",function(){d.removeClass(e.toThemeProperty("jqx-icon-arrow-right-selected"))}),this.addHandler(this.pagerleftbutton,"mousedown",function(){p.addClass(e.toThemeProperty("jqx-icon-arrow-left-selected"))}),this.addHandler(this.pagerleftbutton,"mouseup",function(){p.removeClass(e.toThemeProperty("jqx-icon-arrow-left-selected"))}),this.addHandler(t(document),"mouseup.pagerbuttons"+this.element.id,function(){d.removeClass(e.toThemeProperty("jqx-icon-arrow-right-selected")),p.removeClass(e.toThemeProperty("jqx-icon-arrow-left-selected"))}),this.addHandler(this.pagerrightbutton,"click",function(){e.pagerrightbutton.jqxButton("disabled")||(e.rtl?e.gotoprevpage():e.gotonextpage())}),this.addHandler(this.pagerleftbutton,"click",function(){e.pagerleftbutton.jqxButton("disabled")||(e.rtl?e.gotonextpage():e.gotoprevpage())});var m=this;if("simple"===this.pagermode){var c=this.pagerfirstbutton,w=this.pagerlastbutton;this.addHandler(w,"mouseenter",function(){h.addClass(m.toThemeProperty("jqx-icon-arrow-last-hover"))}),this.addHandler(c,"mouseenter",function(){o.addClass(m.toThemeProperty("jqx-icon-arrow-first-hover"))}),this.addHandler(w,"mouseleave",function(){h.removeClass(m.toThemeProperty("jqx-icon-arrow-last-hover"))}),this.addHandler(c,"mouseleave",function(){o.removeClass(m.toThemeProperty("jqx-icon-arrow-first-hover"))}),this.addHandler(w,"mousedown",function(){h.addClass(m.toThemeProperty("jqx-icon-arrow-last-selected"))}),this.addHandler(c,"mousedown",function(){o.addClass(m.toThemeProperty("jqx-icon-arrow-first-selected"))}),this.addHandler(w,"mouseup",function(){h.removeClass(m.toThemeProperty("jqx-icon-arrow-last-selected"))}),this.addHandler(c,"mouseup",function(){o.removeClass(m.toThemeProperty("jqx-icon-arrow-first-selected"))}),this.addHandler(t(document),"mouseup.pagerbuttons"+name+this.element.id,function(){d.removeClass(m.toThemeProperty("jqx-icon-arrow-right-selected")),p.removeClass(m.toThemeProperty("jqx-icon-arrow-left-selected")),h&&(h.removeClass(m.toThemeProperty("jqx-icon-arrow-last-selected")),o.removeClass(m.toThemeProperty("jqx-icon-arrow-first-selected")))}),this.addHandler(c,"click",function(){if(!c.jqxButton("disabled"))if(m.rtl){var t=m.dataview.totalrecords,e=Math.ceil(t/m.pagesize);m.gotopage(e-1)}else m.gotopage(0)}),this.addHandler(w,"click",function(){if(!w.jqxButton("disabled"))if(m.rtl)m.gotopage(0);else{var t=m.dataview.totalrecords,e=Math.ceil(t/m.pagesize);m.gotopage(e-1)}})}}this.vScrollBar.jqxScrollBar("refresh"),this._arrange()},_updatepagertheme:function(){if(null!=this.pagershowrowscombo){this.pagershowrowscombo.jqxDropDownList({theme:this.theme}),this.pagerrightbutton.jqxButton({theme:this.theme}),this.pagerleftbutton.jqxButton({theme:this.theme}),this.pagerpageinput.removeClass();var e=this.pagergotoinput.find("input");e.removeClass(),e.addClass(this.toThemeProperty("jqx-grid-pager-input")),e.addClass(this.toThemeProperty("jqx-rc-all")),this.pagerpageinput.addClass(this.toThemeProperty("jqx-input")),this.pagerpageinput.addClass(this.toThemeProperty("jqx-widget-content")),this.pagerleftbutton.find(".jqx-icon-arrow-left").remove(),this.pagerrightbutton.find(".jqx-icon-arrow-right").remove();var i=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");i.addClass(this.toThemeProperty("jqx-icon-arrow-left")),this.pagerleftbutton.wrapInner(i);var a=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");if(a.addClass(this.toThemeProperty("jqx-icon-arrow-right")),this.pagerrightbutton.wrapInner(a),"simple"==this.pagermode){t.jqx.browser.msie&&t.jqx.browser.version<8&&(this.pagerbuttons.css("overflow","visible"),this.pagerbuttons.css("padding","3px")),this.pagerfirstbutton.attr("title",this.gridlocalization.pagerfirstbuttonstring),this.pagerlastbutton.attr("title",this.gridlocalization.pagerlastbuttonstring);var s=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");s.addClass(this.toThemeProperty("jqx-icon-arrow-first")),this.pagerfirstbutton.wrapInner(s);var r=t("<div style='margin-left: 6px; width: 15px; height: 15px;'></div>");r.addClass(this.toThemeProperty("jqx-icon-arrow-last")),this.pagerlastbutton.wrapInner(r),this.pagerdiv.append(this.pagerfirstbutton),this.pagerdiv.append(this.pagerleftbutton),this.pagerdiv.append(this.pagerbuttons),this.pagerdiv.append(this.pagerrightbutton),this.pagerdiv.append(this.pagerlastbutton),this.pagerlastbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme}),this.pagerfirstbutton.jqxButton({cursor:"pointer",disabled:this.disabled,theme:this.theme}),this.pagerbuttons.css("float","left"),this.pagerlastbutton.css("float","left"),this.pagerfirstbutton.css("float","left"),this.pagerrightbutton.css("float","left"),this.pagerleftbutton.css("float","left"),this.pagergotoinput.hide(),this.pagershowrowscombo.hide(),this.pagergoto.hide(),this.pagershowrows.hide()}else this.pagergotoinput.show(),this.pagershowrowscombo.show(),this.pagergoto.show(),this.pagershowrows.show();var o=function(t,e){t.removeHandler(e,"mouseenter"),t.removeHandler(e,"mouseleave"),t.removeHandler(e,"mousedown"),t.removeHandler(e,"mouseup")};o(this,this.pagerrightbutton),o(this,this.pagerleftbutton);var h=this.that;this.addHandler(this.pagerrightbutton,"mouseenter",function(){a.addClass(h.toThemeProperty("jqx-icon-arrow-right-hover"))}),this.addHandler(this.pagerleftbutton,"mouseenter",function(){i.addClass(h.toThemeProperty("jqx-icon-arrow-left-hover"))}),this.addHandler(this.pagerrightbutton,"mouseleave",function(){a.removeClass(h.toThemeProperty("jqx-icon-arrow-right-hover"))}),this.addHandler(this.pagerleftbutton,"mouseleave",function(){i.removeClass(h.toThemeProperty("jqx-icon-arrow-left-hover"))}),this.addHandler(this.pagerrightbutton,"mousedown",function(){a.addClass(h.toThemeProperty("jqx-icon-arrow-right-selected"))}),this.addHandler(this.pagerrightbutton,"mouseup",function(){a.removeClass(h.toThemeProperty("jqx-icon-arrow-right-selected"))}),this.addHandler(this.pagerleftbutton,"mousedown",function(){i.addClass(h.toThemeProperty("jqx-icon-arrow-left-selected"))}),this.addHandler(this.pagerleftbutton,"mouseup",function(){i.removeClass(h.toThemeProperty("jqx-icon-arrow-left-selected"))})}},gotopage:function(t){if((null==t||void 0==t)&&(t=0),-1==t&&(t=0),!(0>t)){var e=this.dataview.totalrecords;this.summaryrows&&(e+=this.summaryrows.length);var i=this.pagenum;this._raiseEvent(25,{oldpagenum:this.dataview.pagenum,pagenum:t,pagesize:this.dataview.pagesize});var a=Math.ceil(e/this.pagesize);if(t>=a&&(0==this.dataview.totalrecords&&(this.dataview.pagenum=0,this.updatepagerdetails()),t>0&&(t=a-1),0>t&&(t=0)),(this.dataview.pagenum!=t||this._requiresupdate)&&this.pageable){if(this.source.pager&&this.source.pager(t,this.dataview.pagesize,this.dataview.pagenum),this.dataview.pagenum=t,this.virtualmode){if(this.hiddens=new Array,this.expandedgroups=new Array,this.rendergridrows){var s=t*this.dataview.pagesize,r=s+this.dataview.pagesize;if(null!=s&&null!=r)return this.pagerrightbutton&&(this.pagerrightbutton.jqxButton({disabled:!0}),this.pagerleftbutton.jqxButton({disabled:!0}),this.pagershowrowscombo.jqxDropDownList({disabled:!0})),this.pagerfirstbutton&&(this.pagerfirstbutton.jqxButton({disabled:!0}),this.pagerlastbutton.jqxButton({disabled:!0})),this.updatebounddata("pagechanged"),this._raiseEvent(9,{pagenum:t,oldpagenum:i,pagesize:this.dataview.pagesize}),this.updatepagerdetails(),void(this.autosavestate&&this.savestate&&this.savestate())}}else this.dataview.updateview();if(this._loadrows(),this._updatepageviews(),this.tableheight=null,this._updatecolumnwidths(),this._updatecellwidths(),this._renderrows(this.virtualsizeinfo),this.updatepagerdetails(),this.autoheight||this.autorowheight){var o=this.host.height()-this._gettableheight();height=o+this._pageviews[0].height,height!=this.host.height()&&(this._arrange(),this._updatepageviews(),this.autorowheight&&this._renderrows(this.virtualsizeinfo))}null!=this.editcell&&this.endcelledit&&this.endcelledit(this.editcell.row,this.editcell.column,!0,!1),this.focus(),this._raiseEvent(9,{pagenum:t,oldpagenum:i,pagesize:this.dataview.pagesize}),this.autosavestate&&this.savestate&&this.savestate()}}},gotoprevpage:function(){if(this.dataview.pagenum>0)this.gotopage(this.dataview.pagenum-1);else if("simple"!=this.pagermode){var t=this.dataview.totalrecords;this.summaryrows&&(t+=this.summaryrows.length);var e=Math.ceil(t/this.pagesize);this.gotopage(e-1)}},gotonextpage:function(){var t=this.dataview.totalrecords;this.summaryrows&&(t+=this.summaryrows.length);var e=Math.ceil(t/this.pagesize);this.dataview.pagenum<e-1?this.gotopage(this.dataview.pagenum+1):"simple"!=this.pagermode&&this.gotopage(0)},updatepagerdetails:function(){if(null!=this.pagerdetails&&this.pagerdetails.length>0){var e=this.dataview.pagenum*this.pagesize,i=(this.dataview.pagenum+1)*this.pagesize;i>=this.dataview.totalrecords&&(i=this.dataview.totalrecords);var a=this.dataview.totalrecords;this.summaryrows&&(a+=this.summaryrows.length,(this.dataview.pagenum+1)*this.pagesize>this.dataview.totalrecords&&(i=a)),e++;var s=Math.ceil(a/this.dataview.pagesize);if(s>=1&&s--,s++,"simple"!==this.pagermode){var r=this.pagergotoinput.find("input");r.val(this.dataview.pagenum+1)}else{var o="",h=this.pagerbuttonscount;0!=h&&h||(h=5);var n=0;for(this.rtl&&(n=h-1);this.rtl&&n>=0||!this.rtl&&h>n;){var p=1+n,d=this.dataview.pagenum/h,g=Math.floor(d);p+=g*h;var l=this.toTP("jqx-grid-pager-number");if(l+=" "+this.toTP("jqx-rc-all"),p>s)break;if(this.rtl||0==n&&p>h&&(o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+(-1+p)+"'>...</a>"),this.dataview.pagenum===p-1&&(l+=" "+this.toTP("jqx-fill-state-pressed")),this.rtl){if(n===h-1){var l=this.toTP("jqx-grid-pager-number");l+=" "+this.toTP("jqx-rc-all"),s>=1+p&&(o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+(1+p)+"'>...</a>")}this.dataview.pagenum===p-1&&(l+=" "+this.toTP("jqx-fill-state-pressed")),o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+p+"'>"+p+"</a>"}else if(o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+p+"'>"+p+"</a>",n===h-1){var l=this.toTP("jqx-grid-pager-number");l+=" "+this.toTP("jqx-rc-all"),s>=1+p&&(o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+(1+p)+"'>...</a>")}if(this.rtl){var l=this.toTP("jqx-grid-pager-number");l+=" "+this.toTP("jqx-rc-all"),0==n&&p>h&&(o+="<a class='"+l+"' tabindex=-1 href='javascript:;' data-page='"+(-1+p)+"'>...</a>")}this.rtl?n--:n++}var u=this.pagerbuttons.find("a");this.removeHandler(u,"click"),this.removeHandler(u,"mouseenter"),this.removeHandler(u,"mouseleave"),this.pagerbuttons[0].innerHTML=o;var v=this,m=function(){v.addHandler(u,"click",function(e){var i=t(e.target).attr("data-page");return v.gotopage(parseInt(i)-1),!1}),v.addHandler(u,"mouseenter",function(e){t(e.target).addClass(v.toTP("jqx-fill-state-hover"))}),v.addHandler(u,"mouseleave",function(e){t(e.target).removeClass(v.toTP("jqx-fill-state-hover"))})},u=this.pagerbuttons.find("a");m(u)}this.pagergotoinput.attr("title","1 - "+s),0==i&&e>i&&(e=0),this.pagerdetails[0].innerHTML=this.rtl?a+this.gridlocalization.pagerrangestring+i+"-"+e:e+"-"+i+this.gridlocalization.pagerrangestring+a,e>i&&this.gotoprevpage()}},_updatepagedview:function(t,e,i){var a=this.that;this.dataview.rows.length!=this.dataview.pagesize&&this.dataview.updateview();for(var s=this.dataview.rows.length,r=0;s>r;r++){var o=this.dataview.rows[r].visibleindex,h={index:o,height:this.heights[o],hidden:this.hiddens[o],details:this.details[o]};if(void 0==this.heights[o]&&(this.heights[o]=this.rowsheight,h.height=this.rowsheight),void 0==this.hiddens[o]&&(this.hiddens[o]=!1,h.hidden=!1),void 0==this.details[o]&&(this.details[o]=null),h.height!=a.rowsheight&&(e-=a.rowsheight,e+=h.height),h.hidden)e-=h.height;else{i+=h.height;var n=0;this.rowdetails&&h.details&&h.details.rowdetails&&!h.details.rowdetailshidden&&(n=h.details.rowdetailsheight,i+=n,e+=n)}}return this._pageviews[0]={top:0,height:i},e}})}(jqxBaseFramework);