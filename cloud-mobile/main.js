import App from './App'
import Vue from 'vue'

Vue.config.productionTip = false
App.mpType = 'app'

// 全局 uView 框架
import uView from 'uni_modules/uview-ui'
Vue.use(uView)

// 全局操作提醒封装
import plugins from './plugins' // plugins
Vue.use(plugins)

// 全局存储 vuex 的封装
import store from './store' // store
Vue.prototype.$store = store

const app = new Vue({
    ...App
})

app.$mount()
