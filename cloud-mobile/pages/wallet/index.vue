<template>
  <view>
    <Navbar :hideBtn="true" title="钱包" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
    <view class="container">
      <view class="total-box">
        <view class="title">余额</view>
        <view class="asset">
          <text class="amount">
            <u-count-to :startVal="0" :endVal="data.availableBalance" separator="," :decimals="4" color="#ffffff"></u-count-to>
          </text>
        </view>
        <view class="operat">
          <view class="btn" >充值</view>
          <view class="btn" >提现</view>
          <view class="btn" >兑换</view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
import {getWallet} from "@/api/account"

export default {
  components: {
    Navbar
  },
  data() {
    return {
      data: {},
      autoplay: true
    }
  },
  created() {
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
  padding: 0 40rpx;
}
.total-box{
  background: url(../../static/images/wallet/wallet-bg.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  font-size: 20px;
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


