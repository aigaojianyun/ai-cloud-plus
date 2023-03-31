import request from '@/utils/request'
import {encrypt} from '@/utils/jsencrypt'

// 账号密码登录
export function login(username, password, code, uuid) {
    password = encrypt(password);
    const data = {
        // 账号,手机号
        username,
        // 密码
        password,
        // 验证码
        code,
        // 设备uuid
        uuid
    }
    return request({
        'url': '/auth/app/login',
        headers: {
            isToken: false,
            isLang:true
        },
        'method': 'post',
        'data': data
    })
}

// 验证码登录
export function loginPhone(phone, zone, code, uuid) {
    const data = {
        // 手机号
        phone,
        // 区号
        zone,
        // 验证码
        code,
        // 设备uuid
        uuid
    }
    return request({
        'url': '/auth/app/login/phone',
        headers: {
            isToken: false,
            isLang:true
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
        // iv
        iv,
        // 用户信息
        nickName,
        avatarUrl,
        // 性别 0：未知、1：男、2：女
        gender,
    }
    return request({
        'url': '/auth/app/login/wx',
        headers: {
            isToken: false,
            isLang:true
        },
        'method': 'post',
        'data': data
    })
}

// 退出方法
export function logout() {
    return request({
        'url': '/auth/app/logout',
        headers: {
            isToken: true
        },
        method: 'delete'
    })
}

