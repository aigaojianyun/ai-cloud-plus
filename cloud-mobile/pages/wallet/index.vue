<template>
  <view>
    <Navbar :hideBtn="true" title="钱包" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
    <view class="container">
      <view class="Wallet">
        <view class="topWallet">
          <view class="title">
            <view class="">余额</view>
          </view>
          <view class="money">{{ data }}</view>
          <view class="about">≈{{ data }}</view>
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


