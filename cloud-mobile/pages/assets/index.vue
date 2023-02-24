<template>
<view class="container">
  <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" leftIcon=" " title="资产" bgColor="#f3f4f6"></u-navbar>
  <view class="total-box">
        <view class="title">总资产约(合USDT)</view>
        <view class="asset">
          <text class="amount">906.62311</text>
          <text class="cny">≈$123.23</text>
        </view>
        <view class="operat">
          <view class="btn" >充币</view>
          <view class="btn" >提币</view>
          <view class="btn" >兑换</view>
        </view>
      </view>
  <view class="wrap">
        <view class="list">
          <view class="title">
            <image class="image" mode="" src="/static/images/coin/BTC.png"></image>
            <view class="title">BTC</view>
          </view>
          <u-grid :col="3">
            <u-grid-item>
              <view class="grid-text">可用</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">冻结</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">待释放</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
          </u-grid>
          <view class="line"></view>
        </view>

        <view class="list">
          <view class="title">
          <image class="image" mode="" src="/static/images/coin/ETH.png"></image>
          <view class="title">ETH</view>
          </view>
          <u-grid :col="3">
            <u-grid-item>
              <view class="grid-text">可用</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">冻结</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">待释放</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
          </u-grid>
          <view class="line"></view>
        </view>

        <view class="list">
          <view class="title">
          <image class="image" mode="" src="/static/images/coin/USDT.png"></image>
          <view class="title">USDT</view>
          </view>
          <u-grid :col="3">
            <u-grid-item>
              <view class="grid-text">可用</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">冻结</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">待释放</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
          </u-grid>
          <view class="line"></view>
        </view>

        <view class="list">
          <view class="title">
            <image class="image" mode="" src="/static/images/coin/TRX.png"></image>
            <view class="title">TRX</view>
          </view>
          <u-grid :col="3">
            <u-grid-item>
              <view class="grid-text">可用</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">冻结</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">待释放</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
          </u-grid>
          <view class="line"></view>
        </view>

        <view class="list">
          <view class="title">
            <image class="image" mode="" src="/static/images/coin/BNB.png"></image>
            <view class="title">BNB</view>
          </view>
          <u-grid :col="3">
            <u-grid-item>
              <view class="grid-text">可用</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">冻结</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
            <u-grid-item>
              <view class="grid-text">待释放</view>
              <view class="grid-M">0.456852</view>
            </u-grid-item>
          </u-grid>
          <view class="line"></view>
        </view>

      </view>
</view>
</template>

<script>

export default {
  components: {

  },
  data() {
    return {
    }
  },
  created() {

  },
  methods: {

  }
}

</script>

<style lang="scss">
.container {
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
      font-size: 20px;
      font-weight: 100rpx;
      color: #ffffff;
    }
    .cny{
      padding-left: 20rpx;
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

.wrap {
    margin: 60rpx auto;
    width: 98%;
    .list {
      .title {
        line-height: 40rpx;
        font-weight: bold;
        display: flex;
        .image {
          width: 40rpx;
          height: 40rpx;
        }
      }

    }
}

.line {
  margin: 20rpx auto;
  width: 98%;
  height: 1px;
  background: #d0d0d0;
}

</style>


