<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.my.balance" bgColor="#f3f4f6"></u-navbar>
    <view class="total-box">
      <view class="title">{{ i18n.balance.available }}</view>
      <view class="asset">
        <text class="amount">
          <u-count-to :startVal="0" :endVal="data.availableBalance" separator="," :decimals="4"
                      color="#ffffff"></u-count-to>
        </text>
      </view>
      <view class="operat">
        <view class="btn">{{ i18n.balance.recharge }}</view>
        <view class="btn">{{ i18n.balance.withdraw }}</view>
        <view class="btn">{{ i18n.balance.exchange }}</view>
      </view>
    </view>
  </view>
</template>

<script>

import {commonI18n} from '@/common/language/mixin.js'
import {getWallet} from "@/api/balance/account"

export default {
  components: {},
  mixins: [commonI18n],
  data() {
    return {
      data: {},
      autoplay: true
    }
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.my.balance
    })
    this.getWallet()
  },
  methods: {
    // 获取钱包余额
    getWallet() {
      getWallet().then(response => {
        this.data = response.data
      })
    },
  }
}

</script>

<style lang="scss">
.container{
  padding: 0px 10px;
  min-height: 100vh;
  height: auto;
  background-color: $uni-bg-color;
}
.total-box{
  background: url(../../static/images/wallet/wallet-bg.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  font-size: 10px;
  padding: 60rpx 30rpx 40rpx 30rpx;
  color: #8db3fe;
  .title{
    padding-bottom: 10rpx;
  }
  .amount{
    font-size: 40rpx;
    font-weight: 100rpx;
  }
  .operat{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: middle;
    padding-top: 40rpx;
    .btn{
      text-align: center;
      flex: 0 0 32%;
      height: 60rpx;
      line-height: 60rpx;
      color: #ffffff;
      background-color: rgba(255,255,255,0.08);
    }
  }
}
</style>


