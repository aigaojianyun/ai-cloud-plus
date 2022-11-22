import request from '@/utils/request'

// 获取钱包余额
export function getWallet() {
    return request({
        'url': '/user/user/wallet',
        headers: {
            isToken: true
        },
        'method': 'post'
    })
}

//