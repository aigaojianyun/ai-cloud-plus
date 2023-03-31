import request from '@/utils/request'

// 获取验证码
export function getCode(data) {
    return request({
        'url': '/resource/sms/code',
        headers: {
            isToken: false,
            isLang:true
        },
        'method': 'post',
        'data': data
    })
}

// 获取区域国家
export function getCountry() {
    return request({
        'url': '/resource/center/country',
        headers: {
            isToken: false,
            isLang:true
        },
        'method': 'post'
    })
}
