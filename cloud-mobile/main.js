import App from './App'
import Vue from 'vue'
// 全局 uView 框架
import uView from 'uni_modules/uview-ui'
// 全局操作提醒封装
import plugins from './plugins' // plugins
// 全局存储 vuex 的封装
import store from './store' // store
// 全局 VueI18n
import VueI18n from 'vue-i18n'
import English from "./base/language/en-US.js"
import Chinese from "./base/language/zh-CN.js"

Vue.config.productionTip = false
App.mpType = 'app'

Vue.use(uView)

Vue.use(plugins)

Vue.prototype.store = store;

// VueI18n
Vue.use(VueI18n)

// 注意这里
// locale 是本地存储的正使用的语言
// messages 是自定义的语言包
const i18n = new VueI18n({
    // 如果缓存中有语言设置就选择缓存中的，否则就设置默认语言zh_CN
    locale: uni.getStorageSync('language') ? uni.getStorageSync('language') : 'zh_CN',
    //必须是messages
    messages: {
        'en-US': English,
        'zh-CN': Chinese
    }
})
// 挂载到全局方法中 方便调用里面的locale
Vue.prototype._i18n = i18n;

const app = new Vue({
    i18n,
    store,
    ...App
})

app.$mount()
