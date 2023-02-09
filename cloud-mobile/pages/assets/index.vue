<template>
  <view>
    <Navbar :hideBtn="true" title="资产" bgColor="#fff" :h5Show="true" :fixed="false"></Navbar>
    <view class="container">
      <view class="Wallet">
        <view class="topWallet">
          <view class="title">
            <view class="">总资产约(合USDT)</view>
          </view>
          <view class="money">964522121.44777</view>
          <view class="about">≈964522121.45</view>
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
  width: 750rpx;
  min-height: 100vh;
  height: auto;
  background: #eeeeee;

  .line {
    margin: 20rpx auto;
    width: 92%;
    height: 1px;
    background: #d0d0d0;
  }

  .wrap {
    margin: 330rpx auto;
    width: 92%;

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

  .Wallet {
    position: fixed;
    top: 80rpx;
    width: 100%;
    //height: 310rpx;
    z-index: 1000;
    background: #eeeeee;
    border-radius: 15rpx;

    .topWallet {
      border-radius: 15rpx;
      line-height: 68rpx;
      padding: 40rpx 0;
      background: #e26060;

      .title {
        display: flex;
        padding-left: 34rpx;
      }

      .money {
        padding-left: 34rpx;
        font-size: 42rpx;
        font-weight: bold;
      }

      .about {
        padding-left: 34rpx;
      }
    }

  }
}
</style>


