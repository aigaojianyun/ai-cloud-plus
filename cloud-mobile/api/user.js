import request from '@/utils/request'

// 获取用户详细信息
export function getUserInfo() {
    return request({
        'url': '/user/user/info',
        headers: {
            isToken: true
        },
        'method': 'post'
    })
}

// 修改用户个人信息
export function updateUserInfo(data) {
    return request({
        url: '/user/user/save',
        headers: {
            isToken: true
        },
        'method': 'post',
        data: data
    })
}

// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
    const data = {
        oldPassword,
        newPassword
    }
    return request({
        url: '/user/user/profile/updatePwd',
        method: 'put',
        params: data
    })
}
