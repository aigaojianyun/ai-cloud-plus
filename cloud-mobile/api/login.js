import request from '@/utils/request'
import {encrypt} from '@/utils/jsencrypt'

// 账号密码登录
export function login(username, password, code, uuid) {
    password = encrypt(password);
    const data = {
        username,
        password,
        code,
        uuid
    }
    return request({
        'url': '/auth/web/login',
        headers: {
            isToken: false
        },
        'method': 'post',
        'data': data
    })
}

// 微信授权登录
export function loginWx(code, encryptedData, iv, nickName, avatarUrl, gender) {
    const data = {
        // 换取openId
        code,
        // 解密手机号
        encryptedData,
        //
        iv,
        // 更新用户信息
        nickName,
        avatarUrl,
        // 性别 0：未知、1：男、2：女
        gender,
    }
    return request({
        'url': '/auth/web/login/wx',
        headers: {
            isToken: false
        },
        'method': 'post',
        'data': data
    })
}

// 退出方法
export function logout() {
    return request({
        'url': '/auth/web/logout',
        headers: {
            isToken: true
        },
        method: 'delete'
    })
}

// 获取用户详细信息
export function getInfo() {
    return request({
        'url': '/user/user/info',
        headers: {
            isToken: true
        },
        'method': 'post'
    })
}

