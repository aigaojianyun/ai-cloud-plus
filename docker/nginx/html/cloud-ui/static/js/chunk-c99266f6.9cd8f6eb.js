(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c99266f6"],{1:function(e,t){},"179d":function(e,t,i){"use strict";i("ada8")},"6d63":function(e,t,i){},"951a":function(e,t,i){e.exports=i.p+"static/img/default.6b914f9c.jpg"},a172:function(e,t,i){"use strict";i("6d63")},ada8:function(e,t,i){},dd7b:function(e,t,i){"use strict";i.r(t);var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"login"},[i("el-form",{ref:"loginForm",staticClass:"login-form",attrs:{model:e.loginForm,rules:e.loginRules}},[i("h3",{staticClass:"title"},[e._v("ai管理系统")]),i("el-form-item",{attrs:{prop:"username"}},[i("el-input",{attrs:{"auto-complete":"off",placeholder:"账号",type:"text"},model:{value:e.loginForm.username,callback:function(t){e.$set(e.loginForm,"username",t)},expression:"loginForm.username"}},[i("svg-icon",{staticClass:"el-input__icon input-icon",attrs:{slot:"prefix","icon-class":"user"},slot:"prefix"})],1)],1),i("el-form-item",{attrs:{prop:"password"}},[i("el-input",{attrs:{"auto-complete":"off",placeholder:"密码",type:"password"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.handleLogin(t)}},model:{value:e.loginForm.password,callback:function(t){e.$set(e.loginForm,"password",t)},expression:"loginForm.password"}},[i("svg-icon",{staticClass:"el-input__icon input-icon",attrs:{slot:"prefix","icon-class":"password"},slot:"prefix"})],1)],1),i("Verify",{ref:"verify",attrs:{captchaType:"blockPuzzle",imgSize:{width:"330px",height:"155px"},mode:"pop"},on:{success:e.capctchaCheckSuccess}}),i("el-checkbox",{staticStyle:{margin:"0px 0px 25px 0px"},model:{value:e.loginForm.rememberMe,callback:function(t){e.$set(e.loginForm,"rememberMe",t)},expression:"loginForm.rememberMe"}},[e._v("记住密码")]),i("el-form-item",{staticStyle:{width:"100%"}},[i("el-button",{staticStyle:{width:"100%"},attrs:{loading:e.loading,size:"medium",type:"primary"},nativeOn:{click:function(t){return t.preventDefault(),e.handleLogin(t)}}},[e.loading?i("span",[e._v("登 录 中...")]):i("span",[e._v("登 录")])]),e.register?i("div",{staticStyle:{float:"right"}},[i("router-link",{staticClass:"link-type",attrs:{to:"/register"}},[e._v("立即注册")])],1):e._e()],1)],1),e._m(0)],1)},o=[function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"el-login-footer"},[i("span",[e._v("Copyright © 2018-2021 ai-cloud All Rights Reserved.")])])}],r=(i("14d9"),i("852e")),n=i.n(r),a=i("21f2"),c=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{directives:[{name:"show",rawName:"v-show",value:e.showBox,expression:"showBox"}],class:"pop"==e.mode?"mask":""},[i("div",{class:"pop"==e.mode?"verifybox":"",style:{"max-width":parseInt(e.imgSize.width)+30+"px"}},["pop"==e.mode?i("div",{staticClass:"verifybox-top"},[e._v(" 请完成安全验证 "),i("span",{staticClass:"verifybox-close",on:{click:e.closeBox}},[i("i",{staticClass:"iconfont icon-close"})])]):e._e(),i("div",{staticClass:"verifybox-bottom",style:{padding:"pop"==e.mode?"15px":"0"}},[e.componentType?i(e.componentType,{ref:"instance",tag:"components",attrs:{arith:e.arith,barSize:e.barSize,blockSize:e.blockSize,captchaType:e.captchaType,defaultImg:e.defaultImg,explain:e.explain,figure:e.figure,imgSize:e.imgSize,mode:e.mode,type:e.verifyType,vSpace:e.vSpace}}):e._e()],1)])])},h=[],l=(i("a9e3"),i("a15b"),i("d3b7"),i("25f0"),function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticStyle:{position:"relative"}},["2"===e.type?i("div",{staticClass:"verify-img-out",style:{height:parseInt(e.setSize.imgHeight)+e.vSpace+"px"}},[i("div",{staticClass:"verify-img-panel",style:{width:e.setSize.imgWidth,height:e.setSize.imgHeight}},[i("img",{staticStyle:{width:"100%",height:"100%",display:"block"},attrs:{src:e.backImgBase?"data:image/png;base64,"+e.backImgBase:e.defaultImg,alt:""}}),i("div",{directives:[{name:"show",rawName:"v-show",value:e.showRefresh,expression:"showRefresh"}],staticClass:"verify-refresh",on:{click:e.refresh}},[i("i",{staticClass:"iconfont icon-refresh"})]),i("transition",{attrs:{name:"tips"}},[e.tipWords?i("span",{staticClass:"verify-tips",class:e.passFlag?"suc-bg":"err-bg"},[e._v(e._s(e.tipWords))]):e._e()])],1)]):e._e(),i("div",{staticClass:"verify-bar-area",style:{width:e.setSize.imgWidth,height:e.barSize.height,"line-height":e.barSize.height}},[i("span",{staticClass:"verify-msg",domProps:{textContent:e._s(e.text)}}),i("div",{staticClass:"verify-left-bar",style:{width:void 0!==e.leftBarWidth?e.leftBarWidth:e.barSize.height,height:e.barSize.height,"border-color":e.leftBarBorderColor,transaction:e.transitionWidth}},[i("span",{staticClass:"verify-msg",domProps:{textContent:e._s(e.finishText)}}),i("div",{staticClass:"verify-move-block",style:{width:e.barSize.height,height:e.barSize.height,"background-color":e.moveBlockBackgroundColor,left:e.moveBlockLeft,transition:e.transitionLeft},on:{mousedown:e.start,touchstart:e.start}},[i("i",{class:["verify-icon iconfont",e.iconClass],style:{color:e.iconColor}}),"2"===e.type?i("div",{staticClass:"verify-sub-block",style:{width:Math.floor(47*parseInt(e.setSize.imgWidth)/310)+"px",height:e.setSize.imgHeight,top:"-"+(parseInt(e.setSize.imgHeight)+e.vSpace)+"px","background-size":e.setSize.imgWidth+" "+e.setSize.imgHeight}},[i("img",{staticStyle:{width:"100%",height:"100%",display:"block"},attrs:{src:"data:image/png;base64,"+e.blockBackImgBase,alt:""}})]):e._e()])])])])}),d=[],p=(i("ac1f"),i("5319"),i("e9c4"),i("b680"),i("3452")),f=i.n(p);function u(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"XwKsGlMcdPMEhR1B",i=f.a.enc.Utf8.parse(t),s=f.a.enc.Utf8.parse(e),o=f.a.AES.encrypt(s,i,{mode:f.a.mode.ECB,padding:f.a.pad.Pkcs7});return o.toString()}function m(e){var t,i,s,o,r=e.$el.parentNode.offsetWidth||window.offsetWidth,n=e.$el.parentNode.offsetHeight||window.offsetHeight;return t=-1!=e.imgSize.width.indexOf("%")?parseInt(this.imgSize.width)/100*r+"px":this.imgSize.width,i=-1!=e.imgSize.height.indexOf("%")?parseInt(this.imgSize.height)/100*n+"px":this.imgSize.height,s=-1!=e.barSize.width.indexOf("%")?parseInt(this.barSize.width)/100*r+"px":this.barSize.width,o=-1!=e.barSize.height.indexOf("%")?parseInt(this.barSize.height)/100*n+"px":this.barSize.height,{imgWidth:t,imgHeight:i,barWidth:s,barHeight:o}}var g=i("b775");function v(e){return Object(g["a"])({url:"/auth/captcha/get",method:"post",data:e})}function y(e){return Object(g["a"])({url:"/auth/captcha/check",method:"post",data:e})}var b={name:"VerifySlide",props:{captchaType:{type:String},type:{type:String,default:"1"},mode:{type:String,default:"fixed"},vSpace:{type:Number,default:5},explain:{type:String,default:"向右滑动完成验证"},imgSize:{type:Object,default:function(){return{width:"310px",height:"155px"}}},blockSize:{type:Object,default:function(){return{width:"50px",height:"50px"}}},barSize:{type:Object,default:function(){return{width:"310px",height:"40px"}}},defaultImg:{type:String,default:""}},data:function(){return{secretKey:"",passFlag:"",backImgBase:"",blockBackImgBase:"",backToken:"",startMoveTime:"",endMovetime:"",tipsBackColor:"",tipWords:"",text:"",finishText:"",setSize:{imgHeight:0,imgWidth:0,barHeight:0,barWidth:0},top:0,left:0,moveBlockLeft:void 0,leftBarWidth:void 0,moveBlockBackgroundColor:void 0,leftBarBorderColor:"#ddd",iconColor:void 0,iconClass:"icon-right",status:!1,isEnd:!1,showRefresh:!0,transitionLeft:"",transitionWidth:""}},computed:{barArea:function(){return this.$el.querySelector(".verify-bar-area")},resetSize:function(){return m}},methods:{init:function(){var e=this;this.text=this.explain,this.getPictrue(),this.$nextTick((function(){var t=e.resetSize(e);for(var i in t)e.$set(e.setSize,i,t[i]);e.$parent.$emit("ready",e)}));var t=this;window.removeEventListener("touchmove",(function(e){t.move(e)})),window.removeEventListener("mousemove",(function(e){t.move(e)})),window.removeEventListener("touchend",(function(){t.end()})),window.removeEventListener("mouseup",(function(){t.end()})),window.addEventListener("touchmove",(function(e){t.move(e)})),window.addEventListener("mousemove",(function(e){t.move(e)})),window.addEventListener("touchend",(function(){t.end()})),window.addEventListener("mouseup",(function(){t.end()}))},start:function(e){if(e=e||window.event,e.touches)t=e.touches[0].pageX;else var t=e.clientX;this.startLeft=Math.floor(t-this.barArea.getBoundingClientRect().left),this.startMoveTime=+new Date,0==this.isEnd&&(this.text="",this.moveBlockBackgroundColor="#337ab7",this.leftBarBorderColor="#337AB7",this.iconColor="#fff",e.stopPropagation(),this.status=!0)},move:function(e){if(e=e||window.event,this.status&&0==this.isEnd){if(e.touches)t=e.touches[0].pageX;else var t=e.clientX;var i=this.barArea.getBoundingClientRect().left,s=t-i;s>=this.barArea.offsetWidth-parseInt(parseInt(this.blockSize.width)/2)-2&&(s=this.barArea.offsetWidth-parseInt(parseInt(this.blockSize.width)/2)-2),s<=0&&(s=parseInt(parseInt(this.blockSize.width)/2)),this.moveBlockLeft=s-this.startLeft+"px",this.leftBarWidth=s-this.startLeft+"px"}},end:function(){var e=this;this.endMovetime=+new Date;var t=this;if(this.status&&0==this.isEnd){var i=parseInt((this.moveBlockLeft||"").replace("px",""));i=310*i/parseInt(this.setSize.imgWidth);var s={captchaType:this.captchaType,pointJson:this.secretKey?u(JSON.stringify({x:i,y:5}),this.secretKey):JSON.stringify({x:i,y:5}),token:this.backToken};y(s).then((function(s){if("0000"==s.repCode){e.moveBlockBackgroundColor="#5cb85c",e.leftBarBorderColor="#5cb85c",e.iconColor="#fff",e.iconClass="icon-check",e.showRefresh=!1,e.isEnd=!0,e.passFlag=!0,e.tipWords="".concat(((e.endMovetime-e.startMoveTime)/1e3).toFixed(2),"s验证成功");var o=e.secretKey?u(e.backToken+"---"+JSON.stringify({x:i,y:5}),e.secretKey):e.backToken+"---"+JSON.stringify({x:i,y:5});setTimeout((function(){e.tipWords="",e.$parent.closeBox(),e.$parent.$emit("success",{captchaVerification:o})}),1e3)}else e.moveBlockBackgroundColor="#d9534f",e.leftBarBorderColor="#d9534f",e.iconColor="#fff",e.iconClass="icon-close",e.passFlag=!1,setTimeout((function(){t.refresh()}),1e3),e.$parent.$emit("error",e),e.tipWords="验证失败",setTimeout((function(){e.tipWords=""}),1e3)})),this.status=!1}},refresh:function(){var e=this;this.showRefresh=!0,this.finishText="",this.transitionLeft="left .3s",this.moveBlockLeft=0,this.leftBarWidth=void 0,this.transitionWidth="width .3s",this.leftBarBorderColor="#ddd",this.moveBlockBackgroundColor="#fff",this.iconColor="#000",this.iconClass="icon-right",this.isEnd=!1,this.getPictrue(),setTimeout((function(){e.transitionWidth="",e.transitionLeft="",e.text=e.explain}),300)},getPictrue:function(){var e=this,t={captchaType:this.captchaType,clientUid:localStorage.getItem("slider"),ts:Date.now()};v(t).then((function(t){"0000"==t.repCode?(e.backImgBase=t.repData.originalImageBase64,e.blockBackImgBase=t.repData.jigsawImageBase64,e.backToken=t.repData.token,e.secretKey=t.repData.secretKey):e.tipWords=t.repMsg,"6201"==t.repCode&&(e.backImgBase=null,e.blockBackImgBase=null)}))}},watch:{type:{immediate:!0,handler:function(){this.init()}}},mounted:function(){this.$el.onselectstart=function(){return!1}}},k=b,S=i("2877"),w=Object(S["a"])(k,l,d,!1,null,null,null),x=w.exports,C=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticStyle:{position:"relative"}},[i("div",{staticClass:"verify-img-out"},[i("div",{staticClass:"verify-img-panel",style:{width:e.setSize.imgWidth,height:e.setSize.imgHeight,"background-size":e.setSize.imgWidth+" "+e.setSize.imgHeight,"margin-bottom":e.vSpace+"px"}},[i("div",{directives:[{name:"show",rawName:"v-show",value:e.showRefresh,expression:"showRefresh"}],staticClass:"verify-refresh",staticStyle:{"z-index":"3"},on:{click:e.refresh}},[i("i",{staticClass:"iconfont icon-refresh"})]),i("img",{ref:"canvas",staticStyle:{width:"100%",height:"100%",display:"block"},attrs:{src:e.pointBackImgBase?"data:image/png;base64,"+e.pointBackImgBase:e.defaultImg,alt:""},on:{click:function(t){e.bindingClick&&e.canvasClick(t)}}}),e._l(e.tempPoints,(function(t,s){return i("div",{key:s,staticClass:"point-area",style:{"background-color":"#1abd6c",color:"#fff","z-index":9999,width:"20px",height:"20px","text-align":"center","line-height":"20px","border-radius":"50%",position:"absolute",top:parseInt(t.y-10)+"px",left:parseInt(t.x-10)+"px"}},[e._v(" "+e._s(s+1)+" ")])}))],2)]),i("div",{staticClass:"verify-bar-area",style:{width:e.setSize.imgWidth,color:this.barAreaColor,"border-color":this.barAreaBorderColor,"line-height":this.barSize.height}},[i("span",{staticClass:"verify-msg"},[e._v(e._s(e.text))])])])},B=[],z=(i("a434"),i("d81d"),{name:"VerifyPoints",props:{mode:{type:String,default:"fixed"},captchaType:{type:String},vSpace:{type:Number,default:5},imgSize:{type:Object,default:function(){return{width:"310px",height:"155px"}}},barSize:{type:Object,default:function(){return{width:"310px",height:"40px"}}},defaultImg:{type:String,default:""}},data:function(){return{secretKey:"",checkNum:3,fontPos:[],checkPosArr:[],num:1,pointBackImgBase:"",poinTextList:[],backToken:"",setSize:{imgHeight:0,imgWidth:0,barHeight:0,barWidth:0},tempPoints:[],text:"",barAreaColor:void 0,barAreaBorderColor:void 0,showRefresh:!0,bindingClick:!0}},computed:{resetSize:function(){return m}},methods:{init:function(){var e=this;this.fontPos.splice(0,this.fontPos.length),this.checkPosArr.splice(0,this.checkPosArr.length),this.num=1,this.getPictrue(),this.$nextTick((function(){e.setSize=e.resetSize(e),e.$parent.$emit("ready",e)}))},canvasClick:function(e){var t=this;this.checkPosArr.push(this.getMousePos(this.$refs.canvas,e)),this.num==this.checkNum&&(this.num=this.createPoint(this.getMousePos(this.$refs.canvas,e)),this.checkPosArr=this.pointTransfrom(this.checkPosArr,this.setSize),setTimeout((function(){var e=t.secretKey?u(t.backToken+"---"+JSON.stringify(t.checkPosArr),t.secretKey):t.backToken+"---"+JSON.stringify(t.checkPosArr),i={captchaType:t.captchaType,pointJson:t.secretKey?u(JSON.stringify(t.checkPosArr),t.secretKey):JSON.stringify(t.checkPosArr),token:t.backToken};y(i).then((function(i){"0000"==i.repCode?(t.barAreaColor="#4cae4c",t.barAreaBorderColor="#5cb85c",t.text="验证成功",t.bindingClick=!1,"pop"==t.mode&&setTimeout((function(){t.$parent.clickShow=!1,t.refresh()}),1500),t.$parent.$emit("success",{captchaVerification:e})):(t.$parent.$emit("error",t),t.barAreaColor="#d9534f",t.barAreaBorderColor="#d9534f",t.text="验证失败",setTimeout((function(){t.refresh()}),700))}))}),400)),this.num<this.checkNum&&(this.num=this.createPoint(this.getMousePos(this.$refs.canvas,e)))},getMousePos:function(e,t){var i=t.offsetX,s=t.offsetY;return{x:i,y:s}},createPoint:function(e){return this.tempPoints.push(Object.assign({},e)),++this.num},refresh:function(){this.tempPoints.splice(0,this.tempPoints.length),this.barAreaColor="#000",this.barAreaBorderColor="#ddd",this.bindingClick=!0,this.fontPos.splice(0,this.fontPos.length),this.checkPosArr.splice(0,this.checkPosArr.length),this.num=1,this.getPictrue(),this.text="验证失败",this.showRefresh=!0},getPictrue:function(){var e=this,t={captchaType:this.captchaType,clientUid:localStorage.getItem("point"),ts:Date.now()};v(t).then((function(t){"0000"==t.repCode?(e.pointBackImgBase=t.repData.originalImageBase64,e.backToken=t.repData.token,e.secretKey=t.repData.secretKey,e.poinTextList=t.repData.wordList,e.text="请依次点击【"+e.poinTextList.join(",")+"】"):e.text=t.repMsg,"6201"==t.repCode&&(e.pointBackImgBase=null)}))},pointTransfrom:function(e,t){var i=e.map((function(e){var i=Math.round(310*e.x/parseInt(t.imgWidth)),s=Math.round(155*e.y/parseInt(t.imgHeight));return{x:i,y:s}}));return i}},watch:{type:{immediate:!0,handler:function(){this.init()}}},mounted:function(){this.$el.onselectstart=function(){return!1}}}),T=z,I=Object(S["a"])(T,C,B,!1,null,null,null),P=I.exports,$={name:"Vue2Verify",props:{locale:{require:!1,type:String,default:function(){if(navigator.language)var e=navigator.language;else e=navigator.browserLanguage;return e}},captchaType:{type:String,required:!0},figure:{type:Number},arith:{type:Number},mode:{type:String,default:"pop"},vSpace:{type:Number},explain:{type:String},imgSize:{type:Object,default:function(){return{width:"310px",height:"155px"}}},blockSize:{type:Object},barSize:{type:Object}},data:function(){return{clickShow:!1,verifyType:void 0,componentType:void 0,defaultImg:i("951a")}},mounted:function(){this.uuid()},methods:{uuid:function(){for(var e=[],t="0123456789abcdef",i=0;i<36;i++)e[i]=t.substr(Math.floor(16*Math.random()),1);e[14]="4",e[19]=t.substr(3&e[19]|8,1),e[8]=e[13]=e[18]=e[23]="-";var s="slider-"+e.join(""),o="point-"+e.join("");localStorage.getItem("slider")||localStorage.setItem("slider",s),localStorage.getItem("point")||localStorage.setItem("point",o)},i18n:function(e){if(this.$t)return this.$t(e);var t=this.$options.i18n.messages[this.locale]||this.$options.i18n.messages["en-US"];return t[e]},refresh:function(){this.instance.refresh&&this.instance.refresh()},closeBox:function(){this.clickShow=!1,this.refresh()},show:function(){"pop"==this.mode&&(this.clickShow=!0)}},computed:{instance:function(){return this.$refs.instance||{}},showBox:function(){return"pop"!=this.mode||this.clickShow}},watch:{captchaType:{immediate:!0,handler:function(e){switch(e.toString()){case"blockPuzzle":this.verifyType="2",this.componentType="VerifySlide";break;case"clickWord":this.verifyType="",this.componentType="VerifyPoints";break}}}},components:{VerifySlide:x,VerifyPoints:P}},_=$,W=(i("179d"),Object(S["a"])(_,c,h,!1,null,null,null)),O=W.exports,A={components:{Verify:O},name:"Login",data:function(){return{loginForm:{username:"ceshi",password:"123456",rememberMe:!1,code:""},loginRules:{username:[{required:!0,trigger:"blur",message:"请输入您的账号"}],password:[{required:!0,trigger:"blur",message:"请输入您的密码"}]},loading:!1,register:!1,redirect:void 0}},watch:{$route:{handler:function(e){this.redirect=e.query&&e.query.redirect},immediate:!0}},created:function(){this.getCookie()},methods:{getCookie:function(){var e=n.a.get("username"),t=n.a.get("password"),i=n.a.get("rememberMe");this.loginForm={username:void 0===e?this.loginForm.username:e,password:void 0===t?this.loginForm.password:Object(a["a"])(t),rememberMe:void 0!==i&&Boolean(i)}},capctchaCheckSuccess:function(e){var t=this;this.loginForm.code=e.captchaVerification,this.loading=!0,this.loginForm.rememberMe?(n.a.set("username",this.loginForm.username,{expires:30}),n.a.set("password",Object(a["b"])(this.loginForm.password),{expires:30}),n.a.set("rememberMe",this.loginForm.rememberMe,{expires:30})):(n.a.remove("username"),n.a.remove("password"),n.a.remove("rememberMe")),this.$store.dispatch("Login",this.loginForm).then((function(){t.$router.push({path:t.redirect||"/"}).catch((function(){}))})).catch((function(){t.loading=!1}))},handleLogin:function(){var e=this;this.$refs.loginForm.validate((function(t){t&&e.$refs.verify.show()}))}}},L=A,M=(i("a172"),Object(S["a"])(L,s,o,!1,null,null,null));t["default"]=M.exports}}]);