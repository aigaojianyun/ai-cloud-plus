import request from '@/utils/request'

// 登录方法
export function login(username, password, deviceId) {
    const data = {
        username,
        password,
        deviceId
    }
    return request({
        'url': '/cloud-auth/login',
        headers: {
            isToken: false
        },
        'method': 'post',
        'data': data
    })
}

// 获取用户详细信息
export function getInfo() {
    return request({
        'url': '/cloud-user/user/userInfo',
        headers: {
            isToken: true
        },
        'method': 'post'
    })
}

// 退出方法
export function logout() {
    return request({
        'url': '/cloud-auth/logout',
        'method': 'post'
    })
}

