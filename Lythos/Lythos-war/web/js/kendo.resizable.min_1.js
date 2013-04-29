/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(i,t){return t()})(["./kendo.core.min","./kendo.draganddrop.min"],function(){(function(i,t){var n=window.kendo,o=n.ui,e=o.Widget,s=i.proxy,r=i.isFunction,a=i.extend,c="horizontal",u="vertical",l="start",d="resize",p="resizeend",g=e.extend({init:function(i,t){var n=this;e.fn.init.call(n,i,t),n.orientation=n.options.orientation.toLowerCase()!=u?c:u,n._positionMouse=n.orientation==c?"x":"y",n._position=n.orientation==c?"left":"top",n._sizingDom=n.orientation==c?"outerWidth":"outerHeight",n.draggable=new o.Draggable(i,{distance:0,filter:t.handle,drag:s(n._resize,n),dragcancel:s(n._cancel,n),dragstart:s(n._start,n),dragend:s(n._stop,n)}),n.userEvents=n.draggable.userEvents},events:[d,p,l],options:{name:"Resizable",orientation:c},_max:function(i){var n=this,o=n.hint?n.hint[n._sizingDom]():0,e=n.options.max;return r(e)?e(i):e!==t?n._initialElementPosition+e-o:e},_min:function(i){var n=this,o=n.options.min;return r(o)?o(i):o!==t?n._initialElementPosition+o:o},_start:function(t){var n=this,o=n.options.hint,e=i(t.currentTarget);n._initialElementPosition=e.position()[n._position],n._initialMousePosition=t[n._positionMouse].startLocation,o&&(n.hint=r(o)?i(o(e)):o,n.hint.css({position:"absolute"}).css(n._position,n._initialElementPosition).appendTo(n.element)),n.trigger(l,t),n._maxPosition=n._max(t),n._minPosition=n._min(t),i(document.body).css("cursor",e.css("cursor"))},_resize:function(n){var o,e=this,s=(i(n.currentTarget),e._maxPosition),r=e._minPosition,c=e._initialElementPosition+(n[e._positionMouse].location-e._initialMousePosition);o=r!==t?Math.max(r,c):c,e.position=o=s!==t?Math.min(s,o):o,e.hint&&e.hint.toggleClass(e.options.invalidClass||"",o==s||o==r).css(e._position,o),e.resizing=!0,e.trigger(d,a(n,{position:o}))},_stop:function(t){var n=this;n.hint&&n.hint.remove(),n.resizing=!1,n.trigger(p,a(t,{position:n.position})),i(document.body).css("cursor","")},_cancel:function(i){var n=this;n.hint&&(n.position=t,n.hint.css(n._position,n._initialElementPosition),n._stop(i))},destroy:function(){var i=this;e.fn.destroy.call(i),i.draggable&&i.draggable.destroy()},press:function(i){if(i){var t=i.position(),n=this;n.userEvents.press(t.left,t.top,i[0]),n.targetPosition=t,n.target=i}},move:function(i){var n=this,o=n._position,e=n.targetPosition,s=n.position;s===t&&(s=e[o]),e[o]=s+i,n.userEvents.move(e.left,e.top)},end:function(){this.userEvents.end(),this.target=this.position=t}});n.ui.plugin(g)})(window.kendo.jQuery)});