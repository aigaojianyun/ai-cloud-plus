<template>
  <view class="container">
    <Navbar :hideBtn="true" title="我的" bgColor="#fff" :h5Show="true" :fixed="false"></Navbar>
    <view class="user-section">
      <view class="user-info-box">
        <view>
          <u-avatar :src="user.headImg" size="120rpx"></u-avatar>
        </view>
        <view>
          <view class="user-info-box--name">{{  user.nickName }}</view>
          <text class="user-info-box--account">{{ user.phone  == null? '':user.phone }}</text>
        </view>
      </view>
      <view class="vip-section">
        <view class="vip-info-box">
          <u-row>
            <u-col span="8">
              <view style="color: white; font-size: 20px;">
                {{ user.userType == 1 ? '普通用户' : '会员用户' }}
              </view>
            </u-col>
            <u-col span="4">
              <u-button icon="" text="" style="height: 36px;">{{ user.vipType == 1 ? '开通会员' : user.vipEndTime }}</u-button>
            </u-col>
          </u-row>
        </view>
      </view>
    </view>
    <view class="cover-container">
      <view class="order-section">
        <view class="order-item"  hover-class="common-hover"  :hover-stay-time="50" @click="handleToWallet">
          <image class="icon" src="/static/images/my/icon-wallet.png"></image>
          <text>钱包</text>
        </view>
        <view class="order-item" hover-class="common-hover" :hover-stay-time="50">
          <image class="icon" src="/static/images/my/icon-sign.png"></image>
          <text>签到</text>
        </view>
        <view class="order-item" hover-class="common-hover"  :hover-stay-time="50">
          <image class="icon" src="/static/images/my/icon-lottery.png"></image>
          <text>抽奖</text>
        </view>
        <view class="order-item"  hover-class="common-hover"  :hover-stay-time="50">
          <image class="icon" src="/static/images/my/icon-recomment.png"></image>
          <text>推荐</text>
        </view>
      </view>
    </view>

    <view style="padding: 40rpx; margin-top: 500rpx;">
      <u-row gutter="32">
        <u-col span="6">
          <u-button icon="phone" text="联系我们" plain></u-button>
        </u-col>
        <u-col span="6">
          <u-button icon="reload" text="退出" type="error" @click="handleLogout"></u-button>
        </u-col>
      </u-row>
    </view>


  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
import {getUserInfo} from "@/api/user"

export default {
  components: {
    Navbar
  },
  data() {
    return {
      user: {}
    }
  },
  created() {
    this.getInfo()
  },
  methods: {
    // 跳转到钱包
    handleToWallet() {
      this.$tab.navigateTo('/pages/wallet/index')
    },
    // 获取用户详细信息
    getInfo() {
      getUserInfo().then(response => {
        this.user = response.data
      })
    },
    // 退出登录
    handleLogout() {
      this.$modal.confirm('确定注销并退出系统吗？').then(() => {
        this.$store.dispatch('LogOut').then(() => {
          this.$tab.reLaunch('/pages/login/login')
        })
      })
    }
  }
}
</script>

<style lang="scss">
%flex-center {
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
%section {
  display:flex;
  justify-content: space-around;
  align-content: center;
  background: #fff;
  border-radius: 10rpx;
}
.container{
  width: 100%;
  background-color: $u-page-color-base;
  padding-bottom: 100rpx;
}

.user-section {
  background-color: #1b66ff;
  height: 280rpx;
  padding: 0 30rpx 0;
  position: relative;
  margin: 0 30rpx 0 30rpx;
  border-radius: 10px;
}
.user-info-box {
  display: flex;
  justify-content: left;
  padding: 40rpx;
  max-width: 100%;
  color: #303133;

  &--name {
    font-size: 46rpx;
    font-weight: bold;
    width: 100%
  }

  &--account {
    font-size: 26rpx;
    color: #909399;
  }

}

.vip-section{

}
.vip-info-box {
  height: 140rpx;
  line-height: 140rpx;
  padding: 0px 40rpx;
  background-color: #1e1e1e;
  border-radius: 32rpx 32rpx 0 0;
  box-shadow: 0 32rpx 52rpx rgba(0, 0, 0, .8);
}

.cover-container{
  background: #1e1e1e;
  padding: 0 30rpx;
  position:relative;
  background: #f5f5f5;
}
.order-section{
  @extend %section;
  padding: 28rpx 0;
  margin-top: 80rpx;
  .order-item{
    @extend %flex-center;
    width: 120rpx;
    height: 120rpx;
    border-radius: 10rpx;
    font-size: 20rpx;
    color: #1e1e1e;
  }
  .icon{
    width: 58rpx;
    height: 58rpx;
    margin-bottom: 10rpx;
  }
}






</style>
