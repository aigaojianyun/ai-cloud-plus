(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-4ab76380"],{"26d0":function(e,t,n){"use strict";n("7e67")},"466d":function(e,t,n){"use strict";var l=n("c65b"),r=n("d784"),s=n("825a"),o=n("7234"),a=n("50c4"),i=n("577e"),c=n("1d80"),u=n("dc4a"),m=n("8aa5"),p=n("14c3");r("match",(function(e,t,n){return[function(t){var n=c(this),r=o(t)?void 0:u(t,e);return r?l(r,t,n):new RegExp(t)[e](i(n))},function(e){var l=s(this),r=i(e),o=n(t,l,r);if(o.done)return o.value;if(!l.global)return p(l,r);var c=l.unicode;l.lastIndex=0;var u,d=[],f=0;while(null!==(u=p(l,r))){var h=i(u[0]);d[f]=h,""===h&&(l.lastIndex=m(r,a(l.lastIndex),c)),f++}return 0===f?null:d}]}))},"7e67":function(e,t,n){},a6dc:function(e,t,n){"use strict";n.d(t,"d",(function(){return r})),n.d(t,"c",(function(){return s})),n.d(t,"f",(function(){return o})),n.d(t,"e",(function(){return a})),n.d(t,"a",(function(){return i})),n.d(t,"g",(function(){return c})),n.d(t,"b",(function(){return u}));var l=n("b775");function r(e){return Object(l["a"])({url:"/system/menu/list",method:"get",params:e})}function s(e){return Object(l["a"])({url:"/system/menu/"+e,method:"get"})}function o(){return Object(l["a"])({url:"/system/menu/treeselect",method:"get"})}function a(e){return Object(l["a"])({url:"/system/menu/roleMenuTreeselect/"+e,method:"get"})}function i(e){return Object(l["a"])({url:"/system/menu",method:"post",data:e})}function c(e){return Object(l["a"])({url:"/system/menu",method:"put",data:e})}function u(e){return Object(l["a"])({url:"/system/menu/"+e,method:"delete"})}},f794:function(e,t,n){"use strict";n.r(t);var l=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"app-container"},[n("el-form",{directives:[{name:"show",rawName:"v-show",value:e.showSearch,expression:"showSearch"}],ref:"queryForm",attrs:{inline:!0,model:e.queryParams,size:"small"}},[n("el-form-item",{attrs:{label:"菜单名称",prop:"menuName"}},[n("el-input",{attrs:{clearable:"",placeholder:"请输入菜单名称"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.handleQuery(t)}},model:{value:e.queryParams.menuName,callback:function(t){e.$set(e.queryParams,"menuName",t)},expression:"queryParams.menuName"}})],1),n("el-form-item",{attrs:{label:"状态",prop:"status"}},[n("el-select",{attrs:{clearable:"",placeholder:"菜单状态"},model:{value:e.queryParams.status,callback:function(t){e.$set(e.queryParams,"status",t)},expression:"queryParams.status"}},e._l(e.dict.type.sys_normal_disable,(function(e){return n("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1),n("el-form-item",[n("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:e.handleQuery}},[e._v("搜索")]),n("el-button",{attrs:{icon:"el-icon-refresh",size:"mini"},on:{click:e.resetQuery}},[e._v("重置")])],1)],1),n("el-row",{staticClass:"mb8",attrs:{gutter:10}},[n("el-col",{attrs:{span:1.5}},[n("el-button",{directives:[{name:"hasPermi",rawName:"v-hasPermi",value:["system:menu:add"],expression:"['system:menu:add']"}],attrs:{icon:"el-icon-plus",plain:"",size:"mini",type:"primary"},on:{click:e.handleAdd}},[e._v("新增 ")])],1),n("el-col",{attrs:{span:1.5}},[n("el-button",{attrs:{icon:"el-icon-sort",plain:"",size:"mini",type:"info"},on:{click:e.toggleExpandAll}},[e._v("展开/折叠 ")])],1),n("right-toolbar",{attrs:{showSearch:e.showSearch},on:{"update:showSearch":function(t){e.showSearch=t},"update:show-search":function(t){e.showSearch=t},queryTable:e.getList}})],1),e.refreshTable?n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],attrs:{data:e.menuList,"default-expand-all":e.isExpandAll,"tree-props":{children:"children",hasChildren:"hasChildren"},"row-key":"menuId"}},[n("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"菜单名称",prop:"menuName",width:"160"}}),n("el-table-column",{attrs:{align:"center",label:"图标",prop:"icon",width:"100"},scopedSlots:e._u([{key:"default",fn:function(e){return[n("svg-icon",{attrs:{"icon-class":e.row.icon}})]}}],null,!1,3094025326)}),n("el-table-column",{attrs:{label:"排序",prop:"orderNum",width:"60"}}),n("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"权限标识",prop:"perms"}}),n("el-table-column",{attrs:{"show-overflow-tooltip":!0,label:"组件路径",prop:"component"}}),n("el-table-column",{attrs:{label:"状态",prop:"status",width:"80"},scopedSlots:e._u([{key:"default",fn:function(t){return[n("dict-tag",{attrs:{options:e.dict.type.sys_normal_disable,value:t.row.status}})]}}],null,!1,2802338569)}),n("el-table-column",{attrs:{align:"center",label:"创建时间",prop:"createTime"},scopedSlots:e._u([{key:"default",fn:function(t){return[n("span",[e._v(e._s(e.parseTime(t.row.createTime)))])]}}],null,!1,3078210614)}),n("el-table-column",{attrs:{align:"center","class-name":"small-padding fixed-width",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[n("el-button",{directives:[{name:"hasPermi",rawName:"v-hasPermi",value:["system:menu:edit"],expression:"['system:menu:edit']"}],attrs:{icon:"el-icon-edit",size:"mini",type:"text"},on:{click:function(n){return e.handleUpdate(t.row)}}},[e._v("修改 ")]),n("el-button",{directives:[{name:"hasPermi",rawName:"v-hasPermi",value:["system:menu:add"],expression:"['system:menu:add']"}],attrs:{icon:"el-icon-plus",size:"mini",type:"text"},on:{click:function(n){return e.handleAdd(t.row)}}},[e._v("新增 ")]),n("el-button",{directives:[{name:"hasPermi",rawName:"v-hasPermi",value:["system:menu:remove"],expression:"['system:menu:remove']"}],attrs:{icon:"el-icon-delete",size:"mini",type:"text"},on:{click:function(n){return e.handleDelete(t.row)}}},[e._v("删除 ")])]}}],null,!1,3266793286)})],1):e._e(),n("el-dialog",{attrs:{title:e.title,visible:e.open,"append-to-body":"",width:"680px"},on:{"update:visible":function(t){e.open=t}}},[n("el-form",{ref:"form",attrs:{model:e.form,rules:e.rules,"label-width":"100px"}},[n("el-row",[n("el-col",{attrs:{span:24}},[n("el-form-item",{attrs:{label:"上级菜单",prop:"parentId"}},[n("treeselect",{attrs:{normalizer:e.normalizer,options:e.menuOptions,"show-count":!0,placeholder:"选择上级菜单"},model:{value:e.form.parentId,callback:function(t){e.$set(e.form,"parentId",t)},expression:"form.parentId"}})],1)],1),n("el-col",{attrs:{span:24}},[n("el-form-item",{attrs:{label:"菜单类型",prop:"menuType"}},[n("el-radio-group",{model:{value:e.form.menuType,callback:function(t){e.$set(e.form,"menuType",t)},expression:"form.menuType"}},[n("el-radio",{attrs:{label:"M"}},[e._v("目录")]),n("el-radio",{attrs:{label:"C"}},[e._v("菜单")]),n("el-radio",{attrs:{label:"F"}},[e._v("按钮")])],1)],1)],1),"F"!=e.form.menuType?n("el-col",{attrs:{span:24}},[n("el-form-item",{attrs:{label:"菜单图标",prop:"icon"}},[n("el-popover",{attrs:{placement:"bottom-start",trigger:"click",width:"460"},on:{show:function(t){return e.$refs["iconSelect"].reset()}}},[n("IconSelect",{ref:"iconSelect",on:{selected:e.selected}}),n("el-input",{attrs:{slot:"reference",placeholder:"点击选择图标",readonly:""},slot:"reference",model:{value:e.form.icon,callback:function(t){e.$set(e.form,"icon",t)},expression:"form.icon"}},[e.form.icon?n("svg-icon",{staticClass:"el-input__icon",staticStyle:{height:"32px",width:"16px"},attrs:{slot:"prefix","icon-class":e.form.icon},slot:"prefix"}):n("i",{staticClass:"el-icon-search el-input__icon",attrs:{slot:"prefix"},slot:"prefix"})],1)],1)],1)],1):e._e(),n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{label:"菜单名称",prop:"menuName"}},[n("el-input",{attrs:{placeholder:"请输入菜单名称"},model:{value:e.form.menuName,callback:function(t){e.$set(e.form,"menuName",t)},expression:"form.menuName"}})],1)],1),n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{label:"显示排序",prop:"orderNum"}},[n("el-input-number",{attrs:{min:0,"controls-position":"right"},model:{value:e.form.orderNum,callback:function(t){e.$set(e.form,"orderNum",t)},expression:"form.orderNum"}})],1)],1),"F"!=e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"isFrame"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"选择是外链则路由地址需要以`http(s)://`开头",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 是否外链 ")],1),n("el-radio-group",{model:{value:e.form.isFrame,callback:function(t){e.$set(e.form,"isFrame",t)},expression:"form.isFrame"}},[n("el-radio",{attrs:{label:"0"}},[e._v("是")]),n("el-radio",{attrs:{label:"1"}},[e._v("否")])],1)],1)],1):e._e(),"F"!=e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"path"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"访问的路由地址，如：`user`，如外网地址需内链访问则以`http(s)://`开头",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 路由地址 ")],1),n("el-input",{attrs:{placeholder:"请输入路由地址"},model:{value:e.form.path,callback:function(t){e.$set(e.form,"path",t)},expression:"form.path"}})],1)],1):e._e(),"C"==e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"component"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"访问的组件路径，如：`system/user/index`，默认在`views`目录下",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 组件路径 ")],1),n("el-input",{attrs:{placeholder:"请输入组件路径"},model:{value:e.form.component,callback:function(t){e.$set(e.form,"component",t)},expression:"form.component"}})],1)],1):e._e(),"M"!=e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"perms"}},[n("el-input",{attrs:{maxlength:"100",placeholder:"请输入权限标识"},model:{value:e.form.perms,callback:function(t){e.$set(e.form,"perms",t)},expression:"form.perms"}}),n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"控制器中定义的权限字符，如：@PreAuthorize(`@ss.hasPermi('system:user:list')`)",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 权限字符 ")],1)],1)],1):e._e(),"C"==e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"query"}},[n("el-input",{attrs:{maxlength:"255",placeholder:"请输入路由参数"},model:{value:e.form.query,callback:function(t){e.$set(e.form,"query",t)},expression:"form.query"}}),n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:'访问路由的默认传递参数，如：`{"id": 1, "name": "ry"}`',placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 路由参数 ")],1)],1)],1):e._e(),"C"==e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"isCache"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"选择是则会被`keep-alive`缓存，需要匹配组件的`name`和地址保持一致",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 是否缓存 ")],1),n("el-radio-group",{model:{value:e.form.isCache,callback:function(t){e.$set(e.form,"isCache",t)},expression:"form.isCache"}},[n("el-radio",{attrs:{label:"0"}},[e._v("缓存")]),n("el-radio",{attrs:{label:"1"}},[e._v("不缓存")])],1)],1)],1):e._e(),"F"!=e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"visible"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"选择隐藏则路由将不会出现在侧边栏，但仍然可以访问",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 显示状态 ")],1),n("el-radio-group",{model:{value:e.form.visible,callback:function(t){e.$set(e.form,"visible",t)},expression:"form.visible"}},e._l(e.dict.type.sys_show_hide,(function(t){return n("el-radio",{key:t.value,attrs:{label:t.value}},[e._v(e._s(t.label)+" ")])})),1)],1)],1):e._e(),"F"!=e.form.menuType?n("el-col",{attrs:{span:12}},[n("el-form-item",{attrs:{prop:"status"}},[n("span",{attrs:{slot:"label"},slot:"label"},[n("el-tooltip",{attrs:{content:"选择停用则路由将不会出现在侧边栏，也不能被访问",placement:"top"}},[n("i",{staticClass:"el-icon-question"})]),e._v(" 菜单状态 ")],1),n("el-radio-group",{model:{value:e.form.status,callback:function(t){e.$set(e.form,"status",t)},expression:"form.status"}},e._l(e.dict.type.sys_normal_disable,(function(t){return n("el-radio",{key:t.value,attrs:{label:t.value}},[e._v(e._s(t.label)+" ")])})),1)],1)],1):e._e()],1)],1),n("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{attrs:{type:"primary"},on:{click:e.submitForm}},[e._v("确 定")]),n("el-button",{on:{click:e.cancel}},[e._v("取 消")])],1)],1)],1)},r=[],s=(n("14d9"),n("a6dc")),o=n("ca17"),a=n.n(o),i=(n("542c"),function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"icon-body"},[n("el-input",{staticStyle:{position:"relative"},attrs:{clearable:"",placeholder:"请输入图标名称"},on:{clear:e.filterIcons},nativeOn:{input:function(t){return e.filterIcons(t)}},model:{value:e.name,callback:function(t){e.name=t},expression:"name"}},[n("i",{staticClass:"el-icon-search el-input__icon",attrs:{slot:"suffix"},slot:"suffix"})]),n("div",{staticClass:"icon-list"},e._l(e.iconList,(function(t,l){return n("div",{key:l,on:{click:function(n){return e.selectedIcon(t)}}},[n("svg-icon",{staticStyle:{height:"30px",width:"16px"},attrs:{"icon-class":t}}),n("span",[e._v(e._s(t))])],1)})),0)],1)}),c=[],u=(n("b0c0"),n("4de4"),n("d3b7"),n("caad"),n("2532"),n("ddb0"),n("d81d"),n("ac1f"),n("466d"),n("23f1")),m=function(e){return e.keys()},p=/\.\/(.*)\.svg/,d=m(u).map((function(e){return e.match(p)[1]})),f=d,h={name:"IconSelect",data:function(){return{name:"",iconList:f}},methods:{filterIcons:function(){var e=this;this.iconList=f,this.name&&(this.iconList=this.iconList.filter((function(t){return t.includes(e.name)})))},selectedIcon:function(e){this.$emit("selected",e),document.body.click()},reset:function(){this.name="",this.iconList=f}}},b=h,v=(n("26d0"),n("2877")),y=Object(v["a"])(b,i,c,!1,null,"1909c33e",null),_=y.exports,g={name:"Menu",dicts:["sys_show_hide","sys_normal_disable"],components:{Treeselect:a.a,IconSelect:_},data:function(){return{loading:!0,showSearch:!0,menuList:[],menuOptions:[],title:"",open:!1,isExpandAll:!1,refreshTable:!0,queryParams:{menuName:void 0,visible:void 0},form:{},rules:{menuName:[{required:!0,message:"菜单名称不能为空",trigger:"blur"}],orderNum:[{required:!0,message:"菜单顺序不能为空",trigger:"blur"}],path:[{required:!0,message:"路由地址不能为空",trigger:"blur"}]}}},created:function(){this.getList()},methods:{selected:function(e){this.form.icon=e},getList:function(){var e=this;this.loading=!0,Object(s["d"])(this.queryParams).then((function(t){e.menuList=e.handleTree(t.data,"menuId"),e.loading=!1}))},normalizer:function(e){return e.children&&!e.children.length&&delete e.children,{id:e.menuId,label:e.menuName,children:e.children}},getTreeselect:function(){var e=this;Object(s["d"])().then((function(t){e.menuOptions=[];var n={menuId:0,menuName:"主类目",children:[]};n.children=e.handleTree(t.data,"menuId"),e.menuOptions.push(n)}))},cancel:function(){this.open=!1,this.reset()},reset:function(){this.form={menuId:void 0,parentId:0,menuName:void 0,icon:void 0,menuType:"M",orderNum:void 0,isFrame:"1",isCache:"0",visible:"0",status:"0"},this.resetForm("form")},handleQuery:function(){this.getList()},resetQuery:function(){this.resetForm("queryForm"),this.handleQuery()},handleAdd:function(e){this.reset(),this.getTreeselect(),null!=e&&e.menuId?this.form.parentId=e.menuId:this.form.parentId=0,this.open=!0,this.title="添加菜单"},toggleExpandAll:function(){var e=this;this.refreshTable=!1,this.isExpandAll=!this.isExpandAll,this.$nextTick((function(){e.refreshTable=!0}))},handleUpdate:function(e){var t=this;this.reset(),this.getTreeselect(),Object(s["c"])(e.menuId).then((function(e){t.form=e.data,t.open=!0,t.title="修改菜单"}))},submitForm:function(){var e=this;this.$refs["form"].validate((function(t){t&&(void 0!=e.form.menuId?Object(s["g"])(e.form).then((function(t){e.$modal.msgSuccess("修改成功"),e.open=!1,e.getList()})):Object(s["a"])(e.form).then((function(t){e.$modal.msgSuccess("新增成功"),e.open=!1,e.getList()})))}))},handleDelete:function(e){var t=this;this.$modal.confirm('是否确认删除名称为"'+e.menuName+'"的数据项？').then((function(){return Object(s["b"])(e.menuId)})).then((function(){t.getList(),t.$modal.msgSuccess("删除成功")})).catch((function(){}))}}},x=g,w=Object(v["a"])(x,l,r,!1,null,null,null);t["default"]=w.exports}}]);