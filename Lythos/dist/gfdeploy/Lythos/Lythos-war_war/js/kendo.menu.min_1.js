/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,t){return t()})(["./kendo.popup.min"],function(){(function(e,t){function n(e,t){return e=e.split(" ")[!t+0]||e,e.replace("top","up").replace("bottom","down")}function i(e,t,n){e=e.split(" ")[!t+0]||e;var i={origin:["bottom",n?"right":"left"],position:["top",n?"right":"left"]},r=/left|right/.test(e);return r?(i.origin=["top",e],i.position[1]=l.directions[e].reverse):(i.origin[0]=e,i.position[0]=l.directions[e].reverse),i.origin=i.origin.join(" "),i.position=i.position.join(" "),i}function r(t,n){try{return e.contains(t,n)}catch(i){return!1}}function o(t){t=e(t),t.addClass("k-item").children(x).addClass(O),t.children("a").addClass(I).children(x).addClass(O),t.filter(":not([disabled])").addClass(G),t.filter(".k-separator:empty").append("&nbsp;"),t.filter("li[disabled]").addClass(W).removeAttr("disabled").attr("aria-disabled",!0),t.filter("[role]").length||t.attr("role","menuitem"),t.children("."+I).length||t.contents().filter(function(){return!(this.nodeName.match(b)||3==this.nodeType&&!e.trim(this.nodeValue))}).wrapAll("<span class='"+I+"'/>"),a(t),s(t)}function a(t){t=e(t),t.find("> .k-link > [class*=k-i-arrow]").remove(),t.filter(":has(.k-group)").children(".k-link:not(:has([class*=k-i-arrow]))").each(function(){var t=e(this),n=t.parent().parent();t.append("<span class='k-icon "+(n.hasClass(H+"-horizontal")?"k-i-arrow-s":"k-i-arrow-e")+"'/>")})}function s(t){t=e(t),t.filter(".k-first:not(:first-child)").removeClass(P),t.filter(".k-last:not(:last-child)").removeClass(T),t.filter(":first-child").addClass(P),t.filter(":last-child").addClass(T)}var l=window.kendo,c=l.ui,d=l._activeElement,p=l.support.touch&&l.support.mobileOS,u=p||l.support.pointers,m="mousedown",f="click",h=e.extend,g=e.proxy,v=e.each,k=l.template,_=l.keys,C=c.Widget,b=/^(ul|a|div)$/i,w=".kendoMenu",x="img",y="open",H="k-menu",I="k-link",T="k-last",A="close",D="timer",P="k-first",O="k-image",R="select",U="zIndex",E="activate",S="deactivate",z=l.support.pointers?"MSPointerOver":"mouseenter",L=l.support.pointers?"MSPointerOut":"mouseleave",B="kendoPopup",G="k-state-default",M="k-state-hover",N="k-state-focused",W="k-state-disabled",j=".k-group",V=":not(.k-list) > .k-item",q=".k-item.k-state-disabled",Z=".k-item:not(.k-state-disabled)",$=".k-item:not(.k-state-disabled) > .k-link",F=":not(.k-item.k-separator)",Q=F+":eq(0)",J=F+":last",K="div:not(.k-animation-container,.k-list-container)",X={content:k("<div class='k-content k-group' tabindex='-1'>#= content(item) #</div>"),group:k("<ul class='#= groupCssClass(group) #'#= groupAttributes(group) # role='menu' aria-hidden='true'>#= renderItems(data) #</ul>"),itemWrapper:k("<#= tag(item) # class='#= textClass(item) #'#= textAttributes(item) #>#= image(item) ##= sprite(item) ##= text(item) ##= arrow(data) #</#= tag(item) #>"),item:k("<li class='#= wrapperCssClass(group, item) #' role='menuitem' #=item.items ? \"aria-haspopup='true'\": \"\"##=item.enabled === false ? \"aria-disabled='true'\" : ''#>#= itemWrapper(data) ## if (item.items) { ##= subGroup({ items: item.items, menu: menu, group: { expanded: item.expanded } }) ## } else if (item.content || item.contentUrl) { ##= renderContent(data) ## } #</li>"),image:k("<img class='k-image' alt='' src='#= imageUrl #' />"),arrow:k("<span class='#= arrowClass(item, group) #'></span>"),sprite:k("<span class='k-sprite #= spriteCssClass #'></span>"),empty:k("")},Y={wrapperCssClass:function(e,t){var n="k-item",i=t.index;return n+=t.enabled===!1?" k-state-disabled":" k-state-default",e.firstLevel&&0===i&&(n+=" k-first"),i==e.length-1&&(n+=" k-last"),t.cssClass&&(n+=" "+t.cssClass),n},textClass:function(){return I},textAttributes:function(e){return e.url?" href='"+e.url+"'":""},arrowClass:function(e,t){var n="k-icon";return n+=t.horizontal?" k-i-arrow-s":" k-i-arrow-e"},text:function(e){return e.encoded===!1?e.text:l.htmlEncode(e.text)},tag:function(e){return e.url?"a":"span"},groupAttributes:function(e){return e.expanded!==!0?" style='display:none'":""},groupCssClass:function(){return"k-group"},content:function(e){return e.content?e.content:"&nbsp;"}},et=C.extend({init:function(t,n){var i=this;C.fn.init.call(i,t,n),t=i.wrapper=i.element,n=i.options,i._initData(n),i._updateClasses(),i._animations(n),i.nextItemZIndex=100,i._tabindex(),i._focusProxy=g(i._focusHandler,i),t.on("touchstart MSPointerDown",i._focusProxy).on(f+w,q,!1).on(f+w,Z,g(i._click,i)).on("keydown"+w,g(i._keydown,i)).on("focus"+w,g(i._focus,i)).on("focus"+w,".k-content",g(i._focus,i)).on("blur"+w,g(i._removeHoverItem,i)).on(z+w,Z,g(i._mouseenter,i)).on(L+w,Z,g(i._mouseleave,i)).on(z+w+" "+L+w+" "+m+w+" "+f+w,$,g(i._toggleHover,i)),n.openOnClick&&(i.clicked=!1,i._documentClickHandler=g(i._documentClick,i),e(document).click(i._documentClickHandler)),t.attr("role","menubar"),t[0].id&&(i._ariaId=l.format("{0}_mn_active",t[0].id)),l.notify(i)},events:[y,A,E,S,R],options:{name:"Menu",animation:{open:{duration:200},close:{duration:100}},orientation:"horizontal",direction:"default",openOnClick:!1,closeOnClick:!0,hoverDelay:100},_initData:function(e){var t=this;e.dataSource&&(t.element.empty(),t.append(e.dataSource,t.element))},setOptions:function(e){var t=this.options.animation;this._animations(e),e.animation=h(!0,t,e.animation),"dataSource"in e&&this._initData(e),C.fn.setOptions.call(this,e)},destroy:function(){var t=this;C.fn.destroy.call(t),t.element.off(w),t._documentClickHandler&&e(document).unbind("click",t._documentClickHandler)},enable:function(e,t){return this._toggleDisabled(e,t!==!1),this},disable:function(e){return this._toggleDisabled(e,!1),this},append:function(e,t){t=this.element.find(t);var n=this._insert(e,t,t.length?t.find("> .k-group, > .k-animation-container > .k-group"):null);return v(n.items,function(){n.group.append(this),a(this)}),a(t),s(n.group.find(".k-first, .k-last").add(n.items)),this},insertBefore:function(e,t){t=this.element.find(t);var n=this._insert(e,t,t.parent());return v(n.items,function(){t.before(this),a(this),s(this)}),s(t),this},insertAfter:function(e,t){t=this.element.find(t);var n=this._insert(e,t,t.parent());return v(n.items,function(){t.after(this),a(this),s(this)}),s(t),this},_insert:function(t,n,i){var r,a,s,l,c=this;return n&&n.length||(i=c.element),s=e.isPlainObject(t),l={firstLevel:i.hasClass(H),horizontal:i.hasClass(H+"-horizontal"),expanded:!0,length:i.children().length},n&&!i.length&&(i=e(et.renderGroup({group:l})).appendTo(n)),s||e.isArray(t)?r=e.map(s?[t]:t,function(t,n){return"string"==typeof t?e(t):e(et.renderItem({group:l,item:h(t,{index:n})}))}):(r=e(t),a=r.find("> ul").addClass("k-group").attr("role","menu"),r=r.filter("li"),r.add(a.find("> li")).each(function(){o(this)})),{items:r,group:i}},remove:function(e){var t,n,i,r;return e=this.element.find(e),t=this,n=e.parentsUntil(t.element,V),i=e.parent("ul"),e.remove(),i&&!i.children(V).length&&(r=i.parent(".k-animation-container"),r.length?r.remove():i.remove()),n.length&&(n=n.eq(0),a(n),s(n)),t},open:function(r){var o=this,a=o.options,s="horizontal"==a.orientation,c=a.direction,d=l.support.isRtl(o.wrapper);return r=o.element.find(r),/^(top|bottom|default)$/.test(c)&&(c=d?s?(c+" left").replace("default","bottom"):"left":s?(c+" right").replace("default","bottom"):"right"),r.siblings().find(">.k-popup:visible,>.k-animation-container>.k-popup:visible").each(function(){var t=e(this).data("kendoPopup");t&&t.close()}),r.each(function(){var r=e(this);clearTimeout(r.data(D)),r.data(D,setTimeout(function(){var e,l,p,u,m,f,g=r.find(".k-group:first:hidden");g[0]&&o.trigger(y,{item:r[0]})===!1&&(r.data(U,r.css(U)),r.css(U,o.nextItemZIndex++),e=g.data(B),l=r.parent().hasClass(H),p=l&&s,u=i(c,l,d),m=a.animation.open.effects,f=m!==t?m:"slideIn:"+n(c,l),e?(e=g.data(B),e.options.origin=u.origin,e.options.position=u.position,e.options.animation.open.effects=f):e=g.kendoPopup({activate:function(){o.trigger(E,{item:this.wrapper.parent()})},deactivate:function(){o.trigger(S,{item:this.wrapper.parent()})},origin:u.origin,position:u.position,collision:a.popupCollision!==t?a.popupCollision:p?"fit":"fit flip",anchor:r,appendTo:r,animation:{open:h(!0,{effects:f},a.animation.open),close:a.animation.close},close:function(e){var t=e.sender.wrapper.parent();o.trigger(A,{item:t[0]})?e.preventDefault():(t.css(U,t.data(U)),t.removeData(U))}}).data(B),g.removeAttr("aria-hidden"),e.open())},o.options.hoverDelay))}),o},close:function(t){var n=this,i=n.element;return t=i.find(t),t.length||(t=i.find(">.k-item")),t.each(function(){var t=e(this);clearTimeout(t.data(D)),t.data(D,setTimeout(function(){var e=t.find(".k-group:first:visible").data(B);e&&(e.close(),e.element.attr("aria-hidden",!0))},n.options.hoverDelay))}),n},_toggleDisabled:function(t,n){this.element.find(t).each(function(){e(this).toggleClass(G,n).toggleClass(W,!n).attr("aria-disabled",!n)})},_toggleHover:function(t){var n=e(l.eventTarget(t)||t.target).closest(V),i=t.type==z||-1!==m.indexOf(t.type);n.parents("li."+W).length||n.toggleClass(M,i||"mousedown"==t.type||"click"==t.type),this._removeHoverItem()},_removeHoverItem:function(){var e=this._hoverItem();e&&e.hasClass(N)&&(e.removeClass(N),this._oldHoverItem=null)},_updateClasses:function(){var e,t=this.element;t.addClass("k-widget k-reset k-header "+H).addClass(H+"-"+this.options.orientation),t.find("li > ul").addClass("k-group").attr("role","menu").attr("aria-hidden",t.is(":visible")).end().find("li > div").addClass("k-content").attr("tabindex","-1"),e=t.find("> li,.k-group > li"),e.each(function(){o(this)})},_mouseenter:function(t){var n=this,i=e(t.currentTarget),o=i.children(".k-animation-container").length||i.children(j).length;t.delegateTarget==i.parents(".k-menu")[0]&&((!n.options.openOnClick||n.clicked)&&!r(t.currentTarget,t.relatedTarget)&&o&&n.open(i),(n.options.openOnClick&&n.clicked||u)&&i.siblings().each(g(function(e,t){n.close(t)},n)))},_mouseleave:function(n){var i=this,o=e(n.currentTarget),a=o.children(".k-animation-container").length||o.children(j).length;return o.parentsUntil(".k-animation-container",".k-list-container,.k-calendar-container")[0]?(n.stopImmediatePropagation(),t):(i.options.openOnClick||p||l.support.pointers&&2==n.originalEvent.pointerType||r(n.currentTarget,n.relatedTarget)||!a||i.close(o),t)},_click:function(n){var i,r,o,a=this,s=a.options,c=e(l.eventTarget(n)),d=c[0]?c[0].nodeName.toUpperCase():"",p="INPUT"==d||"SELECT"==d||"BUTTON"==d,m=c.closest("."+I),f=c.closest(V),h=m.attr("href"),g=!!h&&"#"!=h.charAt(h.length-1);if(!f.children(K)[0])return f.hasClass(W)?(n.preventDefault(),t):(n.handled||!a.trigger(R,{item:f[0]})||p||n.preventDefault(),n.handled=!0,r=f.children(j+",.k-animation-container"),o=r.is(":visible"),s.closeOnClick&&!g&&(!r.length||s.openOnClick&&o)?(f.removeClass(M).css("height"),a._oldHoverItem=a._findRootParent(f),a.close(m.parentsUntil(a.element,V)),a.clicked=!1,-1!="MSPointerUp".indexOf(n.type)&&n.preventDefault(),t):((f.parent().hasClass(H)&&s.openOnClick||!u)&&(g||p||n.preventDefault(),a.clicked=!0,i=r.is(":visible")?A:y,(s.closeOnClick||i!=A)&&a[i](f)),t))},_documentClick:function(e){r(this.element[0],e.target)||(this.clicked=!1)},_focus:function(n){var i=this,r=n.target,o=i._hoverItem(),a=d();return r==i.wrapper[0]||e(r).is(":focusable")?(a===n.currentTarget&&(o.length?i._moveHover([],o):i._oldHoverItem||i._moveHover([],i.wrapper.children().first())),t):(n.stopPropagation(),e(r).closest(".k-content").closest(".k-group").closest(".k-item").addClass(N),i.wrapper.focus(),t)},_keydown:function(e){var n,i,r,o=this,a=e.keyCode,s=o._oldHoverItem,c=l.support.isRtl(o.wrapper);if(e.target==e.currentTarget||a==_.ESC){if(s||(s=o._oldHoverItem=o._hoverItem()),i=o._itemBelongsToVertival(s),r=o._itemHasChildren(s),a==_.RIGHT)n=o[c?"_itemLeft":"_itemRight"](s,i,r);else if(a==_.LEFT)n=o[c?"_itemRight":"_itemLeft"](s,i,r);else if(a==_.DOWN)n=o._itemDown(s,i,r);else if(a==_.UP)n=o._itemUp(s,i,r);else if(a==_.ESC)n=o._itemEsc(s,i);else if(a==_.ENTER||a==_.SPACEBAR)n=s.children(".k-link"),n.length>0&&(o._click({target:n[0],preventDefault:function(){}}),o._moveHover(s,o._findRootParent(s)));else if(a==_.TAB)return n=o._findRootParent(s),o.close(n),o._moveHover(s,n),t;n&&n[0]&&(e.preventDefault(),e.stopPropagation())}},_hoverItem:function(){return this.wrapper.find(".k-item.k-state-hover,.k-item.k-state-focused").filter(":visible")},_itemBelongsToVertival:function(e){var t=this.wrapper.hasClass("k-menu-vertical");return e.length?e.parent().hasClass("k-group")||t:t},_itemHasChildren:function(e){return e.length?e.children("ul.k-group, div.k-animation-container").length>0:!1},_moveHover:function(e,t){var n=this,i=n._ariaId;e.length&&t.length&&(e.removeClass(N),e[0].id===i&&e.removeAttr("id")),t.length&&(t[0].id&&(i=t[0].id),t.addClass(N),n._oldHoverItem=t,i&&(n.element.removeAttr("aria-activedescendant"),t.attr("id",i),n.element.attr("aria-activedescendant",i)))},_findRootParent:function(e){return e.parent().hasClass("k-menu")?e:e.parentsUntil(".k-menu","li.k-item").last()},_isRootItem:function(e){return e.parent().hasClass("k-menu")},_itemRight:function(e,t,n){var i,r,o=this;return t?n?(o.open(e),i=e.find(".k-group").children().first()):"horizontal"==o.options.orientation&&(r=o._findRootParent(e),o.close(r),i=r.nextAll(Q)):(i=e.nextAll(Q),i.length||(i=e.prevAll(J))),i&&!i.length?i=o.wrapper.children(".k-item").first():i||(i=[]),o._moveHover(e,i),i},_itemLeft:function(e,t){var n,i=this;return t?(n=e.parent().closest(".k-item"),i.close(n),i._isRootItem(n)&&"horizontal"==i.options.orientation&&(n=n.prevAll(Q))):(n=e.prevAll(Q),n.length||(n=e.nextAll(J))),n.length||(n=i.wrapper.children(".k-item").last()),i._moveHover(e,n),n},_itemDown:function(e,t,n){var i,r=this;if(t)i=e.nextAll(Q);else{if(!n||e.hasClass(W))return;r.open(e),i=e.find(".k-group").children().first()}return!i.length&&e.length?i=e.parent().children().first():e.length||(i=r.wrapper.children(".k-item").first()),r._moveHover(e,i),i},_itemUp:function(e,t){var n,i=this;if(t)return n=e.prevAll(Q),!n.length&&e.length?n=e.parent().children().last():e.length||(n=i.wrapper.children(".k-item").last()),i._moveHover(e,n),n},_itemEsc:function(e,t){var n,i=this;return t?(n=e.parent().closest(".k-item"),i.close(n),i._moveHover(e,n),n):e},_focusHandler:function(t){var n=this,i=e(l.eventTarget(t)).closest(V);setTimeout(function(){n._moveHover([],i),i.children(".k-content")[0]&&i.parent().closest(".k-item").removeClass(N)},200)},_animations:function(e){e&&"animation"in e&&!e.animation&&(e.animation={open:{effects:{}},close:{hide:!0,effects:{}}})}});h(et,{renderItem:function(e){e=h({menu:{},group:{}},e);var t=X.empty,n=e.item;return X.item(h(e,{image:n.imageUrl?X.image:t,sprite:n.spriteCssClass?X.sprite:t,itemWrapper:X.itemWrapper,renderContent:et.renderContent,arrow:n.items||n.content?X.arrow:t,subGroup:et.renderGroup},Y))},renderGroup:function(e){return X.group(h({renderItems:function(e){for(var t="",n=0,i=e.items,r=i?i.length:0,o=h({length:r},e.group);r>n;n++)t+=et.renderItem(h(e,{group:o,item:h({index:n},i[n])}));return t}},e,Y))},renderContent:function(e){return X.content(h(e,Y))}}),l.ui.plugin(et)})(window.kendo.jQuery)});