<!-- 蓝色简洁登录页面 -->
<template>
  <view class="login">
    <!-- 切换语言 -->
    <view class="l-language" @click="handleToLang">
      {{ i18n.login.language }}》
    </view>
    <!-- 页面装饰图片 -->
    <image class="l-img-a" src="@/static/images/background/b-1.png"></image>
    <image class="l-img-b" src="@/static/images/background/b-2.png"></image>
    <!-- 标题 -->
    <view class="l-b">{{ i18n.login.title }}</view>
    <view class="l-b2">{{ i18n.login.subTitle }}</view>
    <!-- 登录 -->
    <form class="login-form">
      <!-- 登录账号 -->
      <view class="login-form-item">
        <u-input v-model="loginForm.username" :placeholder="i18n.login.username" maxlength="30">
          <u-icon slot="prefix" name="account-fill" size="35px"></u-icon>
        </u-input>
      </view>
      <!-- 登录密码 -->
      <view class="login-form-item">
        <u-input v-model="loginForm.password" type="password" :placeholder="i18n.login.password" maxlength="16">
          <u-icon slot="prefix" name="lock-fill" size="35px"></u-icon>
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
      <button type="primary" @click="handleLogin">{{ i18n.login.login }}</button>
    </form>
    <!-- 忘记密码/立即注册 -->
    <view class="reg">
      <navigator class="reg-left" url="" open-type="navigate">{{ i18n.login.logon }}</navigator>
      <navigator class="reg-right" url="" open-type="navigate">{{ i18n.login.cipher }}</navigator>
    </view>
    <!-- 更多登录方式 -->
    <view class="login-bottom-box">
      <u-divider :text="i18n.login.more"></u-divider>
      <view class="oauth2">
        <u-icon class="u-icon" size="40" color="#939393" name="phone" @click="codeLogin"></u-icon>
        <u-icon class="u-icon" size="40" color="#36c956" name="weixin-circle-fill" @click="wxLogin"></u-icon>
        <u-icon class="u-icon" size="40" color="#23a0f0" name="twitter-circle-fill" @click=""></u-icon>
        <u-icon class="u-icon" size="40" color="" name="github-circle-fill" @click=""></u-icon>
      </view>
      <view class="copyright">
        {{i18n.login.agree}}
        <u-link class="link-left" href="#" >{{i18n.login.agreement}}</u-link>
        {{i18n.login.and}}
        <u-link class="link-right" href="#" >{{i18n.login.privacy}}</u-link>
      </view>
    </view>
    <!-- 语言切换 -->
    <u-action-sheet :actions="langList" :show="showLang" @select="clickLang" :cancelText="i18n.common.cancel" @close="showLang = false"></u-action-sheet>
  </view>
</template>
<script>

import lang from '@/common/language/lang'
import {commonI18n} from '@/common/language/mixin.js'
import Verify from "@/components/verify/verify";


