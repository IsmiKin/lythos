/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,n){return n()})(["./kendo.core.min","./kendo.fx.min","./kendo.draganddrop.min"],function(){(function(e){var n=window.kendo,t=n.mobile,i=n.fx,s=t.ui,l=e.proxy,o=e.extend,a=s.Widget,r=n.Class,c=n.ui.Movable,d=n.ui.Pane,u=n.ui.PaneDimensions,m=i.Transition,p=i.Animation,h=Math.abs,f=500,v=.7,b=.93,x=.5,T="km-scroller-release",E="km-scroller-refresh",y="pull",C="change",_="resize",g="scroll",k=p.extend({init:function(e){var n=this;p.fn.init.call(n),o(n,e),n.userEvents.bind("gestureend",l(n.start,n)),n.tapCapture.bind("press",l(n.cancel,n))},done:function(){return.01>this.dimensions.minScale-this.movable.scale},tick:function(){var e=this.movable;e.scaleWith(1.1),this.dimensions.rescale(e.scale)},onEnd:function(){var e=this.movable;e.scaleTo(this.dimensions.minScale),this.dimensions.rescale(e.scale)}}),w=p.extend({init:function(e){var n=this;p.fn.init.call(n),o(n,e,{transition:new m({axis:e.axis,movable:e.movable,onEnd:function(){n._end()}})}),n.tapCapture.bind("press",function(){n.cancel()}),n.userEvents.bind("end",l(n.start,n)),n.userEvents.bind("gestureend",l(n.start,n)),n.userEvents.bind("tap",l(n.onEnd,n))},onCancel:function(){this.transition.cancel()},freeze:function(e){var n=this;n.cancel(),n._moveTo(e)},onEnd:function(){var e=this;e._outOfBounds()?e._snapBack():e._end()},done:function(){return 1>h(this.velocity)},start:function(e){var n=this;n.dimension.enabled&&(n._outOfBounds()?n._snapBack():(n.velocity=16*e.touch[n.axis].velocity,n.velocity&&(n.tapCapture.captureNext(),p.fn.start.call(n))))},tick:function(){var e=this,n=e.dimension,t=e._outOfBounds()?x:b,i=e.velocity*=t,s=e.movable[e.axis]+i;!e.elastic&&n.outOfBounds(s)&&(s=Math.max(Math.min(s,n.max),n.min),e.velocity=0),e.movable.moveAxis(e.axis,s)},_end:function(){this.tapCapture.cancelCapture(),this.end()},_outOfBounds:function(){return this.dimension.outOfBounds(this.movable[this.axis])},_snapBack:function(){var e=this,n=e.dimension,t=e.movable[e.axis]>n.max?n.max:n.min;e._moveTo(t)},_moveTo:function(e){this.transition.moveTo({location:e,duration:f,ease:m.easeOutExpo})}}),z=r.extend({init:function(n){var t=this,i="x"===n.axis,s=e('<div class="km-touch-scrollbar km-'+(i?"horizontal":"vertical")+'-scrollbar" />');o(t,n,{element:s,elementSize:0,movable:new c(s),scrollMovable:n.movable,size:i?"width":"height"}),t.scrollMovable.bind(C,l(t._move,t)),t.container.append(s)},_move:function(){var e=this,n=e.axis,t=e.dimension,i=t.size,s=e.scrollMovable,l=i/t.total,o=Math.round(-s[n]*l),a=Math.round(i*l);o+a>i?a=i-o:0>o&&(a+=o,o=0),e.elementSize!=a&&(e.element.css(e.size,a+"px"),e.elementSize=a),e.movable.moveAxis(n,o)},show:function(){this.element.css({opacity:v,visibility:"visible"})},hide:function(){this.element.css({opacity:0})}}),O=a.extend({init:function(t,i){var s,l,r,m,p,f,v,b=this;return a.fn.init.call(b,t,i),t=b.element,b.options.useNative&&n.support.hasNativeScrolling?(t.addClass("km-native-scroller").prepend('<div class="km-scroll-header"/>'),o(b,{scrollElement:t,fixedContainer:t.children().first()}),undefined):(t.css("overflow","hidden").addClass("km-scroll-wrapper").wrapInner('<div class="km-scroll-container"/>').prepend('<div class="km-scroll-header"/>'),s=t.children().eq(1),l=new n.TapCapture(t),r=new c(s),m=new u({element:s,container:t,forcedEnabled:b.options.zoom,change:function(){b.trigger(_)}}),p=new n.UserEvents(t,{allowSelection:!0,preventDragEvent:!0,multiTouch:b.options.zoom,start:function(e){m.refresh();var n=h(e.x.velocity),t=h(e.y.velocity);m.x.enabled&&2*n>=t||m.y.enabled&&2*t>=n?p.capture():p.cancel()}}),f=new d({movable:r,dimensions:m,userEvents:p,elastic:b.options.elastic}),v=new k({movable:r,dimensions:m,userEvents:p,tapCapture:l}),r.bind(C,function(){b.scrollTop=-r.y,b.scrollLeft=-r.x,b.trigger(g,{scrollTop:b.scrollTop,scrollLeft:b.scrollLeft})}),o(b,{movable:r,dimensions:m,zoomSnapBack:v,userEvents:p,pane:f,tapCapture:l,pulled:!1,scrollElement:s,fixedContainer:t.children().first()}),b._initAxis("x"),b._initAxis("y"),m.refresh(),b.options.pullToRefresh&&b._initPullToRefresh(),n.onResize(e.proxy(b.reset,b)),undefined)},scrollHeight:function(){return this.scrollElement[0].scrollHeight},scrollWidth:function(){return this.scrollElement[0].scrollWidth},options:{name:"Scroller",zoom:!1,pullOffset:140,elastic:!0,useNative:!1,pullTemplate:"Pull to refresh",releaseTemplate:"Release to refresh",refreshTemplate:"Refreshing"},events:[y,g,_],setOptions:function(e){var n=this;a.fn.setOptions.call(n,e),e.pullToRefresh&&n._initPullToRefresh()},reset:function(){this.movable.moveTo({x:0,y:0})},scrollTo:function(e,n){this.movable.moveTo({x:e,y:n})},pullHandled:function(){var e=this;e.refreshHint.removeClass(E),e.hintContainer.html(e.pullTemplate({})),e.yinertia.onEnd(),e.xinertia.onEnd()},destroy:function(){a.fn.destroy.call(this),this.userEvents.destroy()},_initPullToRefresh:function(){var e=this;e.dimensions.y.forceEnabled(),e.pullTemplate=n.template(e.options.pullTemplate),e.releaseTemplate=n.template(e.options.releaseTemplate),e.refreshTemplate=n.template(e.options.refreshTemplate),e.scrollElement.prepend('<span class="km-scroller-pull"><span class="km-icon"></span><span class="km-template">'+e.pullTemplate({})+"</span></span>"),e.refreshHint=e.scrollElement.children().first(),e.hintContainer=e.refreshHint.children(".km-template"),e.pane.y.bind("change",l(e._paneChange,e)),e.userEvents.bind("end",l(e._dragEnd,e))},_dragEnd:function(){var e=this;e.pulled&&(e.pulled=!1,e.refreshHint.removeClass(T).addClass(E),e.hintContainer.html(e.refreshTemplate({})),e.yinertia.freeze(e.options.pullOffset/2),e.trigger("pull"))},_paneChange:function(){var e=this;e.movable.y/x>e.options.pullOffset?e.pulled||(e.pulled=!0,e.refreshHint.removeClass(E).addClass(T),e.hintContainer.html(e.releaseTemplate({}))):e.pulled&&(e.pulled=!1,e.refreshHint.removeClass(T),e.hintContainer.html(e.pullTemplate({})))},_initAxis:function(e){var n=this,t=n.movable,i=n.dimensions[e],s=n.tapCapture,l=new z({axis:e,movable:t,dimension:i,container:n.element}),o=new w({axis:e,movable:t,tapCapture:s,userEvents:n.userEvents,dimension:i,elastic:n.options.elastic,end:function(){l.hide()}});n[e+"inertia"]=o,n.pane[e].bind(C,function(){l.show()})}});s.plugin(O)})(window.kendo.jQuery)});