<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.login.loginCode.code" bgColor="#f3f4f6"></u-navbar>
    <view class="reg-text">{{ i18n.login.loginCode.verifyPhone }}</view>
    <view class="remind-text">{{ i18n.login.loginCode.star }}<em>{{ phone }}</em>{{ i18n.login.loginCode.send }}</view>
    <view class="remind-code">
      <u-code-input v-model="loginCode.code" :maxlength="6" color="#000" borderColor="#f56c6c"
                    @finish="finish"></u-code-input>
    </view>
    <view>
      <u-code ref="uCode" @change="codeChange" keep-running :start-text="i18n.login.loginCode.anew"
              :change-text="'XS' + i18n.login.loginCode.count " @start="disabled = true" @end="disabled = false"
      ></u-code>
      <u-button class="button" @tap="getCode" :text="tips" :disabled="disabled"
      ></u-button>
    </view>
  </view>
</template>
<script>

import {commonMixin} from '@/common/mixin/mixin.js'
import {getCode} from "@/api/resource/resource"
import phone from "./phone";

export default {
  components: {},
  mixins: [commonMixin],
  data() {
    return {
      // 发送验证码参数
      phone: '',
      zone: '',
      // 验证码登录参数
      loginCode: {
        phone: '',
        zone: '',
        code: '',
        uuid: ''
      },
      tips: '',
      disabled: false,
    };
  },
  onLoad(option) {
    this.phone = option.phone
    this.zone = option.zone
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.login.loginCode.code
    })
  },
  methods: {
    codeChange(text) {
      this.tips = text;
      this.getCode()
    },
    // 发送验证码
    getCode() {
      if (this.$refs.uCode.canGetCode) {
        // 请求验证码
        this.$modal.showToast(this.i18n.login.loginPhone.nextCode)
        getCode({
          phone: this.phone,
          zone: this.zone
        }).then(res => {
          if (res.data.code === 200) {
            setTimeout(() => {
              // 这里此提示会被this.start()方法中的提示覆盖
              this.$modal.showToast(this.i18n.login.loginPhone.sendCode)
              // 通知验证码组件内部开始倒计时
              this.$refs.uCode.start();
            }, 500);
          } else {
            setTimeout(() => {
              this.$modal.showToast(res.msg);
            }, 500);
          }
        });
      } else {
        // 倒计时结束后再发送
        this.$modal.showToast(this.i18n.login.loginPhone.nextCode)
        getCode({
          phone: this.phone,
          zone: this.zone
        }).then(res => {
          if (res.data.code === 200) {
            setTimeout(() => {
              // 这里此提示会被this.start()方法中的提示覆盖
              this.$modal.showToast(this.i18n.login.loginPhone.sendCode)
              // 通知验证码组件内部开始倒计时
              this.$refs.uCode.start();
            }, 500);
          } else {
            setTimeout(() => {
              this.$modal.showToast(res.msg);
            }, 500);
          }
        });
      }
    },
    finish(e) {
      this.loginCode.phone = this.phone,
      this.loginCode.zone = this.zone
      // 登录校验方法
      this.$store.dispatch('LoginPhone', this.loginCode).then(() => {
        this.$modal.showToast(this.i18n.login.loginLog)
        this.loginSuccess()
      }).catch(() => {
      })
    },
    // 登录成功后，处理函数
    async loginSuccess(result) {
      // 设置用户信息
      this.$store.dispatch('GetUserInfo').then(res => {
        this.$tab.reLaunch('/pages/center/index')
      })
    },
  }
};
</script>
<style lang="scss">
.login{
  padding-top:60rpx
}
.reg-text{
  font-size: 42rpx;
  color: #000;
  padding: 40rpx 70rpx 10rpx;
}
.remind-text {
  padding: 30rpx 70rpx;
  color: #666666;
  em {
    font-weight: bold;
    color: #242424;
    font-style: normal;
    margin: 0 5px;
  }
}
.remind-code {
  text-align: center;
  padding: 30rpx 70rpx;
}
.button {
  color: #ffffff;
  font-size: 32rpx;
  width: 60%;
  height: 80rpx;
  background: #497bff;
  box-shadow: 0rpx 0rpx 13rpx 0rpx rgba(15, 168, 250, 0.4);
  border-radius: 20rpx;
  line-height: 80rpx;
  text-align: center;
  margin: 50rpx auto 0;
}

</style>
