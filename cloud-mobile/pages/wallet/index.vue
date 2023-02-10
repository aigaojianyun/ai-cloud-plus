<template>
  <view>
    <Navbar :hideBtn="true" title="钱包" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
    <view class="container">
      <view class="total-box">
        <view class="title">余额</view>
        <view class="asset">
          <text class="amount">{{data}}</text>
          <text class="cny">≈${{data}}</text>
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
      data: {}
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
  padding: 0px 20px;
}
.total-box{
  background: url(../../static/images/wallet/wallet-bg.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  font-size: 14px;
  padding: 30px 15px 20px 15px;
  color: #8db3fe;
  .title{
    padding-bottom: 10px;
  }
  .amount{
    font-size: 20px;
    font-weight: 100px;
    color: #ffffff;
  }
  .cny{
    padding-left: 20px;
  }
  .operat{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: middle;
    padding-top: 40px;
    .btn{
      text-align: center;
      flex: 0 0 32%;
      height: 30px;
      line-height: 30px;
      color: #ffffff;
      background-color: rgba(255,255,255,0.08);
    }
  }
}
</style>


