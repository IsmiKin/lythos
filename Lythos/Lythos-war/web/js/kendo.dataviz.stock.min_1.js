/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(t,e){return e()})(["./kendo.chart.min"],function(){(function(t){function e(){}function i(t){return e.prototype=t,new e}var a,o=window.kendo,n=o.Class,s=o.Observable,r=o.deepExtend,l=Math,c=t.proxy,d=o.dataviz,p=o.template,u=d.defined,f=d.ui.Chart,h=d.Selection,m=d.addDuration,v=d.duration,g=d.last,b=d.renderTemplate,_=d.toDate,x=d.toTime,S=28,w="change",y="k-",A="drag",D="dragEnd",T="_navigator",C=T,k=3,U="zoom",E="zoomEnd",B=f.extend({init:function(e,i){t(e).addClass(y+"chart"),f.fn.init.call(this,e,i)},_applyDefaults:function(t,e){var i=this,a=i.element.width()||d.DEFAULT_WIDTH,o={axisDefaults:{categoryAxis:{name:"default",field:t.dateField,majorGridLines:{visible:!1},labels:{step:2},majorTicks:{visible:!1},maxDateGroups:l.floor(a/S)}}};e&&(e=r({},e,o)),i._navigator||j.setup(t,e),f.fn._applyDefaults.call(i,t,e)},_initDataSource:function(t){var e,i,a=t||{},o=a.dataSource,n=o&&o.serverFiltering,s=[].concat(a.categoryAxis)[0],l=a.navigator||{},c=l.select,p=c&&c.from&&c.to;n&&p&&(e=[].concat(o.filter||[]),i=new d.DateCategoryAxis(r({baseUnit:"fit"},s,{categories:[c.from,c.to]})),o.filter=j.buildFilter(i.options.min,c.to).concat(e)),f.fn._initDataSource.call(this,t)},options:{name:"StockChart",dateField:"date",axisDefaults:{categoryAxis:{type:"date",baseUnit:"fit",justified:!0},valueAxis:{narrowRange:!0,labels:{format:"C"}}},navigator:{select:{},seriesDefaults:{markers:{visible:!1},tooltip:{visible:!0,template:"#= kendo.toString(category, 'd') #"},line:{width:2}},hint:{},visible:!0},tooltip:{visible:!0},legend:{visible:!1}},_redraw:function(){var t=this,e=t._navigator;e&&e.dataSource?e.redrawSlaves():(e||(e=t._navigator=new j(t)),e.filterAxes(),f.fn._redraw.call(t),e.redraw())},_onDataChanged:function(){var t=this;f.fn._onDataChanged.call(t),t._dataBound=!0},_trackSharedTooltip:function(t){var e=this,i=e._plotArea,a=i.paneByPoint(t);a&&a.options.name===T?e._unsetActivePoint():f.fn._trackSharedTooltip.call(e,t)},destroy:function(){var t=this;t._navigator.destroy(),f.fn.destroy.call(t)}}),j=s.extend({init:function(t){var e=this;e.chart=t,e.options=r({},e.options,t.options.navigator),e._initDataSource(),u(e.options.hint.visible)||(e.options.hint.visible=e.options.visible),t.bind(A,c(e._drag,e)),t.bind(D,c(e._dragEnd,e)),t.bind(U,c(e._zoom,e)),t.bind(E,c(e._zoomEnd,e))},options:{},_initDataSource:function(){var t=this,e=t.options,i=e.autoBind,a=e.dataSource;u(i)||(i=t.chart.options.autoBind),t._dataChangedHandler=c(t._onDataChanged,t),a&&(t.dataSource=o.data.DataSource.create(a).bind(w,t._dataChangedHandler),i&&t.dataSource.fetch())},_onDataChanged:function(){var t,e,i,a,o=this,n=o.chart,s=n.options.series,r=s.length,l=n.options.categoryAxis,c=l.length,d=o.dataSource.view();for(t=0;r>t;t++)i=s[t],i.axis==C&&n.isBindable(i)&&(i.data=d);for(e=0;c>e;e++)a=l[e],a.pane==T&&n._bindCategoryAxis(a,d);n._model&&(o.redraw(),o.filterAxes(),(!n.options.dataSource||n.options.dataSource&&n._dataBound)&&o.redrawSlaves())},destroy:function(){var t=this,e=t.dataSource;e&&e.unbind(w,t._dataChangeHandler),t.selection&&t.selection.destroy()},redraw:function(){this._redrawSelf();var e=this,o=e.chart,n=e.options,s=e.mainAxis(),r=i(s),l=s.options.categories,c=e.options.select||{},d=e.selection,p=l[0],u=g(l),f=c.from||p,m=c.to||u;l.length>0&&(d&&(d.destroy(),d.wrapper.remove()),r.box=s.box,d=e.selection=new h(o,r,{min:p,max:u,from:f,to:m,selectStart:t.proxy(e._selectStart,e),select:t.proxy(e._select,e),selectEnd:t.proxy(e._selectEnd,e),mousewheel:{zoom:"left"}}),n.hint.visible&&(e.hint=new a(o.element,{min:l[0],max:g(l),template:n.hint.template,format:n.hint.format})))},_redrawSelf:function(t){var e=this.chart._plotArea;e&&e.redraw(g(e.panes),t)},redrawSlaves:function(){var t=this,e=t.chart,i=e._plotArea,a=i.panes.slice(0,-1);e._plotArea.redraw(a)},_drag:function(t){var e,i,a=this,o=a.chart,n=o._eventCoordinates(t.originalEvent),s=a.mainAxis(),r=s.pane.box.containsPoint(n),c=s.options.categories,p=o._plotArea.categoryAxis,u=p.options.baseUnit,f=t.axisRanges[p.options.name],h=a.selection,g=v(p.options.min,p.options.max,p.options.baseUnit);f&&!r&&(e=_(l.min(l.max(c[0],f.min),m(d.last(c),-g,u))),i=_(l.min(m(e,g,u),d.last(c))),a.options.select={from:e,to:i},a._liveDrag()&&(a.filterAxes(),a.redrawSlaves()),h.set(e,m(e,g+1,u)),a.showHint(e,i))},_dragEnd:function(){var t=this;t.filterAxes(),t.filterDataSource(),t.redrawSlaves(),t.hint&&t.hint.hide()},_liveDrag:function(){var t=o.support,e=t.touch,i=t.browser,a=i.mozilla,n=i.msie&&9>i.version;return!e&&!a&&!n},readSelection:function(){var t=this,e=t.selection,i=e.options,a=t.options.select;a.from=i.from,a.to=i.to},filterAxes:function(){var t,e,i,a,o,n=this,s=n.options.select||{},r=n.chart,l=r.options.categoryAxis,c=s.from,d=s.to;for(a=0;l.length>a;a++)if(o=l[a],o.name===C&&(t=o.categories,t&&t.length>0)){e=x(t[0]),i=x(g(t)),c=x(c),(e>c||c>i)&&(c=e),d=x(d),(e>d||d>i)&&(d=i);break}for(a=0;l.length>a;a++)o=l[a],o.pane!==T&&(o.min=_(c),o.max=_(d))},filterDataSource:function(){var t,e=this,i=e.options.select||{},a=e.chart,o=a.dataSource,n=o&&o.options.serverFiltering;e.dataSource&&n&&(t=new d.DateCategoryAxis(r({baseUnit:"fit"},a.options.categoryAxis[0],{categories:[i.from,i.to]})).options,o.filter(j.buildFilter(m(t.min,-t.baseUnitStep,t.baseUnit),m(t.max,t.baseUnitStep,t.baseUnit))))},_zoom:function(t){var e=this,i=e.chart,a=t.delta,n=i._plotArea.categoryAxis,s=e.options.select,r=e.selection;t.originalEvent.preventDefault(),l.abs(a)>1&&(a*=k),r.options.to-r.options.from>1?(r.expand(a),e.readSelection()):(n.options.min=s.from,s.from=n.scaleRange(-t.delta).min),o.support.touch||(e.filterAxes(),e.redrawSlaves()),r.set(s.from,s.to),e.showHint(e.options.select.from,e.options.select.to)},_zoomEnd:function(t){this._dragEnd(t)},showHint:function(t,e){var i=this,a=i.chart,o=a._plotArea;i.hint&&i.hint.show(t,e,o.backgroundBox())},_selectStart:function(t){var e=this.chart;e._selectStart.call(e,t)},_select:function(t){var e=this,i=e.chart;e.showHint(t.from,t.to),i._select.call(i,t)},_selectEnd:function(t){var e=this,i=e.chart;e.hint&&e.hint.hide(),e.readSelection(),e.filterAxes(),e.filterDataSource(),e.redrawSlaves(),i._selectEnd.call(i,t)},mainAxis:function(){var t=this.chart._plotArea;return t?t.namedCategoryAxes[C]:undefined}});j.setup=function(t,e){t=t||{},e=e||{};var i=r({},e.navigator,t.navigator),a=t.panes=[].concat(t.panes),o=r({},i.pane,{name:T});i.visible||(o.visible=!1,o.height=.1),a.push(o),j.attachAxes(t,i),j.attachSeries(t,i,e)},j.attachAxes=function(t,e){var i=t.categoryAxis=[].concat(t.categoryAxis),a=t.valueAxis=[].concat(t.valueAxis),o=r({type:"date",pane:T,field:e.dateField,roundToBaseUnit:!1,justified:!0,tooltip:{visible:!1},labels:{step:1},autoBind:!e.dataSource,autoBaseUnitSteps:{minutes:[1],hours:[1],days:[1],weeks:[],months:[1],years:[1]},_overlap:!1},e.categoryAxis);i.push(r({},o,{name:C,baseUnit:"fit",maxDateGroups:200,baseUnitStep:"auto",labels:{visible:!1},majorTicks:{visible:!1}}),r({},o,{name:C+"_labels",maxDateGroups:20,baseUnitStep:"auto",autoBaseUnitSteps:{minutes:[]},majorTicks:{visible:!0}}),r({},o,{name:C+"_ticks",maxDateGroups:200,majorTicks:{visible:!0,width:.5},labels:{visible:!1,mirror:!0}})),a.push({name:C,pane:T,majorGridLines:{visible:!1},visible:!1})},j.attachSeries=function(t,e,i){var a,o=t.series=t.series||[],n=[].concat(e.series),s=i.seriesColors,l=e.seriesDefaults;for(a=0;n.length>a;a++)o.push(r({color:s[a%s.length],visibleInLegend:!1,tooltip:{visible:!1}},l,n[a],{axis:C,categoryAxis:C,autoBind:!e.dataSource}))},j.buildFilter=function(t,e){return[{field:"Date",operator:"gte",value:_(t)},{field:"Date",operator:"lt",value:_(e)}]},a=n.extend({init:function(e,i){var a=this;a.options=r({},a.options,i),a.container=e,a.chartPadding={top:parseInt(e.css("paddingTop"),10),left:parseInt(e.css("paddingLeft"),10)},a.template=a.template,a.template||(a.template=a.template=b("<div class='"+y+"navigator-hint' "+"style='display: none; position: absolute; top: 1px; left: 1px;'>"+"<div class='"+y+"tooltip'>&nbsp;</div>"+"<div class='"+y+"scroll' />"+"</div>")),a.element=t(a.template()).appendTo(e)},options:{format:"{0:d} - {1:d}",hideDelay:500},show:function(t,e,i){var a,n=this,s=_(x(t)+x(e-t)/2),r=n.options,l=o.format(n.options.format,t,e),c=n.element.find("."+y+"tooltip"),d=n.element.find("."+y+"scroll"),u=.4*i.width(),f=i.center().x-u,h=i.center().x,m=h-f,v=r.max-r.min,g=m/v,b=s-r.min;n._hideTimeout&&clearTimeout(n._hideTimeout),n._visible||(n.element.stop(!1,!0).css("visibility","hidden").show(),n._visible=!0),r.template&&(a=p(r.template),l=a({from:t,to:e})),c.text(l).css({left:i.center().x-c.outerWidth()/2,top:i.y1}),d.css({width:u,left:f+b*g,top:i.y1+parseInt(c.css("margin-top"),10)+parseInt(c.css("border-top-width"),10)+c.height()/2}),n.element.css("visibility","visible")},hide:function(){var t=this;t._hideTimeout&&clearTimeout(t._hideTimeout),t._hideTimeout=setTimeout(function(){t._visible=!1,t.element.fadeOut("slow")},t.options.hideDelay)}}),d.ui.plugin(B),r(d,{Navigator:j})})(window.kendo.jQuery)});