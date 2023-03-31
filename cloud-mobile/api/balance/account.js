import request from '@/utils/request'

// 获取钱包余额
export function getWallet() {
    return request({
        'url': '/user/center/wallet',
        headers: {
            isToken: true,
            isLang:true
        },
        'method': 'post'
    })
}
