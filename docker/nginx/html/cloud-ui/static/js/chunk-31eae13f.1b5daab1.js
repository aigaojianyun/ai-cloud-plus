(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-31eae13f"],{4923:function(e,t,n){"use strict";n.r(t);n("d81d"),n("d9e2");var a=n("b76a"),r=n.n(a),i=n("a85b"),o={itemBtns:function(e,t,n,a){var r=this.$listeners,i=r.copyItem,o=r.deleteItem;return[e("span",{class:"drawing-item-copy",attrs:{title:"复制"},on:{click:function(e){i(t,a),e.stopPropagation()}}},[e("i",{class:"el-icon-copy-document"})]),e("span",{class:"drawing-item-delete",attrs:{title:"删除"},on:{click:function(e){o(n,a),e.stopPropagation()}}},[e("i",{class:"el-icon-delete"})])]}},s={colFormItem:function(e,t,n,a){var r=this,s=this.$listeners.activeItem,l=this.activeId===t.formId?"drawing-item active-from-item":"drawing-item";return this.formConf.unFocusedComponentBorder&&(l+=" unfocus-bordered"),e("el-col",{attrs:{span:t.span},class:l,nativeOn:{click:function(e){s(t),e.stopPropagation()}}},[e("el-form-item",{attrs:{"label-width":t.labelWidth?"".concat(t.labelWidth,"px"):null,label:t.label,required:t.required}},[e(i["a"],{key:t.renderKey,attrs:{conf:t},on:{input:function(e){r.$set(t,"defaultValue",e)}}})]),o.itemBtns.apply(this,arguments)])},rowFormItem:function(e,t,n,a){var i=this.$listeners.activeItem,s=this.activeId===t.formId?"drawing-row-item active-from-item":"drawing-row-item",c=l.apply(this,arguments);return"flex"===t.type&&(c=e("el-row",{attrs:{type:t.type,justify:t.justify,align:t.align}},[c])),e("el-col",{attrs:{span:t.span}},[e("el-row",{attrs:{gutter:t.gutter},class:s,nativeOn:{click:function(e){i(t),e.stopPropagation()}}},[e("span",{class:"component-name"},[t.componentName]),e(r.a,{attrs:{list:t.children,animation:340,group:"componentsGroup"},class:"drag-wrapper"},[c]),o.itemBtns.apply(this,arguments)])])}};function l(e,t,n,a){var r=this;return Array.isArray(t.children)?t.children.map((function(n,a){var i=s[n.layout];return i?i.call(r,e,n,a,t.children):c()})):null}function c(){throw new Error("没有与".concat(this.element.layout,"匹配的layout"))}var p,u,d={components:{render:i["a"],draggable:r.a},props:["element","index","drawingList","activeId","formConf"],render:function(e){var t=s[this.element.layout];return t?t.call(this,e,this.element,this.index,this.drawingList):c()}},f=d,m=n("2877"),h=Object(m["a"])(f,p,u,!1,null,null,null);t["default"]=h.exports},a85b:function(e,t,n){"use strict";n("d3b7"),n("159b"),n("14d9"),n("e9c4"),n("b64b");var a=n("ed08"),r=Object(a["e"])("accept,accept-charset,accesskey,action,align,alt,async,autocomplete,autofocus,autoplay,autosave,bgcolor,border,buffered,challenge,charset,checked,cite,class,code,codebase,color,cols,colspan,content,http-equiv,name,contenteditable,contextmenu,controls,coords,data,datetime,default,defer,dir,dirname,disabled,download,draggable,dropzone,enctype,method,for,form,formaction,headers,height,hidden,high,href,hreflang,http-equiv,icon,id,ismap,itemprop,keytype,kind,label,lang,language,list,loop,low,manifest,max,maxlength,media,method,GET,POST,min,multiple,email,file,muted,name,novalidate,open,optimum,pattern,ping,placeholder,poster,preload,radiogroup,readonly,rel,required,reversed,rows,rowspan,sandbox,scope,scoped,seamless,selected,shape,size,type,text,password,sizes,span,spellcheck,src,srcdoc,srclang,srcset,start,step,style,summary,tabindex,target,title,type,usemap,value,width,wrap");function i(e,t,n){t.props.value=n,t.on.input=function(t){e.$emit("input",t)}}var o={"el-button":{default:function(e,t,n){return t[n]}},"el-input":{prepend:function(e,t,n){return e("template",{slot:"prepend"},[t[n]])},append:function(e,t,n){return e("template",{slot:"append"},[t[n]])}},"el-select":{options:function(e,t,n){var a=[];return t.options.forEach((function(t){a.push(e("el-option",{attrs:{label:t.label,value:t.value,disabled:t.disabled}}))})),a}},"el-radio-group":{options:function(e,t,n){var a=[];return t.options.forEach((function(n){"button"===t.optionType?a.push(e("el-radio-button",{attrs:{label:n.value}},[n.label])):a.push(e("el-radio",{attrs:{label:n.value,border:t.border}},[n.label]))})),a}},"el-checkbox-group":{options:function(e,t,n){var a=[];return t.options.forEach((function(n){"button"===t.optionType?a.push(e("el-checkbox-button",{attrs:{label:n.value}},[n.label])):a.push(e("el-checkbox",{attrs:{label:n.value,border:t.border}},[n.label]))})),a}},"el-upload":{"list-type":function(e,t,n){var a=[];return"picture-card"===t["list-type"]?a.push(e("i",{class:"el-icon-plus"})):a.push(e("el-button",{attrs:{size:"small",type:"primary",icon:"el-icon-upload"}},[t.buttonText])),t.showTip&&a.push(e("div",{slot:"tip",class:"el-upload__tip"},["只能上传不超过 ",t.fileSize,t.sizeUnit," 的",t.accept,"文件"])),a}}};t["a"]={render:function(e){var t=this,n={attrs:{},props:{},on:{},style:{}},a=JSON.parse(JSON.stringify(this.conf)),s=[],l=o[a.tag];return l&&Object.keys(l).forEach((function(t){var n=l[t];a[t]&&s.push(n(e,a,t))})),Object.keys(a).forEach((function(e){var o=a[e];"vModel"===e?i(t,n,a.defaultValue):n[e]?n[e]=o:r(e)?n.attrs[e]=o:n.props[e]=o})),e(this.conf.tag,n,s)},props:["conf"]}},ed08:function(e,t,n){"use strict";n.d(t,"b",(function(){return a})),n.d(t,"e",(function(){return r})),n.d(t,"c",(function(){return i})),n.d(t,"a",(function(){return o})),n.d(t,"f",(function(){return s})),n.d(t,"d",(function(){return l}));n("53ca"),n("ac1f"),n("5319"),n("14d9"),n("a15b"),n("d81d"),n("b64b"),n("d3b7"),n("159b"),n("fb6a"),n("d9e2"),n("a630"),n("3ca3"),n("6062"),n("ddb0"),n("25f0"),n("466d"),n("4d63"),n("c607"),n("2c3e"),n("00b4"),n("0249");function a(e,t,n){var a,r,i,o,s,l=function l(){var c=+new Date-o;c<t&&c>0?a=setTimeout(l,t-c):(a=null,n||(s=e.apply(i,r),a||(i=r=null)))};return function(){for(var r=arguments.length,c=new Array(r),p=0;p<r;p++)c[p]=arguments[p];i=this,o=+new Date;var u=n&&!a;return a||(a=setTimeout(l,t)),u&&(s=e.apply(i,c),i=c=null),s}}function r(e,t){for(var n=Object.create(null),a=e.split(","),r=0;r<a.length;r++)n[a[r]]=!0;return t?function(e){return n[e.toLowerCase()]}:function(e){return n[e]}}var i="export default ",o={html:{indent_size:"2",indent_char:" ",max_preserve_newlines:"-1",preserve_newlines:!1,keep_array_indentation:!1,break_chained_methods:!1,indent_scripts:"separate",brace_style:"end-expand",space_before_conditional:!0,unescape_strings:!1,jslint_happy:!1,end_with_newline:!0,wrap_line_length:"110",indent_inner_html:!0,comma_first:!1,e4x:!0,indent_empty_lines:!0},js:{indent_size:"2",indent_char:" ",max_preserve_newlines:"-1",preserve_newlines:!1,keep_array_indentation:!1,break_chained_methods:!1,indent_scripts:"normal",brace_style:"end-expand",space_before_conditional:!0,unescape_strings:!1,jslint_happy:!0,end_with_newline:!0,wrap_line_length:"110",indent_inner_html:!0,comma_first:!1,e4x:!0,indent_empty_lines:!0}};function s(e){return e.replace(/( |^)[a-z]/g,(function(e){return e.toUpperCase()}))}function l(e){return/^[+-]?(0|([1-9]\d*))(\.\d+)?$/g.test(e)}}}]);