<!-- 蓝色简洁登录页面 -->
<template>
  <view class="t-login">
    <!-- 页面装饰图片 -->
    <image class="img-a" src="/../../static/images/background/b-1.png"></image>
    <image class="img-b" src="/../../static/images/background/b-2.png"></image>
    <!-- 标题 -->
    <view class="t-b">{{ title }}</view>
    <view class="t-b2">{{ subTitle }}</view>
    <form class="cl">
      <!-- 登录账号 -->
      <view class="login-form-item">
        <u-input v-model="loginForm.username" placeholder="请输入登录用户名" maxlength="30">
          <u-icon slot="prefix" name="account" size="35px"></u-icon>
        </u-input>
      </view>
      <!-- 登录密码 -->
      <view class="login-form-item">
        <u-input v-model="loginForm.password" type="password" placeholder="请输入登录密码" maxlength="16">
          <u-icon slot="prefix" name="lock" size="35px"></u-icon>
        </u-input>
      </view>
      <!-- 验证码 -->
      <Verify
          @success='success'
          :mode="'pop'"
          :captchaType="'blockPuzzle'"
          ref="verify"
          :imgSize="{width:'310px',height:'155px'}">
      </Verify>
      <button type="primary" @click="handleLogin">登 录</button>
      <!-- 更多登录方式 -->
      <view class="login-bottom-box">
        <u-divider> 更多登录方式 </u-divider>
        <view class="oauth2">
          <u-icon class="u-icon" size="40" color="#36c956" name="weixin-circle-fill" @click="wxLogin"></u-icon>
          <u-icon class="u-icon" size="40" color="#23a0f0" name="qq-circle-fill" @click="qqLogin"></u-icon>
          <u-icon class="u-icon" size="40" color="#23a0f0" name="zhifubao-circle-fill" @click="zhifubaoLogin"></u-icon>
          <u-icon class="u-icon" size="40" color="" name="github-circle-fill" @click="githubLogin"></u-icon>
        </view>
        <view class="copyright">
          登录即代表您已阅读并同意<u-link href="#">用户协议</u-link> 与 <u-link href="#">隐私政策</u-link>
        </view>
      </view>
    </form>
  </view>
</template>
<script>

import Verify from "@/components/verify/verify";

export default {
  components: {
    Verify,
  },
  data() {
    return {
      title: '未来 已来!',
      subTitle: '币币钱包',
      loginForm: {
        username: "ai168",
        password: "123456",
        code: "",
        uuid: ""
      }
    };
  },
  created() {
  },
  methods: {
    // 打开验证码
    async handleLogin() {
      if (this.loginForm.username === "") {
        this.$modal.msgError("请输入您的账号")
      } else if (this.loginForm.password === "") {
        this.$modal.msgError("请输入您的密码")
      } else {
        this.$refs.verify.show();
      }
    },
    // 登录校验方法
    async success(data) {
      // params 返回的二次验证参数, 和登录参数一起回传给登录接口，方便后台进行二次验证
      this.loginForm.code = data.captchaVerification;
      this.$store.dispatch('Login', this.loginForm).then(() => {
        this.$refs.verify.hide();
        this.$modal.showToast("登录中，请耐心等待...")
        this.loginSuccess()
      }).catch(() => {
        this.$refs.verify.hide();
      })
    },
    // 登录成功后，处理函数
    async loginSuccess(result) {
      // 设置用户信息
      this.$store.dispatch('GetUserInfo').then(res => {
        this.$tab.reLaunch('/pages/home/index')
      })
    },
    // 微信授权登录
    wxLogin() {
      this.$tab.navigateTo('/pages/login/wxLogin')
    },
    // QQ授权登录
    qqLogin() {
      this.$modal.showToast("QQ授权登录")
    },
    // 支付宝授权登录
    zhifubaoLogin() {
      this.$modal.showToast("支付宝授权登录")
    },
    // GitHub授权登录
    githubLogin() {
      this.$modal.showToast("GitHub授权登录")
    },
  }
};
</script>

<style lang="scss">
.t-login {
  width: 650rpx;
  margin: 0 auto;
  font-size: 28rpx;
  color: #000;
}

/deep/ .login-form-item .u-input {
  padding: 0 20rpx 0 124rpx;
  height: 64rpx;
  line-height: 64rpx;
  margin-bottom: 52rpx;
  background-color: #f8f7fc;
  border: 2rpx solid #e9e9e9;
  font-size: 28rpx;
  border-radius: 52rpx;
}

.t-captcha {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

.t-captcha-img {
  margin-left: 32rpx;
  width: 204rpx;
  height: 88rpx;
}

.img-a {
  position: absolute;
  width: 100%;
  top: -150rpx;
  right: 0;
  z-index: -999;
}

.img-b {
  position: absolute;
  width: 50%;
  bottom: 0;
  left: -50rpx;
  z-index: -999;
}

.t-login button {
  font-size: 28rpx;
  background-color: #5677fc;
  color: #fff;
  height: 90rpx;
  line-height: 90rpx;
  border-radius: 50rpx;
  box-shadow: 0 10rpx 14rpx 0 rgba(86, 119, 252, 0.2);
}

.t-login .t-b {
  text-align: left;
  font-size: 32rpx;
  color: #aaaaaa;
  padding: 300rpx 0 20rpx 0;
  font-weight: bold;
}

.t-login .t-b2 {
  text-align: left;
  font-size: 56rpx;
  color: #000;
  padding: 0rpx 0 60rpx 0;
}

.t-login .uni-input-placeholder {
  color: #000 !important;
}

.t-login .login-bottom-box {
  bottom: 40rpx;
  text-align: center;
}

.t-login .oauth2 {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  margin: 0rpx 100rpx 30rpx;

  image {
    height: 80rpx;
    width: 80rpx;
  }
}

.t-login .copyright {
  text-align: center;
  color: #939393;
  width: 100%;
  font-size: 24rpx;

  u-link {
    margin: 0 10rpx;
    font-size: 24rpx !important;
  }
}

</style>
