<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.login.loginCode.code" bgColor="#f3f4f6"></u-navbar>
    <view class="reg-text">{{i18n.login.loginCode.verifyPhone}}</view>
    <view class="remind-text">{{i18n.login.loginCode.star}}<em>{{ phone }}</em>{{i18n.login.loginCode.send}}</view>
    <view class="remind-code">
      <u-code-input v-model="code" :maxlength="6" hairline color="#000" borderColor="#f56c6c" @change="change" @finish="finish"></u-code-input>
    </view>
    <view>
      <u-code ref="uCode" @change="codeChange" keep-running :start-text="i18n.login.loginCode.anew" :change-text="i18n.login.loginCode.count + 'XS' " @start="disabled = true" @end="disabled = false"
      ></u-code>
      <u-button class="button" @tap="getCode" :text="tips" :disabled="disabled"
      ></u-button>
    </view>
  </view>
</template>
<script>

import {commonMixin} from '@/common/mixin/mixin.js'

export default {
  components: {},
  mixins: [commonMixin],
  data() {
    return {
      phone: '',
      tips: '',
      disabled: false,
    };
  },
  onShow() {
  },
  methods: {
    codeChange(text) {
      this.tips = text;
    },
    getCode() {
      if (this.$refs.uCode.canGetCode) {
        // 模拟向后端请求验证码
        this.$modal.msgLoading(this.i18n.login.loginPhone.nextCode)
        setTimeout(() => {
          uni.hideLoading();
          // 这里此提示会被this.start()方法中的提示覆盖
          uni.$u.toast('验证码已发送');
          // 通知验证码组件内部开始倒计时
          this.$refs.uCode.start();
        }, 2000);
      } else {
        uni.$u.toast('倒计时结束后再发送');
      }
    },
    change(e){

    },
    finish(e) {
      this.$u.api.login({
        phoneNo: this.phoneNo,
        validCode: e,
        loginType: '0'
      }).then(res => {
        if (res.msg) {
          this.$u.toast(res.msg);
        }
        if (res.code == '200') {
          setTimeout(() => {
            uni.reLaunch({
              url: '/pages/sys/home/index'
            });
          }, 500);
        }
      });
    }
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
  padding: 30rpx 70rpx;
}
.button {
  color: #ffffff;
  font-size: 32rpx;
  width: 80%;
  height: 80rpx;
  background: #497bff;
  box-shadow: 0rpx 0rpx 13rpx 0rpx rgba(15, 168, 250, 0.4);
  border-radius: 20rpx;
  line-height: 80rpx;
  text-align: center;
  margin: 50rpx auto 0;
}

</style>
