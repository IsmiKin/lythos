/*
* Kendo UI Complete v2013.1.319 (http://kendoui.com)
* Copyright 2013 Telerik AD. All rights reserved.
*
* Kendo UI Complete commercial licenses may be obtained at
* https://www.kendoui.com/purchase/license-agreement/kendo-ui-complete-commercial.aspx
* If you do not own a commercial license, this file shall be governed by the trial license terms.
*/
("function"==typeof define&&define.amd?define:function(e,n){return n()})(["./kendo.data.min"],function(){(function(e,n){var t=window.kendo,r=e.proxy,i="dir",a="asc",o="single",d="field",l="desc",s=".kendoSortable",f=".k-link",c="aria-sort",u=t.ui.Widget,k=u.extend({init:function(e,n){var t,i=this;u.fn.init.call(i,e,n),i._refreshHandler=r(i.refresh,i),i.dataSource=i.options.dataSource.bind("change",i._refreshHandler),t=i.element.find(f),t[0]||(t=i.element.wrapInner('<a class="k-link" href="#"/>').find(f)),i.link=t,i.element.on("click"+s,r(i._click,i))},options:{name:"Sortable",mode:o,allowUnsort:!0},destroy:function(){var e=this;u.fn.destroy.call(e),e.element.off(s),e.dataSource.unbind("change",e._refreshHandler)},refresh:function(){var n,r,o,s,f=this,u=f.dataSource.sort()||[],k=f.element,p=k.attr(t.attr(d));for(k.removeAttr(t.attr(i)),k.removeAttr(c),n=0,r=u.length;r>n;n++)o=u[n],p==o.field&&k.attr(t.attr(i),o.dir);s=k.attr(t.attr(i)),k.find(".k-i-arrow-n,.k-i-arrow-s").remove(),s===a?(e('<span class="k-icon k-i-arrow-n" />').appendTo(f.link),k.attr(c,"ascending")):s===l&&(e('<span class="k-icon k-i-arrow-s" />').appendTo(f.link),k.attr(c,"descending"))},_click:function(e){var r,s,f=this,c=f.element,u=c.attr(t.attr(d)),k=c.attr(t.attr(i)),p=f.options,m=f.dataSource.sort()||[];if(k=k===a?l:k===l&&p.allowUnsort?n:a,p.mode===o)m=[{field:u,dir:k}];else if("multiple"===p.mode){for(r=0,s=m.length;s>r;r++)if(m[r].field===u){m.splice(r,1);break}m.push({field:u,dir:k})}e.preventDefault(),f.dataSource.sort(m)}});t.ui.plugin(k)})(window.kendo.jQuery)});