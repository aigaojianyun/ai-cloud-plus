import request from '@/utils/request'

// 获取验证码
export function getCode(phone) {
    const data = {
        // 手机号
        phone
    }
    return request({
        'url': '/resource/sms/code',
        headers: {
            isToken: false
        },
        'method': 'post',
        'data': data
    })
}

// 获取区域七大洲
export function getContinent() {
    return request({
        'url': '/resource/center/continent',
        headers: {
            isToken: false
        },
        'method': 'post'
    })
}

// 获取区域国家
export function getCountry() {
    return request({
        'url': '/resource/center/country',
        headers: {
            isToken: false
        },
        'method': 'post'
    })
}
