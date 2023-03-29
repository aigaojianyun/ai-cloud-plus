import {getLang} from '@/utils/auth'
import lang from '@/common/language/lang'

/**
 * 显示消息提示框
 * @param content 提示的标题
 */
export function toast(content) {
    uni.showToast({
        icon: 'none',
        title: content
    })
}

/**
 * 显示模态弹窗
 * @param content 提示的标题
 */
export function showConfirm(content) {
    return new Promise((resolve, reject) => {
        if (getLang() === lang.EN_US) {
            uni.showModal({
                title: 'Prompt',
                content: content,
                cancelText: 'cancel',
                confirmText: 'ok',
                success: function (res) {
                    resolve(res)
                }
            })
        } else if (getLang() === lang.ZH_CN) {
            uni.showModal({
                title: '提示',
                content: content,
                cancelText: '取消',
                confirmText: '确定',
                success: function (res) {
                    resolve(res)
                }
            })
        }
    })
}

/**
 * 参数处理
 * @param params 参数
 */
export function tansParams(params) {
    let result = ''
    for (const propName of Object.keys(params)) {
        const value = params[propName]
        var part = encodeURIComponent(propName) + "="
        if (value !== null && value !== "" && typeof (value) !== "undefined") {
            if (typeof value === 'object') {
                for (const key of Object.keys(value)) {
                    if (value[key] !== null && value[key] !== "" && typeof (value[key]) !== 'undefined') {
                        let params = propName + '[' + key + ']'
                        var subPart = encodeURIComponent(params) + "="
                        result += subPart + encodeURIComponent(value[key]) + "&"
                    }
                }
            } else {
                result += part + encodeURIComponent(value) + "&"
            }
        }
    }
    return result
}
