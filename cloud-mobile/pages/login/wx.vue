<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" leftText="返回" title="微信授权登录" bgColor="#f3f4f6" ></u-navbar>
    <view class="header">
      <image mode="" src="/static/images/weixin/logo.png">
      </image>
    </view>
    <view class='content'>
      <view>申请获取以下权限</view>
      <text>获得你的公开信息(昵称，头像、地区等)</text>
      <text>获得你微信绑定的手机号</text>
    </view>
    <button class="bottom" open-type="getPhoneNumber" type="primary" @getphonenumber="getPhoneNumber">
      微授权登录
    </button>
    <u-toast ref="uToast"/>
  </view>
</template>

<script>
let that;
export default {
  components: {
  },
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
    that.getCode();
  },
  methods: {
    getCode() {
      wx.login({
        success(res) {
          if (res.code) {
            that.loginForm.code = res.code;
          } else {
            that.$modal.msgError('登录失败：' + res.errMsg);
          }
        },
        fail(err) {
          that.$modal.msgError('code获取失败');
        },
      });
    },
    getPhoneNumber: function (e) {
      that.getCode();
      if (e.detail.errMsg != 'getPhoneNumber:ok') {
        that.$modal.msgError('未授权手机号')
        return false;
      }
      that.loginForm.encryptedData = e.detail.encryptedData;
      that.loginForm.iv = e.detail.iv;
      // 检查登录态是否过期
      wx.checkSession({
        async success() {
          // 用户信息
          wx.getUserInfo({
            success: function (res) {
                // 加载中提示
                that.$modal.showLoading('登录中，请耐心等待...')
                // 登录校验
                that.$store.dispatch('LoginWx', that.loginForm).then(res => {
                // 登录成功后
                that.loginSuccess()
                // 关闭加载中
                that.$modal.hideLoading();
              }).catch(() => {
                // 登录异常
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
      that.$store.dispatch('GetUserInfo').then(res => {
        that.$tab.reLaunch('/pages/center/index')
      })
    },
  }
}
</script>

<style lang="scss">
.login {
  width: 650rpx;
  margin: 0 auto;
  font-size: 28rpx;
  color: #000;
}
.header {
  margin: 90rpx 0 90rpx 0;
  border-bottom: 1px solid #ccc;
  text-align: center;
  width: 650rpx;
  height: 260rpx;
  line-height: 450rpx;
}

.header image {
  width: 160rpx;
  height: 160rpx;
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
  border-radius: 20rpx;
  margin: 60rpx 50rpx;
  font-size: 35rpx;
}
</style>
