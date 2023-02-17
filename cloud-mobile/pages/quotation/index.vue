<template>
  <view class="container">
    <Navbar :hideBtn="true" title="行情" bgColor="#fff" :h5Show="true" :fixed="false"></Navbar>
    <!-- 市值排行 -->
    <view class="coin-section m-t">
      <view class="s-header">
        <view class="col">币种/流通市值</view>
        <view class="col r">全球指数</view>
        <view class="col r">24小时涨幅</view>
      </view>

      <view class="s-row little-line">
        <view class="col light">
          <image src="/static/images/coin/BTC.png" class="coinLogo"></image>
          BTC
          <view class="subtitle">4.65MB</view>
        </view>
        <view class="col r light">
          210000.36
          <view class="subtitle">$29832.63</view>
        </view>
        <view class="col r"><u-tag :text="0.71 | formatChange" :type="0.71 >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

      <view class="s-row little-line">
        <view class="col light">
          <image src="/static/images/coin/ETH.png" class="coinLogo"></image>
          ETH
          <view class="subtitle">4.65MB</view>
        </view>
        <view class="col r light">
          1963.36
          <view class="subtitle">$120.63</view>
        </view>
        <view class="col r"><u-tag :text="0.71 | formatChange" :type="0.71 >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

      <view class="s-row little-line">
        <view class="col light">
          <image src="/static/images/coin/TRX.png" class="coinLogo"></image>
          TRX
          <view class="subtitle">4.65MB</view>
        </view>
        <view class="col r light">
          1.36
          <view class="subtitle">$0.63</view>
        </view>
        <view class="col r"><u-tag :text="-0.71 | formatChange" :type="-0.71 >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

      <view class="s-row little-line">
        <view class="col light">
          <image src="/static/images/coin/USDT.png" class="coinLogo"></image>
          USDT
          <view class="subtitle">4.65MB</view>
        </view>
        <view class="col r light">
         1.36
          <view class="subtitle">$0.063</view>
        </view>
        <view class="col r"><u-tag :text="0.71 | formatChange" :type="0.71 >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

    </view>
  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'

export default {
  components: {
    Navbar,
  },
  data () {
    return {

    }
  },
  filters:{
    formatChange(v){
      return (v > 0 ? '+' : '') + parseFloat(v).toFixed(2) + '%'
    }
  },
}
</script>

<style lang="scss">
.container{
  padding-bottom: 100rpx;
  background-color: $u-page-color-base;
}
/* 市值排行 */
.coin-section{
  padding: 4rpx 30rpx 24rpx;
  background: #fff;
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
    .col r{
      width: 100rpx;
      margin-left: 200rpx !important;
    }
    .u-tag--success {
      color: #fff;
      background-color: #00b45a;
      border-width: 0.5px;
      border-style: solid;
      border-color: #00b45a;
      width: 160rpx;
      margin-left: 200rpx;
      float: right;
      .u-tag--medium{
        width: 100rpx;
      }
    }
    .u-tag--error {
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
