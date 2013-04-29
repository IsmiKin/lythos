/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,t){return t()})(["./kendo.list.min"],function(){(function(e,t){function a(e,t,a){return a?t.substring(0,e).split(a).length-1:0}function s(e,t,s){return t.split(s)[a(e,t,s)]}function r(e,t,s,r){var n=t.split(r);return n.splice(a(e,t,r),1,s),r&&""!==n[n.length-1]&&n.push(""),n.join(r)}function n(e){var t=e.value.length;T(e,t,t)}var o=window.kendo,i=o.support,l=o._activeElement,c=i.placeholder,u=o.ui,d=o.keys,p=o.data.DataSource,h=u.List,_="aria-disabled",f="aria-readonly",g="k-state-default",v="disabled",m="readonly",y="k-state-focused",C="k-state-selected",b="k-state-disabled",w="k-state-hover",k=".kendoAutoComplete",x="mouseenter"+k+" mouseleave"+k,S=h.caret,T=h.selectText,A=e.proxy,B=h.extend({init:function(t,a){var s,r=this;r.ns=k,a=e.isArray(a)?{dataSource:a}:a,h.fn.init.call(r,t,a),t=r.element,a=r.options,a.placeholder=a.placeholder||t.attr("placeholder"),c&&t.attr("placeholder",a.placeholder),r._wrapper(),r._loader(),r._accessors(),r._dataSource(),r._ignoreCase(),t[0].type="text",s=r.wrapper,r._popup(),t.addClass("k-input").on("keydown"+k,A(r._keydown,r)).on("paste"+k,A(r._search,r)).on("focus"+k,function(){r._prev=r._accessor(),r._placeholder(!1),s.addClass(y)}).on("blur"+k,function(){r._change(),r._placeholder(),s.removeClass(y)}).attr({autocomplete:"off",role:"textbox","aria-haspopup":!0}),r._enable(),r._old=r._accessor(),t[0].id&&t.attr("aria-owns",r.ul[0].id),r._aria(),r._placeholder(),o.notify(r)},options:{name:"AutoComplete",enabled:!0,suggest:!1,template:"",dataTextField:"",minLength:1,delay:200,height:200,filter:"startswith",ignoreCase:!0,highlightFirst:!1,separator:null,placeholder:"",animation:{}},_dataSource:function(){var e=this;e.dataSource&&e._refreshHandler?e._unbindDataSource():(e._refreshHandler=A(e.refresh,e),e._progressHandler=A(e._showBusy,e)),e.dataSource=p.create(e.options.dataSource).bind("change",e._refreshHandler).bind("progress",e._progressHandler)},setDataSource:function(e){this.options.dataSource=e,this._dataSource()},events:["open","close","change","select","dataBinding","dataBound"],setOptions:function(e){h.fn.setOptions.call(this,e),this._template(),this._accessors(),this._aria()},_editable:function(e){var t=this,a=t.element,s=t.wrapper.off(k),r=e.readonly,n=e.disable;r||n?(s.addClass(n?b:g).removeClass(n?g:b),a.attr(v,n).attr(m,r).attr(_,n).attr(f,r)):(s.addClass(g).removeClass(b).on(x,t._toggleHover),a.removeAttr(v).removeAttr(m).attr(_,!1).attr(f,!1))},close:function(){var e=this,t=e._current;t&&t.removeClass(C),e.current(null),e.popup.close()},destroy:function(){var e=this;e.element.off(k),e.wrapper.off(k),h.fn.destroy.call(e)},refresh:function(){var a,s=this,r=s.ul[0],n=s.popup,i=s.options,c=s._data(),u=c.length;s.trigger("dataBinding"),r.innerHTML=o.render(s.template,c),s._height(u),n.visible()&&n._position(),u&&(i.highlightFirst&&s.current(e(r.firstChild)),i.suggest&&s.suggest(e(r.firstChild))),s._open&&(s._open=!1,a=u?"open":"close",s._typing&&s.element[0]!==l()&&(a="close"),n[a](),s._typing=t),s._touchScroller&&s._touchScroller.reset(),s._makeUnselectable(),s._hideBusy(),s.trigger("dataBound")},select:function(e){this._select(e)},search:function(e){var t,a=this,r=a.options,n=r.ignoreCase,o=r.separator;e=e||a._accessor(),a._current=null,clearTimeout(a._typing),o&&(e=s(S(a.element[0]),e,o)),t=e.length,t?t>=a.options.minLength&&(a._open=!0,a._filterSource({value:n?e.toLowerCase():e,operator:r.filter,field:r.dataTextField,ignoreCase:n})):a.popup.close()},suggest:function(e){var s,r=this,n=r._last,o=r._accessor(),i=r.element[0],l=S(i),c=r.options.separator,u=o.split(c),p=a(l,o,c),_=l;return n==d.BACKSPACE||n==d.DELETE?(r._last=t,t):(e=e||"","string"!=typeof e&&(s=h.inArray(e[0],r.ul[0]),e=s>-1?r._text(r._data()[s]):""),0>=l&&(l=o.toLowerCase().indexOf(e.toLowerCase())+1),s=o.substring(0,l).lastIndexOf(c),s=s>-1?l-(s+c.length):l,o=u[p].substring(0,s),e&&(s=e.toLowerCase().indexOf(o.toLowerCase()),s>-1&&(e=e.substring(s+o.length),_=l+e.length,o+=e),c&&""!==u[u.length-1]&&u.push("")),u[p]=o,r._accessor(u.join(c||"")),T(i,l,_),t)},value:function(e){return e===t?this._accessor():(this._accessor(e),this._old=e,t)},_accessor:function(e){var a=this,s=a.element[0];return e===t?(e=s.value,s.className.indexOf("k-readonly")>-1?e===a.options.placeholder?"":e:e):(s.value=null===e?"":e,a._placeholder(),t)},_accept:function(e){var t=this;t._focus(e),n(t.element[0])},_keydown:function(t){var a=this,s=a.ul[0],r=t.keyCode,n=a._current,o=a.popup.visible();a._last=r,r===d.DOWN?(o&&a._move(n?n.next():e(s.firstChild)),t.preventDefault()):r===d.UP?(o&&a._move(n?n.prev():e(s.lastChild)),t.preventDefault()):r===d.ENTER||r===d.TAB?(r===d.ENTER&&a.popup.visible()&&t.preventDefault(),a._accept(n)):r===d.ESC?(a.popup.visible()&&t.preventDefault(),a.close()):a._search()},_move:function(e){var t=this;e=e[0]?e:null,t.current(e),t.options.suggest&&t.suggest(e)},_hideBusy:function(){var e=this;clearTimeout(e._busy),e._loading.hide(),e.element.attr("aria-busy",!1),e._busy=null},_showBusy:function(){var e=this;e._busy||(e._busy=setTimeout(function(){e.element.attr("aria-busy",!0),e._loading.show()},100))},_placeholder:function(e){if(!c){var a,s=this,r=s.element,n=s.options.placeholder;if(n){if(a=r.val(),e===t&&(e=!a),e||(n=a!==n?a:""),a===s._old&&!e)return;r.toggleClass("k-readonly",e).val(n)}}},_search:function(){var e=this;clearTimeout(e._typing),e._typing=setTimeout(function(){e._prev!==e._accessor()&&(e._prev=e._accessor(),e.search())},e.options.delay)},_select:function(t){var a,s,n=this,o=n.options.separator,i=n._data();t=e(t),t[0]&&!t.hasClass(C)&&(s=h.inArray(t[0],n.ul[0]),s>-1&&(i=i[s],a=n._text(i),o&&(a=r(S(n.element[0]),n._accessor(),a,o)),n._accessor(a),n.current(t.addClass(C))))},_loader:function(){this._loading=e('<span class="k-icon k-loading" style="display:none"></span>').insertAfter(this.element)},_toggleHover:function(t){e(t.currentTarget).toggleClass(w,"mouseenter"===t.type)},_wrapper:function(){var e,t=this,a=t.element,s=a[0];e=a.parent(),e.is("span.k-widget")||(e=a.wrap("<span />").parent()),e.attr("tabindex",-1),e.attr("role","presentation"),e[0].style.cssText=s.style.cssText,a.css({width:"100%",height:s.style.height}),t._focused=t.element,t.wrapper=e.addClass("k-widget k-autocomplete k-header").addClass(s.className)}});u.plugin(B)})(window.kendo.jQuery)});