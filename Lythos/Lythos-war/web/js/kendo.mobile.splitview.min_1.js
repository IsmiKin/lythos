/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,i){return i()})(["./kendo.mobile.application.min"],function(){(function(e){var i=window.kendo,t=i.mobile.ui,n=t.Widget,o=t.View,a=o.extend({init:function(o,a){var l=this;n.fn.init.call(l,o,a),o=l.element,e.extend(l,a),l._layout(),l._style(),i.mobile.init(o.children(i.roleSelector("modalview"))),l.panes=[],l.element.children(i.roleSelector("pane")).each(function(){l.panes.push(i.initWidget(this,{},t.roles))})},options:{name:"SplitView",style:"horizontal"},_layout:function(){var t=this,n=t.element;n.data("kendoView",t).addClass("km-view km-splitview"),t.transition=i.attrValue(n,"transition"),e.extend(t,{header:[],footer:[],content:n})},_style:function(){var i,t=this.options.style,n=this.element;t&&(i=t.split(" "),e.each(i,function(){n.addClass("km-split-"+this)}))},showStart:function(){var i=this;i.element.css("display",""),i.inited||(i.inited=!0,e.each(i.panes,function(){this.navigate("")}),i.trigger("init",{view:i})),i.trigger("show",{view:i})}});t.plugin(a)})(window.kendo.jQuery)});