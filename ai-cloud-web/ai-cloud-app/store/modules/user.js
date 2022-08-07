import config from '@/config'
import storage from '@/utils/storage'
import constant from '@/utils/constant'
import {getInfo, login, logout} from '@/api/login'
import {getToken, removeToken, setToken} from '@/utils/auth'

const baseUrl = config.baseUrl

const user = {
    state: {
        token: getToken(),
        name: storage.get(constant.name),
        avatar: storage.get(constant.avatar)
    },

    mutations: {
        SET_TOKEN: (state, token) => {
            state.token = token
        },
        SET_NAME: (state, name) => {
            state.name = name
            storage.set(constant.name, name)
        },
        SET_AVATAR: (state, avatar) => {
            state.avatar = avatar
            storage.set(constant.avatar, avatar)
        }
    },

    actions: {
        // 登录
        Login({commit}, userInfo) {
            const username = userInfo.username.trim()
            const password = userInfo.password
            const deviceId = userInfo.deviceId
            return new Promise((resolve, reject) => {
                login(username, password, deviceId).then(res => {
                    setToken(res.data.access_token)
                    commit('SET_TOKEN', res.data.access_token)
                    resolve()
                }).catch(error => {
                    reject(error)
                })
            })
        },

        // 获取用户信息
        GetInfo({commit, state}) {
            return new Promise((resolve, reject) => {
                getInfo().then(res => {
                    const user = res.data
                    const avatar = (user == null || user.avatar == "" || user.avatar == null) ? require("@/static/images/profile.jpg") : baseUrl + user.avatar
                    const username = (user == null || user.nickName == "" || user.nickName == null) ? "" : user.nickName
                    commit('SET_NAME', username)
                    commit('SET_AVATAR', avatar)
                    resolve(res)
                }).catch(error => {
                    reject(error)
                })
            })
        },

        // 退出系统
        LogOut({commit, state}) {
            return new Promise((resolve, reject) => {
                logout(state.token).then(() => {
                    commit('SET_TOKEN', '')
                    removeToken()
                    storage.clean()
                    resolve()
                }).catch(error => {
                    reject(error)
                })
            })
        }
    }
}

export default user
