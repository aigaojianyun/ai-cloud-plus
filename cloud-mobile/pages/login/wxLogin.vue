<template>
  <view>
    <u-navbar :safeAreaInsetTop="true" placeholder="true" leftText="返回" autoBack="true"  title="微信授权登录" bgColor="#f3f4f6" ></u-navbar>
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
    getPhoneNumber: function (e) {
      console.log(e);
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
        async success() {
          // 用户信息
          wx.getUserInfo({
            success: function (res) {
              that.$store.dispatch('LoginWx', that.loginForm).then(res => {
                that.$modal.loading("登录中，请耐心等待...")
                that.loginSuccess()
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
      that.$store.dispatch('GetUserInfo').then(res => {
        that.$tab.reLaunch('/pages/home/index')
      })
    },
  }
}
</script>

<style lang="scss">
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
  margin: 60rpx 50rpx;
  font-size: 35rpx;
}
</style>
