<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" leftIcon=" " :title="i18n.tabBar.market" bgColor="#f3f4f6"></u-navbar>
    <!-- 市值排行 -->
    <view class="coin-section m-t">
      <view class="s-header">
        <view class="col">{{ i18n.market.title1 }}</view>
        <view class="col r">{{ i18n.market.title2 }}</view>
        <view class="col r">{{ i18n.market.title3 }}</view>
      </view>

      <view class="s-row little-line" v-for="(item, i) in marketList" :key="item.symbol">
        <view class="col light">
          <image :src="item.icon" class="coinLogo"></image>
          {{item.symbol}}
          <view class="subtitle">{{item.marketcap | formatMarketcap}}</view>
        </view>
        <view class="col r light">
          {{item.priceCny}}
          <view class="subtitle">${{item.priceUsd}}</view>
        </view>
        <view class="col r tag"><u-tag :text="item.changePercent | formatChange" :type="item.changePercent >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

    </view>
  </view>
</template>

<script>

import {commonI18n} from '@/common/language/mixin.js'
import {formatUnit} from '../../utils/number'


export default {
  components: {

  },
  mixins: [commonI18n],
  data () {
    return {
      marketList: [],
    }
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.tabBar.market
    })
    this.marketList = [
      {
        symbol: "BTC",
        fullName: "Bitcoin",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/BTC.png",
        change: 0.002639,
        changePercent: 0.26,
        marketcap: 512130521262,
        priceCny: 6.395,
        priceUsd: 1.0127,
        showPrecision: 4,
      },
      {
        symbol: "ETH",
        fullName: "Ethereum",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/ETH.png",
        change: 0.002639,
        changePercent: 0.26,
        marketcap: 512130521262,
        priceCny: 6.395,
        priceUsd: 1.0127,
        showPrecision: 4,
      },
      {
        symbol: "TRX",
        fullName: "TRX",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/TRX.png",
        change: -0.002639,
        changePercent: -0.26,
        marketcap: 512130521262,
        priceCny: 6.395,
        priceUsd: 1.0127,
        showPrecision: 4,
      },
      {
        symbol: "USDT",
        fullName: "USDT",
        icon: "https://aicloud-1311716982.cos.ap-chengdu.myqcloud.com/coin/USDT.png",
        change: -0.002639,
        changePercent: -0.26,
        marketcap: 512130521262,
        priceCny: 6.395,
        priceUsd: 1.0127,
        showPrecision: 4,
      },
    ]
  },
  methods: {

  },
  filters:{
    formatChange(v){
      return (v > 0 ? '+' : '') + parseFloat(v).toFixed(2) + '%'
    },
    formatMarketcap(v){
      return formatUnit(v);
    }
  },
}
</script>

<style lang="scss">
.container{
  padding-bottom: 100rpx;
  background-color: $uni-bg-color;
}
/* 市值排行 */
.coin-section{
  padding: 4rpx 30rpx 24rpx;
  background-color: #fff;
  .s-header{
    display:flex;
    align-items:center;
    height: 30rpx;
    line-height: 30rpx;
    padding-top: 30rpx;
    padding-bottom: 30rpx;
    .col{
      font-size: 20rpx;
      color: #8b9faa;
      flex:1;
    }
    .r{
      text-align: right;
    }
  }
  .s-row{
    display:flex;
    align-items:center;
    height: 120rpx;
    border-bottom: 1rpx solid #e6ebee;
    .subtitle{
      font-size: 12rpx;
      font-weight: normal;
      color: #8b9faa;
      padding: 8rpx 0 10rpx 0;
    }
    .col r tag{
      width: 100rpx;
      margin-left: 200rpx !important;
    }
    .u-tag--success {
      display:flex;
      align-items:center;
      color: #fff;
      background-color: #00b45a;
      border-width: 0.5px;
      border-style: solid;
      border-color: #00b45a;
      width: 160rpx;
      margin-left: 200rpx;
      float: right;
    }
    .u-tag--error {
      display:flex;
      align-items:center;
      color: #fff;
      background-color: #ff6059;
      border-width: 0.5px;
      border-style: solid;
      border-color: #ff6059;
      width: 160rpx;
      float: right;
    }
    .col{
      font-size: 20rpx;
      color: #157a0c;
      flex:1;
    }
    .coinLogo {
      width: 36rpx;
      height: 36rpx;
      margin-right: 16rpx;
      display: inline-block;
      vertical-align: middle;
      float: left;
    }
    .light{
      font-weight: bold;
      font-size: 32rpx;
      color: #000000;
    }
    .r{
      text-align: right;
    }
  }
}
</style>
