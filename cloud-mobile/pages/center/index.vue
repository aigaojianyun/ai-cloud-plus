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
              <view class="vip-info-type">
                {{ user.userType == 1 ? '普通用户' : '会员用户' }}
              </view>
            </u-col>
            <u-col span="4">
              <view class="vip-info-button">
                <u-button  :text="user.vipType == 1  ? '开通会员' : user.vipEndTime"></u-button>
              </view>
            </u-col>
          </u-row>
        </view>
      </view>
    </view>
    <view class="cover-container">
      <view class="order-section">
        <view class="order-item"  hover-class="common-hover"  :hover-stay-time="50" @click="handleToNotice">
          <image class="icon" src="/static/images/my/icon-notice.png"></image>
          <text>公告</text>
        </view>
        <view class="order-item" hover-class="common-hover" :hover-stay-time="50" @click="handleToSign">
          <image class="icon" src="/static/images/my/icon-sign.png"></image>
          <text>签到</text>
        </view>
        <view class="order-item" hover-class="common-hover"  :hover-stay-time="50" @click="handleToLottery">
          <image class="icon" src="/static/images/my/icon-lottery.png"></image>
          <text>抽奖</text>
        </view>
        <view class="order-item"  hover-class="common-hover"  :hover-stay-time="50" @click="handleToRecommend">
          <image class="icon" src="/static/images/my/icon-recommend.png"></image>
          <text>推荐</text>
        </view>
      </view>
      <view class="history-section icon">
        <view @click="handleToBalance">
          <list-cell image="/static/images/my/icon-balance.png" iconColor="#e07472"  title="我的余额" ></list-cell>
        </view>
        <view @click="handleToAbout">
        <list-cell image="/static/images/my/icon-about.png" iconColor="#e07472"  title="关于我们" ></list-cell>
        </view>
        <view @click="handleToSetting">
        <list-cell image="/static/images/my/icon-setting.png" iconColor="#e07472"  title="应用设置" ></list-cell>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
import listCell from '@/components/mix-list-cell';
import {getUserInfo} from "@/api/user"
import UButton from "../../uni_modules/uview-ui/components/u-button/u-button";

export default {
  components: {
    UButton,
    Navbar,
    listCell
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
    // 跳转到公告
    handleToNotice() {
      this.$modal.showToast("敬请期待!")
    },
    // 跳转到签到
    handleToSign(){
      this.$modal.showToast("敬请期待!")
    },
    // 跳转到抽奖
    handleToLottery(){
      this.$modal.showToast("敬请期待!")
    },
    // 跳转到推荐
    handleToRecommend(){
      this.$modal.showToast("敬请期待!")
    },
    // 跳转到我的余额
    handleToBalance(){
      this.$tab.navigateTo('/pages/wallet/index')
    },
    // 跳转到关于我们
    handleToAbout(){
      this.$tab.navigateTo('/pages/center/about')
    },
    // 跳转到应用设置
    handleToSetting(){
      this.$tab.navigateTo('/pages/center/setting')
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
  min-height:90vh;
  height: auto;
  background-color: $u-page-color-base;
  padding-bottom: 100rpx;
}

.user-section {
  background-color: #1b66ff;
  height: 280rpx;
  padding: 0 30rpx 0;
  position: relative;
  margin: 0 30rpx 0 30rpx;
  border-radius: 20rpx;
}
.user-info-box {
  display: flex;
  justify-content: left;
  padding: 40rpx;
  max-width: 100%;

  &--name {
    font-size: 48rpx;
    width: 100%;
    color: #FFFFFF;
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
.vip-info-type {
  color: white;
  font-size: 20px;
}
.u-button{
  height: 60rpx;
  color: #dd524d;
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

.history-section{
  padding: 30rpx 0 0;
  margin-top: 20rpx;
  margin-bottom: 100rpx;
  background: #fff;
  border-radius:10rpx;
  .sec-header{
    display:flex;
    align-items: center;
    font-size: $u-font-base;
    color: $u-font-color-dark;
    line-height: 40rpx;
    margin-left: 30rpx;
    .yticon{
      font-size: 44rpx;
      color: #5eba8f;
      margin-right: 16rpx;
      line-height: 40rpx;
    }
  }
  .h-list{
    white-space: nowrap;
    padding: 30rpx 30rpx 0;
    image{
      display:inline-block;
      width: 160rpx;
      height: 160rpx;
      margin-right: 20rpx;
      border-radius: 10rpx;
    }
  }
}





</style>
