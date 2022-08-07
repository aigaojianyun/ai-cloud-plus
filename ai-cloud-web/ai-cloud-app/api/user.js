import upload from '@/utils/upload'
import request from '@/utils/request'

// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
    const data = {
        oldPassword,
        newPassword
    }
    return request({
        url: '/cloud-user/user/profile/updatePwd',
        method: 'put',
        params: data
    })
}

// 查询用户个人信息
export function getUserProfile() {
    return request({
        'url': '/cloud-user/user/userInfo',
        headers: {
            isToken: true
        },
        'method': 'post'
    })
}

// 修改用户个人信息
export function updateUserProfile(data) {
    return request({
        url: '/cloud-user/user/userSave',
        headers: {
            isToken: true
        },
        'method': 'post',
        data: data
    })
}

// 用户头像上传
export function uploadAvatar(data) {
    return upload({
        url: '/cloud-file/upload',
        name: data.name,
        filePath: data.filePath
    })
}
