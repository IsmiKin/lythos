/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,t){return t()})(["./kendo.calendar.min","./kendo.popup.min"],function(){(function(e,t){function a(t){var a=t.parseFormats,n=t.format;H.normalize(t),a=e.isArray(a)?a:[a],-1===e.inArray(n,a)&&a.splice(0,0,t.format),t.parseFormats=a}function n(e){e.preventDefault()}var o,r=window.kendo,i=r.ui,l=i.Widget,s=r.parseDate,d=r.keys,u=r.template,p=r._activeElement,c="<div />",f="<span />",m=".kendoDatePicker",v="click"+m,_="open",h="close",k="change",w="dateView",g="disabled",y="readonly",b="k-state-default",x="k-state-focused",C="k-state-selected",V="k-state-disabled",D="k-state-hover",T="keydown"+m,A="mouseenter"+m+" mouseleave"+m,I="mousedown"+m,W="id",R="min",E="max",N="month",F="aria-disabled",O="aria-expanded",P="aria-hidden",S="aria-readonly",H=r.calendar,B=H.isInRange,z=H.restrictValue,K=H.isEqualDatePart,U=e.extend,j=e.proxy,q=Date,Q=function(t){var a,n=this,l=document.body,s=o.sharedCalendar,d=e(c).attr(P,"true").addClass("k-calendar-container").appendTo(l);s||(s=o.sharedCalendar=new i.Calendar(e(c).attr(W,r.guid()).hide().appendTo(l),{focusOnNav:!1}),H.makeUnselectable(s.element)),n.calendar=s,n.options=t=t||{},a=t.id,a&&(a+="_dateview",d.attr(W,a),n._dateViewID=a),n.popup=new i.Popup(d,U(t.popup,t,{name:"Popup",isRtl:r.support.isRtl(t.anchor)})),n.div=d,n._templates(),n.value(t.value)};Q.prototype={_calendar:function(){var e=this,t=e.popup,a=e.options,o=e.calendar,r=o.element;r.data(w)!==e&&(r.appendTo(t.element).data(w,e).off(v+" "+T).on(v,"td:has(.k-link)",j(e._click,e)).on(I,n).show(),o.unbind(k).bind(k,a),o.month=e.month,o.options.dates=a.dates,o.options.depth=a.depth,o.options.culture=a.culture,o._footer(e.footer),o.min(a.min),o.max(a.max),o.navigate(e._value||e._current,a.start),e.value(e._value))},destroy:function(){var a,n=this,r=n.calendar,i=r.element,l=i.data(w);(l===t||l===n)&&(a=e(".k-calendar-container"),a.length>1?i.hide().appendTo(document.body):(i.off(m),r.destroy(),r.element.remove(),o.sharedCalendar=null)),n.popup.destroy()},open:function(){var e=this;e._calendar(),e.popup.open()},close:function(){this.popup.close()},min:function(e){this._option(R,e)},max:function(e){this._option(E,e)},toggle:function(){var e=this;e[e.popup.visible()?h:_]()},move:function(e){var a=this,n=e.keyCode,o=a.calendar,r=e.ctrlKey&&n==d.DOWN||n==d.ENTER;if(n==d.ESC)return a.close(),t;if(e.altKey)return n==d.DOWN?(a.open(),e.preventDefault()):n==d.UP&&(a.close(),e.preventDefault()),t;if(a.popup.visible())return r&&o._cell.hasClass(C)?(a.close(),e.preventDefault(),t):(a._current=o._move(e),t)},value:function(e){var t=this,a=t.calendar,n=t.options;t._value=e,t._current=new q(+z(e,n.min,n.max)),a.element.data(w)===t&&a.value(e)},_click:function(e){-1!==e.currentTarget.className.indexOf(C)&&this.close()},_option:function(e,t){var a=this,n=a.options,o=a.calendar;n[e]=t,o.element.data(w)===a&&o[e](t)},_templates:function(){var e=this,t=e.options,a=t.footer,n=t.month||{},o=n.content,i=n.empty;e.month={content:u('<td#=data.cssClass#><a tabindex="-1" class="k-link" href="\\#" '+r.attr("value")+'="#=data.dateString#" title="#=data.title#">'+(o||"#=data.value#")+"</a></td>",{useWithBlock:!!o}),empty:u("<td>"+(i||"&nbsp;")+"</td>",{useWithBlock:!!i})},a!==!1&&(e.footer=u(a||'#= kendo.toString(data,"D","'+t.culture+'") #',{useWithBlock:!1}))}},Q.normalize=a,r.DateView=Q,o=l.extend({init:function(e,t){var n,o,i=this;l.fn.init.call(i,e,t),e=i.element,t=i.options,a(t),i._wrapper(),i.dateView=new Q(U({},t,{id:e.attr(W),anchor:i.wrapper,change:function(){i._change(this.value()),i.close()},close:function(t){i.trigger(h)?t.preventDefault():(e.attr(O,!1),o.attr(P,!0))},open:function(t){var a,n=i.options;i.trigger(_)?t.preventDefault():(i.element.val()!==i._oldText&&(a=s(e.val(),n.parseFormats,n.culture),a?(i.dateView._current=a,i.dateView.calendar._focus(a)):i.dateView.value(a)),e.attr(O,!0),o.attr(P,!1))}})),o=i.dateView.div,i._icon(),e[0].type="text",e.addClass("k-input").attr({role:"textbox","aria-haspopup":!0,"aria-expanded":!1,"aria-owns":i.dateView._dateViewID}),i._reset(),i._template(),n=e.is("[disabled]"),n?i.enable(!1):i.readonly(e.is("[readonly]")),i.value(t.value||i.element.val()),r.notify(i)},events:[_,h,k],options:{name:"DatePicker",value:null,footer:"",format:"",culture:"",parseFormats:[],min:new Date(1900,0,1),max:new Date(2099,11,31),start:N,depth:N,animation:{},month:{},dates:[],ARIATemplate:'Current focused date is #=kendo.toString(data.current, "D")#'},setOptions:function(e){var t=this,n=t.dateView,o=n.options;l.fn.setOptions.call(t,e),a(t.options),n.options=U(o,t.options,{change:o.change,close:o.close,open:o.open})},_editable:function(e){var t=this,a=t._dateIcon.off(m),o=t.element.off(m),r=t._inputWrapper.off(m),i=e.readonly,l=e.disable;i||l?(r.addClass(l?V:b).removeClass(l?b:V),o.attr(g,l).attr(y,i).attr(F,l).attr(S,i)):(r.addClass(b).removeClass(V).on(A,t._toggleHover),o.removeAttr(g).removeAttr(y).attr(F,!1).attr(S,!1).on("keydown"+m,j(t._keydown,t)).on("blur"+m,j(t._blur,t)).on("focus"+m,function(){t._inputWrapper.addClass(x)}),a.on(v,j(t._click,t)).on(I,n))},readonly:function(e){this._editable({readonly:e===t?!0:e,disable:!1})},enable:function(e){this._editable({readonly:!1,disable:!(e=e===t?!0:e)})},destroy:function(){var e=this;l.fn.destroy.call(e),e.dateView.destroy(),e.element.off(m),e._dateIcon.off(m),e._inputWrapper.off(m),e._form&&e._form.off("reset",e._resetHandler)},open:function(){this.dateView.open()},close:function(){this.dateView.close()},min:function(e){return this._option(R,e)},max:function(e){return this._option(E,e)},value:function(e){var a=this;return e===t?a._value:(a._old=a._update(e),null===a._old&&a.element.val(""),a._oldText=a.element.val(),t)},_toggleHover:function(t){e(t.currentTarget).toggleClass(D,"mouseenter"===t.type)},_blur:function(){var e=this,t=e.element.val();e.close(),t!==e._oldText&&e._change(t),e._inputWrapper.removeClass(x)},_click:function(){var e=this,t=e.element;e.dateView.toggle(),r.support.touch||t[0]===p()||t.focus()},_change:function(e){var t=this;e=t._update(e),+t._old!=+e&&(t._old=e,t._oldText=t.element.val(),t.trigger(k),t.element.trigger(k))},_keydown:function(e){var t=this,a=t.dateView,n=t.element.val();a.popup.visible()||e.keyCode!=d.ENTER||n===t._oldText?(a.move(e),t._updateARIA(a._current)):t._change(n)},_icon:function(){var t,a=this,n=a.element;t=n.next("span.k-select"),t[0]||(t=e('<span unselectable="on" class="k-select"><span unselectable="on" class="k-icon k-i-calendar">select</span></span>').insertAfter(n)),a._dateIcon=t.attr({role:"button","aria-controls":a.dateView._dateViewID})},_option:function(e,a){var n=this,o=n.options;return a===t?o[e]:(a=s(a,o.parseFormats,o.culture),a&&(o[e]=new q(+a),n.dateView[e](a)),t)},_update:function(e){var t,a=this,n=a.options,o=n.min,i=n.max,l=s(e,n.parseFormats,n.culture);return+l===+a._value?(t=r.toString(l,n.format,n.culture),t!==e&&a.element.val(null===l?e:t),l):(null!==l&&K(l,o)?l=z(l,o,i):B(l,o,i)||(l=null),a._value=l,a.dateView.value(l),a.element.val(l?r.toString(l,n.format,n.culture):e),a._updateARIA(l),l)},_wrapper:function(){var t,a=this,n=a.element;t=n.parents(".k-datepicker"),t[0]||(t=n.wrap(f).parent().addClass("k-picker-wrap k-state-default"),t=t.wrap(f).parent()),t[0].style.cssText=n[0].style.cssText,n.css({width:"100%",height:n[0].style.height}),a.wrapper=t.addClass("k-widget k-datepicker k-header").addClass(n[0].className),a._inputWrapper=e(t[0].firstChild)},_reset:function(){var e=this,t=e.element,a=t.closest("form");a[0]&&(e._resetHandler=function(){e.value(t[0].defaultValue)},e._form=a.on("reset",e._resetHandler))},_template:function(){this._ariaTemplate=u(this.options.ARIATemplate)},_updateARIA:function(e){this.element.attr("aria-label",this._ariaTemplate({current:e}))}}),i.plugin(o)})(window.kendo.jQuery)});