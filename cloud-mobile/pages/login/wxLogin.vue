<template>
    <view>
        <view class="header">
            <image src="/static/login/wx_login.png" mode=""></image>
        </view>
        <view class='content'>
            <view>申请获取以下权限</view>
            <text>获得你的公开信息(昵称，头像、地区等)</text>
            <text>获得你微信绑定的手机号</text>
        </view>
        <button class="bottom" type="primary" open-type="getPhoneNumber" @getphonenumber="getPhoneNumber">
            微授权登录
        </button>
        <u-toast ref="uToast" />
    </view>
</template>

<script>
    let that;

    export default {
        data() {
            return {
                loginForm: {
                    // 换取openId
                    code: '',
                    // 解密手机号
                    encryptedData: '',
                    iv: '',
                    // 更新用户信息
                    nickName: '',
                    avatarUrl: '',
                    // 性别 0：未知、1：男、2：女
                    gender: '',
                }
            };
        },
        onLoad() {
            that = this;
            this.getCode();
        },
        methods: {
            getCode() {
                wx.login({
                    success(res) {
                        if (res.code) {
                            that.loginForm.code = res.code;
                        } else {
                            that.$msg('登录失败：' + res.errMsg);
                        }
                    },
                    fail(err) {
                        that.$msg('code获取失败');
                    },
                });
            },
            getPhoneNumber: function(e) {
                that.getCode();
                uni.showLoading({
                    title: '登录中...'
                });
                if (e.detail.errMsg != 'getPhoneNumber:ok') {
                    that.$refs.uToast.show({type: 'error', title: '未授权手机号'});
                    uni.hideLoading();
                    return false;
                }
                that.loginForm.encryptedData = e.detail.encryptedData;
                that.loginForm.iv = e.detail.iv;
                // 检查登录态是否过期
                wx.checkSession({
                    success() {
                        // 用户信息
                        wx.getUserInfo({
                            success: function(res) {
                                // let userInfo = res.userInfo;
                                // that.loginForm.nickName = userInfo.nickName;
                                // that.loginForm.avatarUrl = userInfo.avatarUrl;
                                // that.loginForm.gender = userInfo.gender;
                                // that.$u.post('/au/weiXin/login', that.loginForm).then(res => {
                                //     uni.setStorageSync(that.$config.cachePrefix + 'token', res.token);
                                //     that.$u.get('/au/weiXin/getInfo').then(result => {
                                //         uni.setStorageSync(that.$config.cachePrefix + 'user', result.user);
                                //         that.$refs.uToast.show({
                                //             type: 'success',
                                //             title: '登录成功',
                                //             url: '/pages/index/index',
                                //             isTab: true
                                //         });
                                //     });
                                // });
                              this.$store.dispatch('LoginWx', this.loginForm).then(() => {
                                this.$refs.verify.hide();
                                this.$modal.loading("登录中，请耐心等待...")
                                this.loginSuccess()
                              }).catch(() => {
                              })
                            }
                        });
                    },
                    fail(err) {
                        wx.login({
                            success: res => {
                                that.loginForm.code = res.code
                            }
                        });
                    }
                })
            },
            // 登录成功后，处理函数
            async loginSuccess(result) {
              // 设置用户信息
              this.$store.dispatch('GetInfo').then(res => {
                this.$tab.reLaunch('/pages/home/index')
              })
            },
        }
    }
</script>

<style scoped>
    .header {
        margin: 90rpx 0 90rpx 50rpx;
        border-bottom: 1px solid #ccc;
        text-align: center;
        width: 650rpx;
        height: 300rpx;
        line-height: 450rpx;
    }

    .header image {
        width: 200rpx;
        height: 200rpx;
    }

    .content {
        margin-left: 50rpx;
        margin-bottom: 90rpx;
    }

    .content text {
        display: block;
        color: #9d9d9d;
        margin-top: 40rpx;
    }

    .bottom {
        border-radius: 80rpx;
        margin: 70rpx 50rpx;
        font-size: 35rpx;
    }
</style>