export default {
  components: {
    Verify,
  },
  mixins: [commonI18n],
  data() {
    return {
      loginForm: {
        username: "ai168",
        password: "123456",
        code: "",
        uuid: ""
      },
      showLang: false,
      langList: []
    };
  },
  onShow(){
    uni.setNavigationBarTitle({
      title: this.i18n.login.login
    })
    this.langList = [{
      name: this.i18n.common.lang.en_US,
      lang: lang.EN_US
    }, {
      name: this.i18n.common.lang.zh_CN,
      lang: lang.ZH_CN
    }, {
        name: this.i18n.common.lang.zh_TW,
        lang: lang.ZH_TW
    }]
  },
  methods: {
    // 打开系统语言设置
    handleToLang() {
      this.showLang = true
    },
    // 语言切换
    clickLang(index) {
      let lang = index.lang
      uni.setStorageSync('language', lang);
      // 改变在main.js中定义的locale
      this._i18n.locale = lang;
      console.log(lang);
      uni.setTabBarItem({
        index: 0,
        text: this.$t('message').tabBar.home
      })
      uni.setTabBarItem({
        index: 1,
        text: this.$t('message').tabBar.market
      })
      uni.setTabBarItem({
        index: 2,
        text: this.$t('message').tabBar.assets
      })
      uni.setTabBarItem({
        index: 3,
        text: this.$t('message').tabBar.me
      })
      // 利用路由，刷新当前页面
      setTimeout(() => {
        this.$tab.reLaunch('/pages/login/login')
      }, 500)
    },
    // 打开滑块验证码
    async handleLogin() {
      if (this.loginForm.username === "") {
        this.$modal.msgError(this.i18n.login.inputUserName)
      } else if (this.loginForm.password === "") {
        this.$modal.msgError(this.i18n.login.inputPassword)
      } else {
        this.$refs.verify.show();
      }
    },
    // 登录校验方法
    async success(data) {
      // params 返回的二次验证参数, 和登录参数一起回传给登录接口，方便后台进行二次验证
      this.loginForm.code = data.captchaVerification;
      // 关闭滑块验证码
      this.$refs.verify.hide();
      // 加载中提示
      this.$modal.showLoading(this.i18n.login.loginLog)
      // 登录校验
      this.$store.dispatch('Login', this.loginForm).then(() => {
        // 登录成功后
        this.loginSuccess()
        // 关闭加载中
        this.$modal.hideLoading();
      }).catch(() => {
        // 登录异常
      })
    },
    // 登录成功后，处理函数
    async loginSuccess(result) {
      // 设置用户信息
      this.$store.dispatch('GetUserInfo').then(res => {
        this.$tab.reLaunch('/pages/center/index')
      })
    },
    // 验证码登录
    codeLogin(){
      this.$tab.navigateTo('/pages/login/phone')
      //this.$modal.showLoading(this.i18n.common.coming)
    },
    // 微信授权登录
    wxLogin() {
      //this.$tab.navigateTo('/pages/login/wx')
      //this.$modal.showLoading(this.i18n.common.coming)
    },
  }
};
</script>

<style lang="scss">
.login {
  width: 650rpx;
  margin: 0 auto;
  font-size: 28rpx;
  color: #000;
}

.l-language{
  display: flex;
  justify-content: flex-end;
  align-items: flex-start;
  position: relative;
  top: 45rpx;
  right: 0;
  font-size: 31rpx;
  color: #aaaaaa;
}

.l-img-a {
  position: absolute;
  width: 100%;
  top: -150rpx;
  right: 0;
  z-index: -999;
}

.l-img-b {
  position: absolute;
  width: 50%;
  bottom: 0;
  left: -50rpx;
  z-index: -999;
}

.l-b {
  text-align: left;
  font-size: 32rpx;
  color: #aaaaaa;
  padding: 300rpx 0 20rpx 0;
  font-weight: bold;
}

.l-b2 {
  text-align: left;
  font-size: 56rpx;
  color: #000;
  padding: 0rpx 0 60rpx 0;
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

.uni-input-placeholder {
  color: #000 !important;
}

.login button {
  font-size: 28rpx;
  background-color: #497bff;
  color: #fff;
  height: 90rpx;
  line-height: 90rpx;
  border-radius: 20rpx;
  box-shadow: 0 10rpx 14rpx 0 rgba(86, 119, 252, 0.2);
}

.reg{
  display:flex;
  justify-content: space-between;
  padding:30rpx 0 0;
}

.reg-left{
  display: inline-block;
  color: #5473e8;
  text-align: left;
}

.reg-right{
  display: inline-block;
  color: #5473e8;
  text-align: right;
}

.login-bottom-box {
  margin-top: 100rpx;
  bottom: 40rpx;
  text-align: center;
  width: 100%;
}

.oauth2 {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  margin: 0rpx 100rpx 30rpx;

  image {
    height: 80rpx;
    width: 80rpx;
  }
}

.copyright {
  text-align: center;
  color: #939393;
  width: 100%;
  font-size: 24rpx;
  .u-link{
    margin: 0 10rpx;
    font-size: 24rpx!important;
  }
}

</style>
