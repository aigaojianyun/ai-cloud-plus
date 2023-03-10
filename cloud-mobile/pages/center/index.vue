<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" leftIcon=" " :title="i18n.tabBar.me" bgColor="#f3f4f6"></u-navbar>

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
                {{ user.userType == 1 ? i18n.my.normal : i18n.my.member }}
              </view>
            </u-col>
            <u-col span="4">
              <view class="vip-info-button">
                <u-button  :text="user.vipType == 1  ? i18n.my.vip : user.vipEndTime"></u-button>
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
          <text>{{i18n.my.notice}}</text>
        </view>
        <view class="order-item" hover-class="common-hover" :hover-stay-time="50" @click="handleToSign">
          <image class="icon" src="/static/images/my/icon-sign.png"></image>
          <text>{{i18n.my.sign}}</text>
        </view>
        <view class="order-item" hover-class="common-hover"  :hover-stay-time="50" @click="handleToLottery">
          <image class="icon" src="/static/images/my/icon-lottery.png"></image>
          <text>{{i18n.my.reward}}</text>
        </view>
        <view class="order-item"  hover-class="common-hover"  :hover-stay-time="50" @click="handleToRecommend">
          <image class="icon" src="/static/images/my/icon-recommend.png"></image>
          <text>{{i18n.my.recomment}}</text>
        </view>
      </view>
      <view class="history-section icon">
        <view @click="handleToBalance">
          <list-cell image="/static/images/my/icon-balance.png" iconColor="#e07472"  :title="i18n.my.balance" ></list-cell>
        </view>
        <view @click="handleToAbout">
          <list-cell image="/static/images/my/icon-about.png" iconColor="#e07472"  :title="i18n.my.about" ></list-cell>
        </view>
        <view @click="handleToLang">
          <list-cell image="/static/images/my/icon-language.png" iconColor="#e07472"  :title="i18n.my.lang" ></list-cell>
        </view>
        <view @click="handleToSetting">
        <list-cell image="/static/images/my/icon-setting.png" iconColor="#e07472"  :title="i18n.my.set" ></list-cell>
        </view>
      </view>
    </view>

    <u-action-sheet :cancelText="i18n.common.cancel" :actions="langList" :show="showLang" @select="clickLang"></u-action-sheet>

  </view>
</template>

<script>

import listCell from '@/components/mix-list-cell';
import {commonMixin} from '@/common/mixin/mixin.js'
import {getUserInfo} from "@/api/user"

export default {
  components: {
    listCell,
  },
  mixins: [commonMixin],
  data() {
    return {
      user: {},
      showLang: false,
      langList: []
    }
  },
  onShow(){
    uni.setNavigationBarTitle({
      title: this.i18n.tabBar.me
    })
    this.langList = [{
      name: this.i18n.common.lang.en,
      lang: 'en_US'
    }, {
      name: this.i18n.common.lang.zh,
      lang: 'zh_CN'
    }]
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
      this.$tab.navigateTo('/pages/balance/index')
    },
    // 跳转到关于我们
    handleToAbout(){
      this.$tab.navigateTo('/pages/center/about')
    },
    // 打开系统语言设置
    handleToLang(){
      this.showLang = true
    },
    clickLang(index){
      let lang = index.lang
      console.log(lang);
      uni.setStorageSync('language', lang);
      // 改变在main.js中定义的locale
      this._i18n.locale = lang;
      uni.setTabBarItem({
        index: 0,
        text: this.$t('message').tabBar.home
      })
      uni.setTabBarItem({
        index: 1,
        text: this.$t('message').tabBar.assets
      })
      uni.setTabBarItem({
        index: 2,
        text: this.$t('message').tabBar.market
      })
      uni.setTabBarItem({
        index: 3,
        text: this.$t('message').tabBar.me
      })
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
    }
  }
}
</script>

<style lang="scss">
.container{
  width: 100%;
  min-height:90vh;
  height: auto;
  background-color: #f8f8f8;
  padding-bottom: 100rpx;
}
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
  background-color: #ffffff;
  border-radius: 10rpx;
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
  padding: 0 30rpx;
  position:relative;
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
  background-color: #fff;
  border-radius:10rpx;
  .sec-header{
    display:flex;
    align-items: center;
    font-size: 28rpx;
    color: #14191F;
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
