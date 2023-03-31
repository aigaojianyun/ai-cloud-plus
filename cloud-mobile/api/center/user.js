import request from '@/utils/request'

// 获取用户详细信息
export function getUserInfo() {
    return request({
        'url': '/user/center/info',
        headers: {
            isToken: true,
            isLang:true
        },
        'method': 'post'
    })
}

// 修改用户个人信息
export function updateUserInfo(data) {
    return request({
        url: '/user/center/save',
        headers: {
            isToken: true,
            isLang:true
        },
        'method': 'post',
        data: data
    })
}
