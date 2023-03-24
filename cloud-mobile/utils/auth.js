const TokenKey = 'App-Token'
// 获取token
export function getToken() {
    return uni.getStorageSync(TokenKey)
}
// 存储token
export function setToken(token) {
    return uni.setStorageSync(TokenKey, token)
}
// 删除token
export function removeToken() {
    return uni.removeStorageSync(TokenKey)
}
// 获取国际化语言
export function getLang() {
    return uni.getStorageSync('language')
}
