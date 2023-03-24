export default {
    // 消息提示
    msg(content) {
        uni.showToast({
            title: content,
            icon: 'none'
        })
    },
    // 成功消息
    msgSuccess(content) {
        uni.showToast({
            title: content,
            icon: 'success'
        })
    },
    // 错误消息
    msgError(content) {
        uni.showToast({
            title: content,
            icon: 'error'
        })
    },
    // 弹出提示
    alert(content) {
        uni.showModal({
            title: '系统提示',
            content: content,
            showCancel: false
        })
    },
    // 提示信息
    showToast(option) {
        if (typeof option === "object") {
            uni.showToast(option)
        } else {
            uni.showToast({
                title: option,
                icon: "none",
                duration: 1000
            })
        }
    },
    // 隐藏消息
    hideMsg(content) {
        uni.hideToast()
    },
    // 确认窗体
    confirm(content) {
        return new Promise((resolve, reject) => {
            uni.showModal({
                title: '系统提示',
                content: content,
                confirmText: '确定',
                cancelText: '取消',
                success: function (res) {
                    if (res.confirm) {
                        resolve(res.confirm)
                    }
                }
            })
        })
    },
    // 打开遮罩层
    loading(content) {
        uni.showLoading({
            title: content,
            icon: 'none'
        })
    },
    // 关闭遮罩层
    closeLoading() {
        uni.hideLoading()
    }
}
