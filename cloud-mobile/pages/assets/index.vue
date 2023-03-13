<template>
  <view class="container">

    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" leftIcon=" " :title="i18n.tabBar.assets"
              bgColor="#f3f4f6"></u-navbar>

    <view class="total-box">
      <view class="title">{{ i18n.assets.total }}(USDT)</view>
      <view class="asset">
        <text class="amount">${{ totalUsdAmount | fixed(4) }}</text>
        <text class="cny">≈￥{{ totalCnyAmount | fixed(4) }}</text>
      </view>
      <view class="operat">
        <view class="btn">{{ i18n.assets.recharge }}</view>
        <view class="btn">{{ i18n.assets.withdraw }}</view>
        <view class="btn">{{ i18n.assets.exchange }}</view>
      </view>
    </view>

    <view class="wrap">
      <view class="list" v-for="(item, i) in assetsList" :key="item.enName">
        <view class="title">
          <image class="image" :src="item.icon"></image>
          <view class="title">{{ item.enName }}</view>
        </view>
        <u-grid :col="3">
          <u-grid-item>
            <view class="grid-text">{{ i18n.assets.avalible }}</view>
            <view class="grid-M">{{ item.normalBalance | fixed(8) }}</view>
          </u-grid-item>
          <u-grid-item>
            <view class="grid-text">{{ i18n.assets.frozen }}</view>
            <view class="grid-M">{{ item.frozenBalance | fixed(8) }}</view>
          </u-grid-item>
          <u-grid-item>
            <view class="grid-text">{{ i18n.assets.amount }}(CNY)</view>
            <view class="grid-M">{{ item.priceCny | fixed(2) }}</view>
          </u-grid-item>
        </u-grid>
        <view class="line"></view>
      </view>
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
      assetsList: [],
      totalUsdAmount: 12648963.79,
      totalCnyAmount: 186624855663.45
    }
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.tabBar.assets
    })
    this.assetsList = [
      {
        fullName: "Bitcoin",
        enName: "BTC",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/BTC.png",
        normalBalance: 9.99,
        frozenBalance: 1.01,
        priceCny: 2448730.9179,
        priceUsd: 387770.3415
      },
      {
        fullName: "Ethereum",
        enName: "ETH",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/ETH.png",
        normalBalance: 8.99,
        frozenBalance: 1.01,
        priceCny: 16310.9179,
        priceUsd: 155226.3415,
      },
      {
        fullName: "TRX",
        enName: "TRX",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/TRX.png",
        normalBalance: 6.09,
        frozenBalance: 1.01,
        priceCny: 26312.9179,
        priceUsd: 1024.3415,
      },
      {
        fullName: "USDT",
        enName: "USDT",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/USDT.png",
        normalBalance: 1.99,
        frozenBalance: 1.01,
        priceCny: 8621.9179,
        priceUsd: 133.3415,
      },
    ]
  },
  created() {

  },
  methods: {}
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
  background: url(../../static/images/assets/assets-bg.png);
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


