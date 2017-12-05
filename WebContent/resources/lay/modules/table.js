/** layui-v2.1.2 MIT License By http://www.layui.com */
 ;layui.define(["laytpl","laypage","layer","form"],function(e){"use strict";var t=layui.$,i=layui.laytpl,a=layui.laypage,l=layui.layer,n=layui.form,o=layui.hint(),r=layui.device(),d={config:{checkName:"LAY_CHECKED",indexName:"LAY_TABLE_INDEX"},cache:{},index:layui.table?layui.table.index+1e4:0,set:function(e){var i=this;return i.config=t.extend({},i.config,e),i},on:function(e,t){return layui.onevent.call(this,s,e,t)}},c=function(){var e=this,t=e.config,i=t.id;return i&&(c.config[i]=t),{reload:function(t){e.reload.call(e,t)},config:t}},s="table",u=".layui-table",f="layui-hide",h="layui-table-view",y=".layui-table-header",p=".layui-table-body",m=".layui-table-main",v=".layui-table-fixed",g=".layui-table-fixed-l",x=".layui-table-fixed-r",b=".layui-table-tool",k=".layui-table-sort",w="layui-table-edit",C="layui-table-hover",z=function(e){return e=e||{},['<table cellspacing="0" cellpadding="0" border="0" class="layui-table" ','{{# if(d.data.skin){ }}lay-skin="{{d.data.skin}}"{{# } }} {{# if(d.data.size){ }}lay-size="{{d.data.size}}"{{# } }} {{# if(d.data.even){ }}lay-even{{# } }}>',"<thead>","{{# layui.each(d.data.cols, function(i1, item1){ }}","<tr>","{{# layui.each(item1, function(i2, item2){ }}",'{{# if(item2.fixed && item2.fixed !== "right"){ left = true; } }}','{{# if(item2.fixed === "right"){ right = true; } }}',function(){return e.fixed&&"right"!==e.fixed?'{{# if(item2.fixed && item2.fixed !== "right"){ }}':"right"===e.fixed?'{{# if(item2.fixed === "right"){ }}':""}(),"{{# if(item2.checkbox){ }}",'<th data-field="{{ item2.field||i2 }}" data-type="checkbox" {{#if(item2.colspan){}} colspan="{{item2.colspan}}"{{#} if(item2.rowspan){}} rowspan="{{item2.rowspan}}"{{#}}} unresize="true"><div class="layui-table-cell laytable-cell-checkbox"><input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose" {{# if(item2[d.data.checkName]){ }}checked{{# }; }}></div></th>',"{{# } else if(item2.space){ }}",'<th data-field="{{ item2.field||i2 }}" {{#if(item2.colspan){}} colspan="{{item2.colspan}}"{{#} if(item2.rowspan){}} rowspan="{{item2.rowspan}}"{{#}}} unresize="true"><div class="layui-table-cell laytable-cell-space"></div></th>',"{{# } else { }}",'<th data-field="{{ item2.field||i2 }}" {{#if(item2.colspan){}} colspan="{{item2.colspan}}"{{#} if(item2.rowspan){}} rowspan="{{item2.rowspan}}"{{#}}} {{# if(item2.unresize){ }}unresize="true"{{# } }}>',"{{# if(item2.colspan > 1){ }}",'<div class="layui-table-cell laytable-cell-group" {{#if(item2.align){}}align="{{item2.align}}"{{#}}}>','<span>{{item2.title||""}}</span>',"</div>","{{# } else { }}",'<div class="layui-table-cell laytable-cell-{{d.index}}-{{item2.field||i2}}" {{#if(item2.align){}}align="{{item2.align}}"{{#}}}>','<span>{{item2.title||""}}</span>',"{{# if(item2.sort){ }}",'<span class="layui-table-sort layui-inline"><i class="layui-edge layui-table-sort-asc"></i><i class="layui-edge layui-table-sort-desc"></i></span>',"{{# } }}","</div>","{{# } }}","</th>","{{# }; }}",e.fixed?"{{# }; }}":"","{{# }); }}","</tr>","{{# }); }}","</thead>","</table>"].join("")},F=['<table cellspacing="0" cellpadding="0" border="0" class="layui-table" ','{{# if(d.data.skin){ }}lay-skin="{{d.data.skin}}"{{# } }} {{# if(d.data.size){ }}lay-size="{{d.data.size}}"{{# } }} {{# if(d.data.even){ }}lay-even{{# } }}>',"<tbody></tbody>","</table>"].join(""),N=['<div class="layui-form layui-border-box {{d.VIEW_CLASS}}" lay-filter="LAY-table-{{d.index}}" style="{{# if(d.data.width){ }}width:{{d.data.width}}px;{{# } }} {{# if(d.data.height){ }}height:{{d.data.height}}px;{{# } }}">',"{{# var left, right; }}",'<div class="layui-table-header">',z(),"</div>",'<div class="layui-table-body layui-table-main">',F,"</div>","{{# if(left){ }}",'<div class="layui-table-fixed layui-table-fixed-l">','<div class="layui-table-header">',z({fixed:!0}),"</div>",'<div class="layui-table-body">',F,"</div>","</div>","{{# }; }}","{{# if(right){ }}",'<div class="layui-table-fixed layui-table-fixed-r">','<div class="layui-table-header">',z({fixed:"right"}),'<div class="layui-table-mend"></div>',"</div>",'<div class="layui-table-body">',F,"</div>","</div>","{{# }; }}","{{# if(d.data.page){ }}",'<div class="layui-table-tool">','<div class="layui-inline layui-table-page" id="layui-table-page{{d.index}}"></div>',"</div>","{{# } }}","<style>","{{# layui.each(d.data.cols, function(i1, item1){","layui.each(item1, function(i2, item2){ }}",".laytable-cell-{{d.index}}-{{item2.field||i2}}{ width:{{item2.width||50}}px }","{{# });","}); }}","</style>","</div>"].join(""),T=t(window),S=t(document),A=function(e){var i=this;i.index=++d.index,i.config=t.extend({},i.config,d.config,e),i.render()};A.prototype.config={limit:30,loading:!0},A.prototype.render=function(e){var a,l=this;if(e&&(l.config=e),a=l.config,a.elem=t(a.elem),a.where=a.where||{},a.request=t.extend({pageName:"page",limitName:"limit"},a.request),a.response=t.extend({statusName:"code",statusCode:0,msgName:"msg",dataName:"data",countName:"count"},a.response),!a.elem[0])return l;var n=a.elem,o=n.next("."+h);a.height&&/^full-\d+$/.test(a.height)&&(l.fullHeightGap=a.height.split("-")[1],a.height=T.height()-l.fullHeightGap);var r=l.elem=t(i(N).render({VIEW_CLASS:h,data:a,index:l.index}));if(a.index=l.index,o[0]&&o.remove(),n.after(r),l.layHeader=r.find(y),l.layMain=r.find(m),l.layBody=r.find(p),l.layFixed=r.find(v),l.layFixLeft=r.find(g),l.layFixRight=r.find(x),l.layTool=r.find(b),a.height&&l.fullSize(),a.cols.length>1){var d=l.layFixed.find(y).find("th");d.height(l.layHeader.height()-1-parseFloat(d.css("padding-top"))-parseFloat(d.css("padding-bottom")))}l.pullData(1),l.events()},A.prototype.reload=function(e){var i=this;i.config=t.extend({},i.config,e),i.render()},A.prototype.pullData=function(e,i){var a=this,n=a.config,o=n.request,r=n.response,d=function(){"object"==typeof n.initSort&&a.sort(n.initSort.field,n.initSort.type)};if(n.url){var c={};c[o.pageName]=e,c[o.limitName]=n.limit,t.ajax({type:n.method||"get",url:n.url,data:t.extend(c,n.where),dataType:"json",success:function(t){return t[r.statusName]!=r.statusCode?(a.renderForm(),a.layMain.html('<div class="layui-none">'+(t[r.msgName]||"返回的数据状态异常")+"</div>")):(a.renderData(t,e,t[r.countName]),d(),i&&l.close(i),void("function"==typeof n.done&&n.done(t,e,t[r.countName])))},error:function(e,t){a.layMain.html('<div class="layui-none">数据接口请求异常</div>'),a.renderForm(),i&&l.close(i)}})}else if(n.data&&n.data.constructor===Array){var s={},u=e*n.limit-n.limit;s[r.dataName]=n.data.concat().splice(u,n.limit),s[r.countName]=n.data.length,a.renderData(s,e,n.data.length),d(),"function"==typeof n.done&&n.done(s,e,s[r.countName])}},A.prototype.page=1,A.prototype.eachCols=function(e){layui.each(this.config.cols,function(t,i){layui.each(i,function(a,l){e(a,l,[t,i])})})},A.prototype.renderData=function(e,n,o,r){var c=this,s=c.config,u=e[s.response.dataName]||[],f=[],h=[],y=[],p=function(){return!r&&c.sortKey?c.sort(c.sortKey.field,c.sortKey.sort,!0):(layui.each(u,function(e,a){var l=[],n=[],o=[];0!==a.length&&(r||(a[d.config.indexName]=e),c.eachCols(function(e,r){var c=a[r.field||e];if(void 0!==c&&null!==c||(c=""),!(r.colspan>1)){var u=['<td data-field="'+(r.field||e)+'"'+function(){var e=[];return r.edit&&e.push(' data-edit="true"'),r.align&&e.push(' align="'+r.align+'"'),r.templet&&e.push(' data-content="'+c+'"'),r.toolbar&&e.push(' data-off="true"'),r.event&&e.push(' lay-event="'+r.event+'"'),r.style&&e.push(' style="'+r.style+'"'),e.join("")}()+">",'<div class="layui-table-cell laytable-cell-'+function(){return r.checkbox?"checkbox":r.space?"space":s.index+"-"+(r.field||e)}()+'">'+function(){return r.checkbox?'<input type="checkbox" name="layTableCheckbox" lay-skin="primary" '+function(){var e=d.config.checkName;return r[e]?(a[e]=r[e],r[e]?"checked":""):a[e]?"checked":""}()+">":r.toolbar?i(t(r.toolbar).html()||"").render(a):r.templet?i(t(r.templet).html()||String(c)).render(a):c}(),"</div></td>"].join("");l.push(u),r.fixed&&"right"!==r.fixed&&n.push(u),"right"===r.fixed&&o.push(u)}}),f.push('<tr data-index="'+e+'">'+l.join("")+"</tr>"),h.push('<tr data-index="'+e+'">'+n.join("")+"</tr>"),y.push('<tr data-index="'+e+'">'+o.join("")+"</tr>"))}),c.layBody.scrollTop(0),c.layMain.find("tbody").html(f.join("")),c.layFixLeft.find("tbody").html(h.join("")),c.layFixRight.find("tbody").html(y.join("")),c.renderForm(),c.syncCheckAll(),c.haveInit?c.scrollPatch():setTimeout(function(){c.scrollPatch()},50),c.haveInit=!0,void l.close(c.tipsIndex))};return c.key=s.id||s.index,d.cache[c.key]=u,r?p():0===u.length?(c.renderForm(),c.layFixed.remove(),c.layMain.html('<div class="layui-none">无数据</div>')):(p(),void(s.page&&(c.page=n,c.count=o,a.render({elem:"layui-table-page"+s.index,count:o,groups:3,limits:s.limits||[10,20,30,40,50,60,70,80,90],limit:s.limit,curr:n,layout:["prev","page","next","skip","count","limit"],prev:'<i class="layui-icon">&#xe603;</i>',next:'<i class="layui-icon">&#xe602;</i>',jump:function(e,t){t||(c.page=e.curr,s.limit=e.limit,c.pullData(e.curr,c.loading()))}}),c.layTool.find(".layui-table-count span").html(o))))},A.prototype.renderForm=function(e){n.render(e||"checkbox","LAY-table-"+this.index)},A.prototype.sort=function(e,i,a,n){var r,c,u=this,f=u.config,h=f.elem.attr("lay-filter"),y=d.cache[u.key];"string"==typeof e&&u.layHeader.find("th").each(function(i,a){var l=t(this),n=l.data("field");if(n===e)return e=l,r=n,!1});try{var r=r||e.data("field");if(u.sortKey&&!a&&r===u.sortKey.field&&i===u.sortKey.sort)return;var p=u.layHeader.find("th .laytable-cell-"+f.index+"-"+r).find(k);u.layHeader.find("th").find(k).removeAttr("lay-sort"),p.attr("lay-sort",i||null),u.layFixed.find("th")}catch(m){return o.error("Table modules: Did not match to field")}u.sortKey={field:r,sort:i},"asc"===i?c=layui.sort(y,r):"desc"===i?c=layui.sort(y,r,!0):(c=layui.sort(y,d.config.indexName),delete u.sortKey),u.renderData({data:c},u.page,u.count,!0),l.close(u.tipsIndex),n&&layui.event.call(e,s,"sort("+h+")",{field:r,type:i})},A.prototype.loading=function(){var e=this,t=e.config;if(t.loading&&t.url)return l.msg("数据请求中",{icon:16,offset:[e.elem.offset().top+e.elem.height()/2-35-T.scrollTop()+"px",e.elem.offset().left+e.elem.width()/2-90-T.scrollLeft()+"px"],anim:-1,fixed:!1})},A.prototype.setCheckData=function(e,t){var i=this,a=i.config,l=d.cache[i.key];l[e]&&(l[e][a.checkName]=t)},A.prototype.syncCheckAll=function(){var e=this,t=e.config,i=e.layHeader.find('input[name="layTableCheckbox"]'),a=function(i){return e.eachCols(function(e,a){a.checkbox&&(a[t.checkName]=i)}),i};i[0]&&(d.checkStatus(e.key).isAll?(i[0].checked||(i.prop("checked",!0),e.renderForm()),a(!0)):(i[0].checked&&(i.prop("checked",!1),e.renderForm()),a(!1)))},A.prototype.getCssRule=function(e,t){var i=this,a=i.elem.find("style")[0],l=a.sheet||a.styleSheet,n=l.cssRules||l.rules;layui.each(n,function(a,l){if(l.selectorText===".laytable-cell-"+i.index+"-"+e)return t(l),!0})},A.prototype.fullSize=function(){var e,t=this,i=t.config,a=i.height;t.fullHeightGap&&(a=T.height()-t.fullHeightGap,a<135&&(a=135),t.elem.css("height",a)),e=parseFloat(a)-parseFloat(t.layHeader.height())-1,i.page&&(e-=parseFloat(t.layTool.outerHeight()+1)),t.layBody.css("height",e)},A.prototype.scrollPatch=function(){var e=this,i=e.layMain.children("table"),a=e.layMain.width()-e.layMain.prop("clientWidth"),l=e.layMain.height()-e.layMain.prop("clientHeight");if(a&&l){if(!e.elem.find(".layui-table-patch")[0]){var n=t('<th class="layui-table-patch"><div class="layui-table-cell"></div></th>');n.find("div").css({width:a}),e.layHeader.eq(0).find("thead tr").append(n)}}else e.layHeader.eq(0).find(".layui-table-patch").remove();e.layFixed.find(p).css("height",e.layMain.height()-l),e.layFixRight[i.width()>e.layMain.width()?"removeClass":"addClass"](f),e.layFixRight.css("right",a-1)},A.prototype.events=function(){var e,a=this,n=a.config,o=t("body"),c={},u=a.layHeader.find("th"),f=".layui-table-cell",h=n.elem.attr("lay-filter");u.on("mousemove",function(e){var i=t(this),a=i.offset().left,l=e.clientX-a;i.attr("colspan")>1||i.attr("unresize")||c.resizeStart||(c.allowResize=i.width()-l<=10,o.css("cursor",c.allowResize?"col-resize":""))}).on("mouseleave",function(){t(this);c.resizeStart||o.css("cursor","")}).on("mousedown",function(e){if(c.allowResize){var i=t(this).data("field");e.preventDefault(),c.resizeStart=!0,c.offset=[e.clientX,e.clientY],a.getCssRule(i,function(e){c.rule=e,c.ruleWidth=parseFloat(e.style.width)})}}),S.on("mousemove",function(t){if(c.resizeStart){if(t.preventDefault(),c.rule){var i=c.ruleWidth+t.clientX-c.offset[0];c.rule.style.width=i+"px",l.close(a.tipsIndex)}e=1}}).on("mouseup",function(t){c.resizeStart&&(c={},o.css("cursor",""),a.scrollPatch()),2===e&&(e=null)}),u.on("click",function(){var i,l=t(this),n=l.find(k),o=n.attr("lay-sort");return n[0]&&1!==e?(i="asc"===o?"desc":"desc"===o?null:"asc",void a.sort(l,i,null,!0)):e=2}).find(k+" .layui-edge ").on("click",function(e){var i=t(this),l=i.index(),n=i.parents("th").eq(0).data("field");layui.stope(e),0===l?a.sort(n,"asc",null,!0):a.sort(n,"desc",null,!0)}),a.elem.on("click",'input[name="layTableCheckbox"]+',function(){var e=t(this).prev(),i=a.layBody.find('input[name="layTableCheckbox"]'),l=e.parents("tr").eq(0).data("index"),n=e[0].checked,o="layTableAllChoose"===e.attr("lay-filter");o?(i.each(function(e,t){t.checked=n,a.setCheckData(e,n)}),a.syncCheckAll(),a.renderForm()):(a.setCheckData(l,n),a.syncCheckAll()),layui.event.call(this,s,"checkbox("+h+")",{checked:n,data:d.cache[a.key][l],type:o?"all":"one"})}),a.layBody.on("mouseenter","tr",function(){var e=t(this),i=e.index();a.layBody.find("tr:eq("+i+")").addClass(C)}).on("mouseleave","tr",function(){var e=t(this),i=e.index();a.layBody.find("tr:eq("+i+")").removeClass(C)}),a.layBody.on("change","."+w,function(){var e=t(this),i=this.value,l=e.parent().data("field"),n=e.parents("tr").eq(0).data("index"),o=d.cache[a.key][n];o[l]=i,layui.event.call(this,s,"edit("+h+")",{value:i,data:o,field:l})}).on("blur","."+w,function(){var e,l=t(this),n=l.parent().data("field"),o=l.parents("tr").eq(0).data("index"),r=d.cache[a.key][o];a.eachCols(function(t,i){i.field==n&&i.templet&&(e=i.templet)}),l.siblings(f).html(e?i(t(e).html()||this.value).render(r):this.value),l.parent().data("content",this.value),l.remove()}),a.layBody.on("click","td",function(){var e=t(this),i=(e.data("field"),e.children(f));if(!e.data("off")){if(e.data("edit")){var o=t('<input class="'+w+'">');return o[0].value=e.data("content")||i.text(),e.find("."+w)[0]||e.append(o),o.focus()}i.prop("scrollWidth")>i.outerWidth()&&(a.tipsIndex=l.tips(['<div class="layui-table-tips-main" style="margin-top: -'+(i.height()+16)+"px;"+function(){return"sm"===n.size?"padding: 4px 15px; fonts-size: 12px;":"lg"===n.size?"padding: 14px 15px;":""}()+'">',i.html(),"</div>",'<i class="layui-icon layui-table-tips-c">&#x1006;</i>'].join(""),i[0],{tips:[3,""],time:-1,anim:-1,maxWidth:r.ios||r.android?300:600,isOutAnim:!1,skin:"layui-table-tips",success:function(e,t){e.find(".layui-table-tips-c").on("click",function(){l.close(t)})}}))}}),a.layBody.on("click","*[lay-event]",function(){var e=t(this),l=e.parents("tr").eq(0).data("index"),n=a.layBody.find('tr[data-index="'+l+'"]'),o="layui-table-click",r=d.cache[a.key][l];layui.event.call(this,s,"tool("+h+")",{data:d.clearCacheKey(r),event:e.attr("lay-event"),tr:n,del:function(){d.cache[a.key][l]=[],n.remove(),a.scrollPatch()},update:function(e){e=e||{},layui.each(e,function(e,l){if(e in r){var o;r[e]=l,a.eachCols(function(t,i){i.field==e&&i.templet&&(o=i.templet)}),n.children('td[data-field="'+e+'"]').children(f).html(o?i(t(o).html()||l).render(r):l)}})}}),n.addClass(o).siblings("tr").removeClass(o)}),a.layMain.on("scroll",function(){var e=t(this),i=e.scrollLeft(),n=e.scrollTop();a.layHeader.scrollLeft(i),a.layFixed.find(p).scrollTop(n),l.close(a.tipsIndex)}),T.on("resize",function(){a.fullSize(),a.scrollPatch()})},d.init=function(e,i){i=i||{};var a=this,l=t(e?'table[lay-filter="'+e+'"]':u+"[lay-data]"),n="Table element property lay-data configuration item has a syntax error: ";return l.each(function(){var a=t(this),l=a.attr("lay-data");try{l=new Function("return "+l)()}catch(r){o.error(n+l)}var c=[],s=t.extend({elem:this,cols:[],data:[],skin:a.attr("lay-skin"),size:a.attr("lay-size"),even:"string"==typeof a.attr("lay-even")},d.config,i,l);e&&a.hide(),a.find("thead>tr").each(function(e){s.cols[e]=[],t(this).children().each(function(i){var a=t(this),l=a.attr("lay-data");try{l=new Function("return "+l)()}catch(r){return o.error(n+l)}var d=t.extend({title:a.text(),colspan:a.attr("colspan"),rowspan:a.attr("rowspan")},l);c.push(d),s.cols[e].push(d)})}),a.find("tbody>tr").each(function(e){var i=t(this),a={};i.children("td").each(function(e,i){var l=t(this),n=l.data("field");if(n)return a[n]=l.html()}),layui.each(c,function(e,t){var l=i.children("td").eq(e);a[t.field]=l.html()}),s.data[e]=a}),d.render(s)}),a},d.checkStatus=function(e){var t=0,i=[],a=d.cache[e];return a?(layui.each(a,function(e,a){a[d.config.checkName]&&(t++,i.push(d.clearCacheKey(a)))}),{data:i,isAll:t===a.length}):{}},c.config={},d.reload=function(e,i){var a=c.config[e];return a?d.render(t.extend({},a,i)):o.error("The ID option was not found in the table instance")},d.render=function(e){var t=new A(e);return c.call(t)},d.clearCacheKey=function(e){return e=t.extend({},e),delete e[d.config.checkName],delete e[d.config.indexName],e},d.init(),e(s,d)});