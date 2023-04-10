import store from '@/store'
import config from '@/config'
import lang from '@/common/language/lang'
import {getLang, getToken} from '@/utils/auth'
import {showConfirm, tansParams, toast} from '@/utils/common'

let timeout = 10000
const baseUrl = config.baseUrl

const request = config => {
    // 是否需要设置 token
    const isToken = (config.headers || {}).isToken === false
    // 是否需要设置多语言
    const isLang = (config.headers || {}).isLang === false
    config.header = config.header || {}
    if (getToken() && !isToken) {
        config.header['Authorization'] = 'Bearer ' + getToken()
    }
    if (getLang() && !isLang) {
        config.header['Language'] = getLang()
    }
    // get请求映射params参数
    if (config.params) {
        let url = config.url + '?' + tansParams(config.params)
        url = url.slice(0, -1)
        config.url = url
    }
    return new Promise((resolve, reject) => {
        uni.request({
            method: config.method || 'get',
            timeout: config.timeout || timeout,
            url: config.baseUrl || baseUrl + config.url,
            data: config.data,
            header: config.header,
            dataType: 'json'
        }).then(response => {
            let [error, res] = response
            if (error) {
                if (getLang() === lang.EN_US) {
                    toast('The server connection is abnormal!')
                    reject('The server connection is abnormal!')
                    return
                } else if (getLang() === lang.ZH_CN) {
                    toast('服务器连接异常!')
                    reject('服务器连接异常!')
                    return
                } else if (getLang() === lang.ZH_TW) {
                    toast('服務器連接異常!')
                    reject('服務器連接異常!')
                    return
                }
            }
            const code = res.data.code || 200
            const msg = res.data.msg
            if (code === 401) {
                if (getLang() === lang.EN_US) {
                    showConfirm('The login status has expired. Can you stay on the page or log in again?').then(res => {
                        if (res.confirm) {
                            store.dispatch('LogOut').then(res => {
                                uni.reLaunch({url: '/pages/login/login'})
                            })
                        }
                    })
                    reject('Invalid session, or the session has expired, please log in again!')
                } else if (getLang() === lang.ZH_CN) {
                    showConfirm('登录状态已过期，您可以继续留在该页面，或者重新登录?').then(res => {
                        if (res.confirm) {
                            store.dispatch('LogOut').then(res => {
                                uni.reLaunch({url: '/pages/login/login'})
                            })
                        }
                    })
                    reject('无效的会话，或者会话已过期，请重新登录!')
                } else if (getLang() === lang.ZH_TW) {
                    showConfirm('登錄狀態已過期，您可以繼續留在該頁面，或者重新登錄?').then(res => {
                        if (res.confirm) {
                            store.dispatch('LogOut').then(res => {
                                uni.reLaunch({url: '/pages/login/login'})
                            })
                        }
                    })
                    reject('無效的會話，或者會話已過期，請重新登錄!')
                }
            } else if (code === 500) {
                toast(msg)
                reject('500')
            } else if (code !== 200) {
                toast(msg)
                reject(code)
            }
            resolve(res.data)
        }).catch(error => {
            let {message} = error
            if (message === 'Network Error') {
                if (getLang() === lang.EN_US) {
                    message = 'The server connection is abnormal!'
                } else if (getLang() === lang.ZH_CN) {
                    message = '服务器连接异常!'
                } else if (getLang() === lang.ZH_TW) {
                    message = '服務器連接異常!'
                }
            } else if (message.includes('timeout')) {
                if (getLang() === lang.EN_US) {
                    message = 'Server request timed out!'
                } else if (getLang() === lang.ZH_CN) {
                    message = '服务器请求超时!'
                } else if (getLang() === lang.ZH_TW) {
                    message = '服務器請求超時!'
                }
            } else if (message.includes('Request failed with status code')) {
                if (getLang() === lang.EN_US) {
                    message = 'Server' + message.substr(message.length - 3) + 'Exception!'
                } else if (getLang() === lang.ZH_CN) {
                    message = '服务器' + message.substr(message.length - 3) + '异常!'
                } else if (getLang() === lang.ZH_TW) {
                    message = '服務器' + message.substr(message.length - 3) + '異常!'
                }
            }
            toast(message)
            reject(error)
        })
    })
}

export default request
