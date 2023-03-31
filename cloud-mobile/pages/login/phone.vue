<!-- 验证码登录 -->
<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.login.loginPhone.title" bgColor="#f3f4f6" ></u-navbar>
    <view class="list">
      <view class="list-call">
        <u-input :placeholder="i18n.login.loginPhone.phone" v-model="loginPhone.phone">
          <u--text :text="loginPhone.zone" slot="prefix" margin="0 3px 0 0" type="tips"></u--text>
        </u-input>
      </view>
    </view>
    <view class="button" @click="nextStep()">
      <text>{{i18n.login.loginPhone.next}}</text>
    </view>
  </view>
</template>

<script>

import {commonMixin} from '@/common/mixin/mixin.js'
import {getCountry,getCode} from "@/api/resource/resource"

export default {
  components: {

  },
  mixins: [commonMixin],
  data() {
    return {
      loginPhone:{
        phone: '13888888888',
        zone:'+86',
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
    nextStep() {
      setTimeout(() => {
        this.$tab.navigateTo('/pages/login/code?phone=' + this.loginPhone.phone +'&zone='+ this.loginPhone.zone)
      }, 500);
      //验证码登录下一步
      this.$modal.msgLoading(this.i18n.login.loginPhone.nextCode)
      getCode(this.loginPhone).then(res => {
        if (res.data.code == '200') {
          setTimeout(() => {
            this.$tab.navigateTo('/pages/login/code?phone=' + this.loginPhone.phone +'&zone='+ this.loginPhone.zone)
          }, 500);
        } else {
          this.$modal.showToast(res.msg);
        }
      });
    },
    onSelect(index) {
      this.selectedOption = this.options[index]
    }
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
