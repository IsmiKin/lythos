/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,t){return t()})(["./kendo.data.min","./kendo.popup.min"],function(){(function(e,t){function n(t,a){t.filters&&(t.filters=e.grep(t.filters,function(e){return n(e,a),e.filters?e.filters.length:e.field!=a}))}var a=window.kendo,i=a.ui,o=i.Widget,r=a.keys,l=a.support,s=a.htmlEncode,u=a._activeElement,d="id",c="li",f="change",_="character",p="k-state-focused",h="k-state-hover",v="k-loading",g="open",m="close",b="select",x="progress",S="requestEnd",y="width",w=e.extend,k=e.proxy,C=l.browser,F=C.msie&&9>C.version,T=/"/g,I={ComboBox:"DropDownList",DropDownList:"ComboBox"},D=o.extend({init:function(t,n){var a,i=this,r=i.ns;o.fn.init.call(i,t,n),t=i.element,i._isSelect=t.is(b),i._template(),i.ul=e('<ul unselectable="on" class="k-list k-reset"/>').css({overflow:l.kineticScrollNeeded?"":"auto"}).on("mouseenter"+r,c,function(){e(this).addClass(h)}).on("mouseleave"+r,c,function(){e(this).removeClass(h)}).on("click"+r,c,k(i._click,i)).attr({tabIndex:-1,role:"listbox","aria-hidden":!0}),i.list=e("<div class='k-list-container'/>").append(i.ul).on("mousedown"+r,function(e){e.preventDefault()}),a=t.attr(d),a&&(i.list.attr(d,a+"-list"),i.ul.attr(d,a+"_listbox"),i._optionID=a+"_option_selected"),i._initValue()},setOptions:function(e){o.fn.setOptions.call(this,e),e&&e.enable!==t&&(e.enabled=e.enable)},focus:function(){this._focused.focus()},readonly:function(e){this._editable({readonly:e===t?!0:e,disable:!1})},enable:function(e){this._editable({readonly:!1,disable:!(e=e===t?!0:e)})},_filterSource:function(e){var t=this,a=t.options,i=t.dataSource,o=i.filter()||{};n(o,a.dataTextField),e&&(o=o.filters||[],o.push(e)),i.filter(o)},_initValue:function(){var e=this,t=e.options.value;t?e.element.val(t):t=e.element.val(),e._old=t},_ignoreCase:function(){var e,t=this,n=t.dataSource.reader.model;n&&n.fields&&(e=n.fields[t.options.dataTextField],e&&e.type&&"string"!==e.type&&(t.options.ignoreCase=!1))},items:function(){return this.ul[0].children},current:function(e){var n=this,a=n._optionID;return e===t?n._current:(n._current&&(n._current.removeClass(p).removeAttr("aria-selected").removeAttr(d),n._focused.removeAttr("aria-activedescendant")),e&&(e.addClass(p),n._scroll(e),a&&(e.attr("id",a),n._focused.attr("aria-activedescendant",a))),n._current=e,t)},destroy:function(){var e=this,t=e.ns;o.fn.destroy.call(e),e._unbindDataSource(),e.ul.off(t),e.list.off(t),e.popup.destroy(),e._form&&e._form.off("reset",e._resetHandler)},dataItem:function(e){var n=this;return e===t&&(e=n.selectedIndex),n._data()[e]},_accessors:function(){var e=this,t=e.element,n=e.options,i=a.getter,o=t.attr(a.attr("text-field")),r=t.attr(a.attr("value-field"));o&&(n.dataTextField=o),r&&(n.dataValueField=r),e._text=i(n.dataTextField),e._value=i(n.dataValueField)},_aria:function(e){var n=this,a=n.options,i=n._focused;a.suggest!==t&&i.attr("aria-autocomplete",a.suggest?"both":"list"),e=e?e+" "+n.ul[0].id:n.ul[0].id,i.attr("aria-owns",e),n.ul.attr("aria-live",a.filter&&"none"!==a.filter?"polite":"off")},_blur:function(){var e=this;e._change(),e.close()},_change:function(){var e,n=this,a=n.selectedIndex,i=n.options.value,o=n.value();n._isSelect&&!n._bound&&i&&(o=i),o!==n._old?e=!0:a!==t&&a!==n._oldIndex&&(e=!0),e&&(n._old=o,n._oldIndex=a,n.trigger(f),n.element.trigger(f))},_click:function(t){t.isDefaultPrevented()||this._accept(e(t.currentTarget))},_data:function(){return this.dataSource.view()},_enable:function(){var e=this,n=e.options,a=e.element.is("[disabled]");n.enable!==t&&(n.enabled=n.enable),!n.enabled||a?e.enable(!1):e.readonly(e.element.is("[readonly]"))},_focus:function(e){var n=this;return n.popup.visible()&&e&&n.trigger(b,{item:e})?(n.close(),t):(n._select(e),n._triggerCascade(),n._blur(),t)},_index:function(e){var t,n,a=this,i=a._data();for(t=0,n=i.length;n>t;t++)if(a._dataValue(i[t])==e)return t;return-1},_dataValue:function(e){var n=this._value(e);return n===t&&(n=this._text(e)),n},_height:function(e){if(e){var t=this,n=t.list,a=t.popup.visible(),i=t.options.height;n=n.add(n.parent(".k-animation-container")).show().height(t.ul[0].scrollHeight>i?i:"auto"),a||n.hide()}},_adjustListWidth:function(){var e,t,n=this.list,a=n[0].style.width,i=this.wrapper;if(n.data(y)||!a)return e=window.getComputedStyle?window.getComputedStyle(i[0],null):0,t=e?parseFloat(e.width):i.outerWidth(),e&&(C.mozilla||C.msie)&&(t+=parseFloat(e.paddingLeft)+parseFloat(e.paddingRight)+parseFloat(e.borderLeftWidth)+parseFloat(e.borderRightWidth)),a=t-(n.outerWidth()-n.width()),n.css({fontFamily:i.css("font-family"),width:a}).data(y,a),!0},_popup:function(){var e=this,t=e.list,n=e._focused,o=e.options,r=e.wrapper;e.popup=new i.Popup(t,w({},o.popup,{anchor:r,open:function(t){e._adjustListWidth(),e.trigger(g)?t.preventDefault():(n.attr("aria-expanded",!0),e.ul.attr("aria-hidden",!1))},close:function(t){e.trigger(m)?t.preventDefault():(n.attr("aria-expanded",!1),e.ul.attr("aria-hidden",!0))},animation:o.animation,isRtl:l.isRtl(r)})),e.popup.one(g,function(){e._height(e._data().length)}),e._touchScroller=a.touchScroller(e.popup.element)},_makeUnselectable:function(){F&&this.list.find("*").attr("unselectable","on")},_toggleHover:function(t){e(t.currentTarget).toggleClass(h,"mouseenter"===t.type)},_toggle:function(e){var n=this;e=e!==t?e:!n.popup.visible(),l.touch||n._focused[0]===u()||n._focused.focus(),n[e?g:m]()},_scroll:function(e){if(e){e[0]&&(e=e[0]);var t=this.ul[0],n=e.offsetTop,a=e.offsetHeight,i=t.scrollTop,o=t.clientHeight,r=n+a;t.scrollTop=i>n?n:r>i+o?r-o:i}},_template:function(){var e=this,t=e.options,n=t.template,i=t.dataSource;e._isSelect&&e.element[0].length&&(i||(t.dataTextField=t.dataTextField||"text",t.dataValueField=t.dataValueField||"value")),n?(n=a.template(n),e.template=function(e){return'<li tabindex="-1" role="option" unselectable="on" class="k-item">'+n(e)+"</li>"}):e.template=a.template('<li tabindex="-1" role="option" unselectable="on" class="k-item">${'+a.expr(t.dataTextField,"data")+"}</li>",{useWithBlock:!1})},_triggerCascade:function(){var e=this,t=e.value();(!e._bound&&t||e._old!==t)&&e.trigger("cascade")},_unbindDataSource:function(){var e=this;e.dataSource.unbind(f,e._refreshHandler).unbind(x,e._progressHandler).unbind(S,e._requestEndHandler)}});w(D,{caret:function(e){var t,n=e.ownerDocument.selection;return t=n?Math.abs(n.createRange().moveStart(_,-e.value.length)):e.selectionStart},selectText:function(e,t,n){try{if(e.createTextRange){e.focus();var a=e.createTextRange();a.collapse(!0),a.moveStart(_,t),a.moveEnd(_,n-t),a.select()}else e.setSelectionRange(t,n)}catch(i){}},inArray:function(e,t){var n,a,i=t.children;if(!e||e.parentNode!==t)return-1;for(n=0,a=i.length;a>n;n++)if(e===i[n])return n;return-1}}),a.ui.List=D,i.Select=D.extend({init:function(e,t){D.fn.init.call(this,e,t),this._initial=this.element.val()},setDataSource:function(e){this.options.dataSource=e,this._dataSource(),this.options.autoBind&&this.dataSource.fetch()},close:function(){this.popup.close()},select:function(e){var n=this;return e===t?n.selectedIndex:(n._select(e),n._triggerCascade(),n._old=n._accessor(),n._oldIndex=n.selectedIndex,t)},_accessor:function(e,n){var a,i,o=this.element,r=this._isSelect;return o=o[0],e===t?(r?(i=o.selectedIndex,i>-1&&(a=o.options[i],a&&(e=a.value))):e=o.value,e):(r?o.selectedIndex=n:o.value=e,t)},_hideBusy:function(){var e=this;clearTimeout(e._busy),e._arrow.removeClass(v),e._focused.attr("aria-busy",!1),e._busy=null},_showBusy:function(){var e=this;e._request=!0,e._busy||(e._busy=setTimeout(function(){e._focused.attr("aria-busy",!0),e._arrow.addClass(v)},100))},_requestEnd:function(){this._request=!1},_dataSource:function(){var t,n=this,i=n.element,o=n.options,r=o.dataSource||{};r=e.isArray(r)?{data:r}:r,n._isSelect&&(t=i[0].selectedIndex,t>-1&&(o.index=t),r.select=i,r.fields=[{field:o.dataTextField},{field:o.dataValueField}]),n.dataSource&&n._refreshHandler?n._unbindDataSource():(n._refreshHandler=k(n.refresh,n),n._progressHandler=k(n._showBusy,n),n._requestEndHandler=k(n._requestEnd,n)),n.dataSource=a.data.DataSource.create(r).bind(f,n._refreshHandler).bind(x,n._progressHandler).bind(S,n._requestEndHandler)},_get:function(t){var n,a,i=this,o=i._data();if("function"==typeof t)for(n=0,a=o.length;a>n;n++)if(t(o[n])){t=n;break}if("number"==typeof t){if(0>t)return e();t=e(i.ul[0].children[t])}return t&&t.nodeType&&(t=e(t)),t},_move:function(e){var t,n=this,a=e.keyCode,i=n.ul[0],o=n.popup.visible()?"_select":"_accept",l=n._current,s=a===r.DOWN;return a===r.UP||s?(e.altKey?n.toggle(s):s?(l=!l||-1===n.selectedIndex&&!n.value()&&l[0]===i.firstChild?i.firstChild:l[0].nextSibling,n[o](l)):n[o](l?l[0].previousSibling:i.lastChild),e.preventDefault(),t=!0):a===r.ENTER||a===r.TAB?(n.popup.visible()&&e.preventDefault(),n._accept(l),t=!0):a===r.ESC&&(n.popup.visible()&&e.preventDefault(),n.close(),t=!0),t},_selectItem:function(e){var t=this,n=t.options;e=t._selectedValue||n.value||t._accessor(),e?t.value(e):t._bound||t.select(n.index)},_fetchItems:function(e){var n=this,a=n.ul[0].firstChild;return n._request?!0:n._fetch||a?t:n.options.cascadeFrom?!a:(n.dataSource.one(f,function(){n.value(e),n._fetch=!1}),n._fetch=!0,n.dataSource.fetch(),!0)},_options:function(e,n){var a,i,o,r,l=this,u=l.element,d=u[0].selectedIndex,c=e.length,f="",_=0;for(n&&(f=n,d+=1,_=1);c>_;_++)a="<option",i=e[_],o=l._text(i),r=l._value(i),r!==t&&(r+="",-1!==r.indexOf('"')&&(r=r.replace(T,"&quot;")),a+=' value="'+r+'"'),a+=">",o!==t&&(a+=s(o)),a+="</option>",f+=a;u.html(f),u[0].selectedIndex=d},_reset:function(){var e=this,t=e.element,n=t.closest("form");n[0]&&(e._resetHandler=function(){setTimeout(function(){e.value(e._initial)})},e._form=n.on("reset",e._resetHandler))},_cascade:function(){var t,a,i,o,r,l=this,s=l.options,u=s.cascadeFrom;if(u){if(l._selectedValue=s.value||l._accessor(),a=e("#"+u),t=a.data("kendo"+s.name),t||(t=a.data("kendo"+I[s.name])),!t)return;o=t.options.dataValueField,r=function(){var e=l._selectedValue||l.value();e?(l.value(e),l.dataSource.view()[0]&&-1!==l.selectedIndex||l._clearSelection(t,!0)):l.select(s.index),l.enable()},i=function(){var e,a,i=t.dataItem(),s=i?t._value(i):null;s?(e=l.dataSource.filter()||{},n(e,o),a=e.filters||[],a.push({field:o,operator:"eq",value:s}),l.dataSource.one(f,r).filter(a)):(l.enable(!1),l._clearSelection(t)),l._triggerCascade()},t.bind("cascade",function(){i()}),t._bound?i():t.value()||l.enable(!1)}}})})(window.kendo.jQuery)});