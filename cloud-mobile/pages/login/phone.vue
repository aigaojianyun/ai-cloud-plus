<!-- 验证码登录 -->
<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.login.loginPhone.title" bgColor="#f3f4f6" ></u-navbar>
    <view class="list">
      <view class="list-call">
        <u-input :placeholder="i18n.login.loginPhone.phone" v-model="loginPhone.phone">
          <u--text :text=" '+' + loginPhone.zone" slot="prefix" margin="0 3px 0 0" type="tips"></u--text>
        </u-input>
      </view>
    </view>
    <button class="button" type="primary"  @click="nextStep()">
      <text>{{i18n.login.loginPhone.next}}</text>
    </button>
  </view>
</template>

<script>

import {commonI18n} from '@/common/language/mixin.js'
import {getCountry,getCode} from "@/api/resource/resource"

export default {
  components: {

  },
  mixins: [commonI18n],
  data() {
    return {
      loginPhone:{
        phone: '13888888888',
        zone:'86',
      },
      countryList:[],
    };
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.login.loginPhone.title
    })
    this.getCountry()
  },
  methods: {
    // 获取区域国家
    getCountry() {
      getCountry().then(response => {
        this.countryList = response.data
      })
    },
    // 下一步
    nextStep() {
      if (this.loginPhone.zone === ""){
        this.$modal.msgError(this.i18n.login.inputZone)
      } else if (this.loginPhone.phone === "") {
        this.$modal.msgError(this.i18n.login.inputPhone)
      }else {
        setTimeout(() => {
          this.$tab.navigateTo('/pages/login/code?phone=' + this.loginPhone.phone +'&zone='+ this.loginPhone.zone)
        }, 500);
      }
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

.list {
  display: flex;
  flex-direction: column;
  padding: 40rpx 70rpx 40rpx 70rpx;
}

.list-call {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding-top: 10rpx;
  height: 120rpx;
  font-weight: normal;
  color: #333333;
  border-bottom: 0.5px solid #e2e2e2;
}

.login button {
  color: #ffffff;
  font-size: 32rpx;
  width: 70%;
  height: 80rpx;
  background: #497bff;
  box-shadow: 0rpx 0rpx 13rpx 0rpx rgba(15, 168, 250, 0.4);
  border-radius: 20rpx;
  line-height: 80rpx;
  text-align: center;
  margin: 50rpx auto 0;
}


</style>
