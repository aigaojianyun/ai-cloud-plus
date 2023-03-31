import storage from '@/utils/storage'
import {login, loginPhone, loginWx, logout} from '@/api/login'
import {getToken, removeToken, setToken} from '@/utils/auth'
import {getUserInfo} from '@/api/center/user'

const user = {

    state: {
        token: getToken(),
    },

    mutations: {
        SET_TOKEN: (state, token) => {
            state.token = token
        }
    },

    actions: {
        // 账号密码登录
        Login({commit}, userInfo) {
            const username = userInfo.username.trim()
            const password = userInfo.password
            const code = userInfo.code
            const uuid = userInfo.uuid
            return new Promise((resolve, reject) => {
                login(username, password, code, uuid).then(res => {
                    setToken(res.data.access_token)
                    commit('SET_TOKEN', res.data.access_token)
                    resolve()
                }).catch(error => {
                    reject(error)
                })
            })
        },

        // 验证码登录
        LoginPhone({commit}, userInfo) {
            const phone = userInfo.phone
            const zone = userInfo.zone
            const code = userInfo.code
            const uuid = userInfo.uuid
            return new Promise((resolve, reject) => {
                loginPhone(phone, zone, code, uuid).then(res => {
                    setToken(res.data.access_token)
                    commit('SET_TOKEN', res.data.access_token)
                    resolve()
                }).catch(error => {
                    reject(error)
                })
            })
        },

        // 微信授权登录
        LoginWx({commit}, userInfo) {
            const code = userInfo.code
            const encryptedData = userInfo.encryptedData
            const iv = userInfo.iv
            const nickName = userInfo.nickName
            const avatarUrl = userInfo.avatarUrl
            const gender = userInfo.gender
            return new Promise((resolve, reject) => {
                loginWx(code, encryptedData, iv, nickName, avatarUrl, gender).then(res => {
                    setToken(res.data.access_token)
                    commit('SET_TOKEN', res.data.access_token)
                    resolve()
                }).catch(error => {
                    reject(error)
                })
            })
        },

        // 获取用户信息
        GetUserInfo({commit, state}) {
            return new Promise((resolve, reject) => {
                getUserInfo().then(res => {
                    const user = res.data
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
