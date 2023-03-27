import request from '@/utils/request'

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
