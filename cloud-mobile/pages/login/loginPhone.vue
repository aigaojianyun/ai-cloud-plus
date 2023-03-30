<!-- 验证码登录 -->
<template>
  <view class="login">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.login.loginPhone" bgColor="#f3f4f6" ></u-navbar>
    <view class="list">
      <view class="list-call">
        <view class="iconfont icon-shouji" style="font-size: 22px;color:#5473e8;"></view>
<!--        <u-field-->
<!--            v-model="phone"-->
<!--            label="+86"-->
<!--            placeholder="请填写手机号"-->
<!--            style="width: 100%;"-->
<!--            :border-bottom="false">-->
<!--        </u-field>-->
      </view>
      <div class="reg">
        还没有账号？
        <navigator class="reg-link" url="reg" open-type="navigate">立即注册</navigator>
      </div>
    </view>
    <view class="button" @click="nextStep()">
      <text>下一步</text>
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
      zone:'',
    };
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.login.login
    })
  },
  methods: {
    nextStep() {
      //验证码登录下一步
      uni.showLoading({
        title: '正在获取验证码',
        mask: true
      })
      this.$u.api.sendCode({
        phoneNo: this.phoneNo,
      }).then(res => {
        if (res.code == '200') {
          setTimeout(() => {
            uni.navigateTo({
              url: '/pages/login/code?phone=' + this.phone
            });
          }, 500);
        } else {
          this.$u.toast(res.msg);
          setTimeout(() => {
            uni.navigateTo({
              url: '/pages/login/code?phone=' + this.phone
            });
          }, 500);
        }
      });
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

.list-call .u-input {
  flex: 1;
  font-size: 39rpx;
  text-align: left;
  margin-left: 16rpx;
}

.list-call .u-icon-right {
  color: #aaaaaa;
  width: 50rpx;
  height: 40rpx;
}

.reg{
  padding:25rpx 0 0;
}

.reg-link{
  display: inline-block;
  color: #5473e8;
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
