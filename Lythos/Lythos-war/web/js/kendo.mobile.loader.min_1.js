/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(n,i){return i()})(["./kendo.core.min"],function(){(function(n){var i=window.kendo,t=i.mobile.ui,o=t.Widget,e=n.map(i.eventMap,function(n){return n}).join(" ").split(" "),a=o.extend({init:function(i,t){var e=this,a=n('<div class="km-loader"><span class="km-loading km-spin"></span></div>');o.fn.init.call(e,a,t),e.container=i,e._attachCapture(),a.append(e.options.loading).hide().appendTo(i)},options:{name:"Loader",loading:"<h1>Loading...</h1>",timeout:100},show:function(){var n=this;clearTimeout(n._loading),n.options.loading!==!1&&(n._loading=setTimeout(function(){n.element.show()},n.options.timeout))},hide:function(){var n=this;clearTimeout(n._loading),n.element.hide()},transition:function(){this.transitioning=!0,this.container.css("pointer-events","none")},transitionDone:function(){this.transitioning=!1,this.container.css("pointer-events","")},_attachCapture:function(){function n(n){t.transitioning&&n.stopPropagation()}var i,t=this;for(t.transitioning=!1,i=0;e.length>i;i++)t.container[0].addEventListener(e[i],n,!0)}});t.plugin(a)})(window.kendo.jQuery)});