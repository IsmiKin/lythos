/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,t){return t()})(["./kendo.list.min"],function(){(function(e,t){function n(e,t){var n;if(null===e&&null!==t||null!==e&&null===t)return!1;if(n=e.length,n!==t.length)return!1;for(;n--;)if(e[n]!==t[n])return!1;return!0}function a(e){var t=e.firstChild;return t&&"none"===t.style.display&&(t=l(t,w)),t}function i(e){var t=e.lastChild;return t&&"none"===t.style.display&&(t=l(t,k)),t}function l(e,t){return e=e[t],e&&"none"===e.style.display&&(e=l(e,t)),e}var r=window.kendo,s=r.ui,o=s.List,u=r.keys,c=r._activeElement,d=r.data.ObservableArray,p=e.proxy,_="id",h="li",f="accept",g="filter",v="open",m="close",y="change",T="progress",b="select",w="nextSibling",k="previousSibling",C=' style="display:none"',x="aria-disabled",S="aria-readonly",I="k-state-focused",L="k-loading-hidden",B="k-state-hover",D="k-state-disabled",E="disabled",F="readonly",A=".kendoMultiSelect",V="click"+A,H="keydown"+A,N="mouseenter"+A,O="mouseleave"+A,W=N+" "+O,M=/"/g,P=["font-family","font-size","font-stretch","font-style","font-weight","letter-spacing","text-transform","line-height"],R=o.extend({init:function(e,t){var n,a=this;a.ns=A,o.fn.init.call(a,e,t),a._wrapper(),a._tagList(),a._input(),a._textContainer(),a._loader(),a._tabindex(a.input),t=a.options,e=a.element.attr("multiple","multiple").hide(),t.placeholder||(t.placeholder=e.data("placeholder")),n=e.attr(_),n&&(a._tagID=n+"_tag_active",n+="_taglist",a.tagList.attr(_,n)),a._aria(n),a._dataSource(),a._ignoreCase(),a._accessors(),a._popup(),a._values=[],a._dataItems=[],a._reset(),a._enable(),a._placeholder(),t.autoBind&&a.dataSource.fetch(),r.notify(a)},options:{name:"MultiSelect",enabled:!0,autoBind:!0,highlightFirst:!0,dataTextField:"",dataValueField:"",filter:"startswith",ignoreCase:!0,minLength:0,delay:100,value:null,maxSelectedItems:null,itemTemplate:"",tagTemplate:"",placeholder:"",height:200,animation:{}},events:[v,m,y,b,"dataBinding","dataBound"],setDataSource:function(e){this.options.dataSource=e,this._dataSource(),this.options.autoBind&&this.dataSource.fetch()},setOptions:function(e){o.fn.setOptions.call(this,e),this._template(),this._accessors(),this._aria(this.tagList.attr(_))},current:function(e){return this.currentTag(null),o.fn.current.call(this,e)},currentTag:function(e){var n=this;return e===t?n._currentTag:(n._currentTag&&(n._currentTag.removeClass(I).removeAttr(_),n.input.removeAttr("aria-activedescendant")),e&&(e.addClass(I).attr(_,n._tagID),n.input.attr("aria-activedescendant",n._tagID)),n._currentTag=e,t)},dataItems:function(){return this._dataItems},destroy:function(){var e=this,t=e.ns;e.wrapper.off(t),e.tagList.off(t),e.input.off(t),o.fn.destroy.call(e)},_editable:function(t){var n=this,a=t.disable,i=t.readonly,l=n.wrapper.off(A),r=n.tagList.off(A),s=n.element.add(n.input.off(A));i||a?(a?l.addClass(D):l.removeClass(D),s.attr(E,a).attr(F,i).attr(x,a).attr(S,i)):(l.removeClass(D).on(W,n._toggleHover).on("mousedown"+A,function(e){e.preventDefault(),-1==e.target.className.indexOf("k-delete")&&n.open(),n.input[0]!==c()&&n.input.focus()}),n.input.on(H,p(n._keydown,n)).on("paste"+A,p(n._search,n)).on("focus"+A,function(){n._placeholder(!1)}).on("blur"+A,function(){clearTimeout(n._typing),n._placeholder(),n.close(),n._state===g&&(n._state=f)}),s.removeAttr(E).removeAttr(F).attr(x,!1).attr(S,!1),r.on(N,h,function(){e(this).addClass(B)}).on(O,h,function(){e(this).removeClass(B)}).on(V,".k-delete",function(t){n._unselect(e(t.target).closest(h)),n._change(),n.close()}))},close:function(){this.popup.close(),this.current(null)},open:function(){var t=this;t.ul[0].firstChild&&t._state!==f?t._visibleItems&&t._allowSelection()&&(t.popup.open(),t.current(t.options.highlightFirst?e(a(t.ul[0])):null)):(t._state="",t._open=!0,t._filterSource())},toggle:function(e){this[e?v:m]()},refresh:function(){var t,n=this,i=null;n.trigger("dataBinding"),t=n._render(n.dataSource.view()),n._height(t),n._setInitialValues&&(n._setInitialValues=!1,n.value(n._initialValues)),n._open&&(n._open=!1,n.toggle(t)),n.popup.visible()&&(n.popup._position(),n.options.highlightFirst&&(i=e(a(n.ul[0])))),n.current(i),n._touchScroller&&n._touchScroller.reset(),n._makeUnselectable(),n._hideBusy(),n.trigger("dataBound")},search:function(e){var t=this,n=t.options,a=n.ignoreCase,i=n.filter,l=n.dataTextField;clearTimeout(t._typing),e="string"==typeof e?e:t.input.val(),e.length>=n.minLength&&(t._state=g,t._open=!0,t._filterSource({value:a?e.toLowerCase():e,field:l,operator:i,ignoreCase:a}))},value:function(n){var a,i=this,l=e(i.tagList[0].children),r=l.length,s=0;if(n===t)return i._values;if(!i._fetchItems(n)){for(;r>s;s++)i._unselect(l.eq(s));if(null!==n){for(n=e.isArray(n)||n instanceof d?n:[n],s=0,r=n.length;r>s;s++)a=i._index(n[s]),a>-1&&i._select(a);i._old=i._values.slice()}}},_dataSource:function(){var t=this,n=t.element,a=t.options,i=a.dataSource||{};i=e.isArray(i)?{data:i}:i,i.select=n,i.fields=[{field:a.dataTextField},{field:a.dataValueField}],t.dataSource&&t._refreshHandler?t._unbindDataSource():(t._refreshHandler=p(t.refresh,t),t._progressHandler=p(t._showBusy,t)),t.dataSource=r.data.DataSource.create(i).bind(y,t._refreshHandler).bind(T,t._progressHandler)},_fetchItems:function(e){var n=this;return n._fetch||n.ul[0].firstChild?t:(n.dataSource.one(y,function(){n.value(e),n._fetch=!1}),n._fetch=!0,n.dataSource.fetch(),!0)},_reset:function(){var e=this,t=e.element,n=t.closest("form");n[0]&&(e._resetHandler=function(){setTimeout(function(){e.value(e._initialValues)})},e._form=n.on("reset",e._resetHandler))},_initValue:function(){var e=this,t=e.options.value||e.element.val();null===t&&(t=[]),e._old=e._initialValues=t,e._setInitialValues=!!t[0]},_change:function(){var e=this,t=e.value();n(t,e._old)||(e._old=t.slice(),e.trigger(y),e.element.trigger(y))},_click:function(n){var a=this,i=e(n.currentTarget);if(!n.isDefaultPrevented()){if(a.trigger(b,{item:i}))return a.close(),t;a._select(i),a._change(),a.close()}},_item:function(e,t){return e=e[t](),e[0]&&!e.is(":visible")&&(e=this._item(e,t)),e},_keydown:function(n){var s=this,o=n.keyCode,c=s._currentTag,d=s._current,p=s.input.val(),_=r.support.isRtl(s.wrapper),h=s.popup.visible();if(o===u.DOWN){if(n.preventDefault(),!h)return s.open(),t;d=d?l(d[0],w):s.ul[0].firstChild,d&&s.current(e(d))}else o===u.UP?(h&&(d=d?l(d[0],k):s.ul[0].lastChild,s.current(e(d)),s._current[0]||s.close()),n.preventDefault()):o===u.LEFT&&!_||o===u.RIGHT&&_?p||(c=c?c.prev():e(s.tagList[0].lastChild),c[0]&&s.currentTag(c)):o===u.RIGHT&&!_||o===u.LEFT&&_?!p&&c&&(c=c.next(),s.currentTag(c[0]?c:null)):o===u.ENTER?h&&(d&&s._select(d),s._change(),s.close(),n.preventDefault()):o===u.ESC?(h?n.preventDefault():s.currentTag(null),s.close()):o===u.HOME?h?s.current(e(a(s.ul[0]))):p||(c=s.tagList[0].firstChild,c&&s.currentTag(e(c))):o===u.END?h?s.current(e(i(s.ul[0]))):p||(c=s.tagList[0].lastChild,c&&s.currentTag(e(c))):o!==u.DELETE&&o!==u.BACKSPACE||p?(clearTimeout(s._typing),s._search()):(o!==u.BACKSPACE||c||(c=e(s.tagList[0].lastChild)),c&&c[0]&&(s._unselect(c),s._change(),s.close()))},_hideBusy:function(){var e=this;clearTimeout(e._busy),e.input.attr("aria-busy",!1),e._loading.addClass(L),e._busy=null},_showBusy:function(){var e=this;e._busy||(e._busy=setTimeout(function(){e.input.attr("aria-busy",!0),e._loading.removeClass(L)},100))},_placeholder:function(e){var n=this,a=n.input;e===t?(e=!1,a[0]!==c()&&(e=!n._dataItems[0]),n.wrapper.removeClass(I)):n.wrapper.addClass(I),a.toggleClass("k-readonly",e).val(e?n.options.placeholder:""),n._scale()},_scale:function(){var e,t=this,n=t.wrapper.width(),a=t._span.text(t.input.val());n?e=a.width()+25:(a.appendTo(document.documentElement),n=e=a.width()+25,a.appendTo(this.wrapper)),t.input.width(e>n?n:e)},_option:function(e,n){var a="<option",i=this._text(e),l=this._value(e);return l!==t&&(l+="",-1!==l.indexOf('"')&&(l=l.replace(M,"&quot;")),a+=' value="'+l+'"'),n&&(a+=' selected="selected"'),a+=">",i!==t&&(a+=r.htmlEncode(i)),a+="</option>"},_render:function(e){for(var t,n,a=this,i=e.length,l=a.itemTemplate,r=a._dataItems.slice(0),s=0,o=0,u="",c="";i>o;o++)t=e[o],n=a._selected(r,t),c+=l(t,o,n),u+=a._option(t,n),n||(s+=1);if(i=r.length)for(o=0;i>o;o++)u+=a._option(r[o],!0);return a.ul[0].innerHTML=c,a.element.html(u),a._visibleItems=s,s},_selected:function(e,n){var a,i=this,l=i._text,r=i._value,s=r(n),o=e.length,u=!1,c=0;for(s===t&&(s=l(n));o>c;c++)if(n=e[c],a=r(n),a===t&&(a=l(n)),a!==t&&a===s){u=!0;break}return u&&e.splice(c,1),u},_search:function(){var e=this;e._typing=setTimeout(function(){var t=e.input.val();e._prev!==t&&(e._scale(),e._prev=t,e.search(t))},e.options.delay)},_allowSelection:function(){var e=this.options.maxSelectedItems;return null===e||e>this._values.length},_select:function(e){var t,n,a=this,i=a._values;a._allowSelection()&&(isNaN(e)?n=e.hide().data("idx"):(n=e,a.ul[0].children[n].style.display="none"),a.element[0].children[n].selected=!0,t=a.dataSource.view()[n],a.tagList.append(a.tagTemplate(t)),a._dataItems.push(t),i.push(a._dataValue(t)),a._visibleItems-=1,a.currentTag(null),a._placeholder(),a._height(a._visibleItems),a._state===g&&(a._state=f))},_unselect:function(t){var n,a,i,l,r,s=this,o=t.index();if(t.remove(),s.currentTag(null),s._values.splice(o,1),n=s._dataItems.splice(o,1)[0],a=s._dataValue(n),o=s._index(a),-1!==o)e(s.ul[0].children[o]).show(),s.element[0].children[o].selected=!1,s._visibleItems+=1,s._height(s._visibleItems);else for(o=s.dataSource.view().length,i=s.element[0].children,r=i.length;r>o;o++)if(l=i[o],l.value==a){l.selected=!1;break}s._placeholder()},_template:function(){var e,t=this,n=t.options,a=n.itemTemplate,i=n.tagTemplate,l=n.dataSource;t.element[0].length&&!l&&(n.dataTextField=n.dataTextField||"text",n.dataValueField=n.dataValueField||"value"),e=r.template("#:"+r.expr(n.dataTextField,"data")+"#",{useWithBlock:!1}),a=a?r.template(a):e,i=i?r.template(i):e,t.itemTemplate=function(e,t,n){return'<li tabindex="-1" role="option" data-idx="'+t+'" unselectable="on" class="k-item"'+(n?C:"")+">"+a(e)+"</li>"},t.tagTemplate=function(e){return'<li class="k-button"><span>'+i(e)+'</span><span class="k-icon k-delete">delete</span></li>'}},_input:function(){var t=this,n=t.element[0].accessKey,a=t._innerWrapper.children("input.k-input");a[0]||(a=e('<input class="k-input" style="width: 25px" />').appendTo(t._innerWrapper)),t.element.removeAttr("accesskey"),t._focused=t.input=a.attr({accesskey:n,role:"listbox","aria-expanded":!1})},_tagList:function(){var t=this,n=t._innerWrapper.children("ul");n[0]||(n=e('<ul role="listbox" unselectable="on" class="k-reset"/>').appendTo(t._innerWrapper)),t.tagList=n},_loader:function(){this._loading=e('<span class="k-icon k-loading '+L+'"></span>').insertAfter(this.input)},_textContainer:function(){var t=r.getComputedStyles(this.input[0],P);t.position="absolute",t.visibility="hidden",this._span=e("<span/>").css(t).appendTo(this.wrapper)},_wrapper:function(){var t=this,n=t.element,a=n.parent("span.k-multiselect");a[0]||(a=n.wrap('<div class="k-widget k-multiselect k-header" />').parent(),a[0].style.cssText=n[0].style.cssText,e('<div class="k-multiselect-wrap k-floatwrap" />').insertBefore(n)),t.wrapper=a.addClass(n[0].className).css("display",""),t._innerWrapper=e(a[0].firstChild)}});s.plugin(R)})(window.kendo.jQuery)});