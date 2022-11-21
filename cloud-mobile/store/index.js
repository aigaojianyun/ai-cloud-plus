import Vue from 'vue'
import Vuex from 'vuex'
import system from '@/store/modules/system'
import user from '@/store/modules/user'
import getters from './getters'

Vue.use(Vuex)

const store = new Vuex.Store({
    modules: {
        system,
        user
    },
    getters
})

export default store
