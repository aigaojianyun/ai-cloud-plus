<template>
  <view>
    <Navbar :hideBtn="true" title="行情" bgColor="#fff" :h5Show="true" :fixed="false"></Navbar>
  <view class="container">
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
          210000
          <view class="subtitle">$30000</view>
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
          210000
          <view class="subtitle">$30000</view>
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
          210000
          <view class="subtitle">$30000</view>
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
          210000
          <view class="subtitle">$30000</view>
        </view>
        <view class="col r"><u-tag :text="0.71 | formatChange" :type="0.71 >= 0 ? 'success' : 'error'"></u-tag></view>
      </view>

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
  padding-bottom: 100px;
}
/* 市值排行 */
.coin-section{
  padding: 4px 30px 24px;
  background: #fff;
  .s-header{
    display:flex;
    align-items:center;
    height: 30px;
    line-height: 30px;
    padding-top: 30px;
    padding-bottom: 30px;
    .col{
      font-size: 10px;
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
    height: 60px;
    .subtitle{
      font-size: 12px;
      font-weight: normal;
      color: #00afff;
      padding: 4px 0 10px 0;
    }
    .u-tag--success {
      color: #fff;
      background-color: #00b45a;
      border-width: 0.25px;
      border-style: solid;
      border-color: #00b45a;
      width: 80px;
      float: right;
    }
    .u-tag--error {
      color: #fff;
      background-color: #ff6059;
      border-width: 0.25px;
      border-style: solid;
      border-color: #ff6059;
      width: 80px;
      float: right;
    }
    .col{
      font-size: 10px;
      color: #157a0c;
      flex:1;
    }
    .coinLogo {
      width: 18px;
      height: 18px;
      margin-right: 4px;
      display: inline-block;
      vertical-align: middle;
      float: left;
    }
    .light{
      font-weight: bold;
      font-size: 10px;
      color: #000000;
    }
    .r{
      text-align: right;
    }
  }
}
</style>
