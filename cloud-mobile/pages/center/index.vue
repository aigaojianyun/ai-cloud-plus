<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" leftIcon=" " :title="i18n.tabBar.me"
              bgColor="#f3f4f6"></u-navbar>

    <view class="user-section">
      <!-- 我的 -->
      <view class="user-info-box">
        <view>
          <u-avatar :src="user.headImg" size="120rpx"></u-avatar>
        </view>
        <view>
          <view class="user-info-box--name">{{ user.nickName }}</view>
          <text class="user-info-box--account">{{ user.userName }}</text>
        </view>
      </view>
      <!-- 会员 -->
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
                <u-button :text="user.vipType == 1  ? i18n.my.vip : user.vipEndTime"></u-button>
              </view>
            </u-col>
          </u-row>
        </view>
      </view>
    </view>
    <view class="cover-container">
      <view class="order-section">
        <!-- 公告 -->
        <view class="order-item" :hover-stay-time="50" @click="handleToNotice">
          <image class="icon" src="/static/images/my/icon-notice.png"></image>
          <text>{{ i18n.my.notice }}</text>
        </view>
        <!-- 签到 -->
        <view class="order-item"  :hover-stay-time="50" @click="handleToSign">
          <image class="icon" src="/static/images/my/icon-sign.png"></image>
          <text>{{ i18n.my.sign }}</text>
        </view>
        <!-- 抽奖 -->
        <view class="order-item"  :hover-stay-time="50" @click="handleToLottery">
          <image class="icon" src="/static/images/my/icon-lottery.png"></image>
          <text>{{ i18n.my.reward }}</text>
        </view>
        <!-- 推荐 -->
        <view class="order-item"  :hover-stay-time="50" @click="handleToRecommend">
          <image class="icon" src="/static/images/my/icon-recommend.png"></image>
          <text>{{ i18n.my.recomment }}</text>
        </view>
      </view>
      <view class="list-cell">
        <u-cell-group>
          <!-- 会员等级 -->
          <view @click="">
            <u-cell icon="integral-fill" size="large" :title="i18n.my.vipLv"  :value="i18n.my.lv" :isLink="true"></u-cell>
          </view>
          <!-- 我的余额 -->
          <view @click="handleToBalance">
          <u-cell icon="/static/images/my/icon-balance.png" size="large" :title="i18n.my.balance" :isLink="true"></u-cell>
          </view>
          <!-- 关于我们 -->
          <view @click="handleToAbout">
            <u-cell icon="/static/images/my/icon-about.png" size="large" :title="i18n.my.about" :isLink="true"></u-cell>
          </view>
          <!-- 系统语言 -->
          <view @click="handleToLang">
            <u-cell icon="/static/images/my/icon-language.png" size="large" :title="i18n.my.lang" :isLink="true"></u-cell>
          </view>
          <!-- 应用设置 -->
          <view @click="handleToSetting">
            <u-cell icon="/static/images/my/icon-setting.png" size="large" :title="i18n.my.set" :isLink="true"></u-cell>
          </view>
        </u-cell-group>
      </view>
    </view>
    <u-action-sheet :actions="langList" :show="showLang" @select="clickLang" :cancelText="i18n.common.cancel"
                    @close="showLang = false"></u-action-sheet>
  </view>
</template>

<script>

import lang from '@/common/language/lang'
import {commonI18n} from '@/common/language/mixin.js'
import {getUserInfo} from "@/api/center/user"

export default {
  components: {
  },
  mixins: [commonI18n],
  data() {
    return {
      user: {},
      showLang: false,
      langList: []
    }
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.tabBar.me
    })
    this.langList = [{
      name: this.i18n.common.lang.en_US,
      lang: lang.EN_US
    }, {
      name: this.i18n.common.lang.zh_CN,
      lang: lang.ZH_CN
    }, {
      name: this.i18n.common.lang.zh_TW,
      lang: lang.ZH_TW
    }]
    this.getInfo()
  },
  methods: {
    // 跳转到公告
    handleToNotice() {
      this.$modal.showToast(this.i18n.common.coming)
    },
    // 跳转到签到
    handleToSign() {
      this.$modal.showToast(this.i18n.common.coming)
    },
    // 跳转到抽奖
    handleToLottery() {
      this.$modal.showToast(this.i18n.common.coming)
    },
    // 跳转到推荐
    handleToRecommend() {
      this.$modal.showToast(this.i18n.common.coming)
    },
    // 跳转到我的余额
    handleToBalance() {
      this.$tab.navigateTo('/pages/balance/index')
    },
    // 跳转到关于我们
    handleToAbout() {
      this.$tab.navigateTo('/pages/center/about')
    },
    // 打开系统语言设置
    handleToLang() {
      this.showLang = true
    },
    // 语言切换
    clickLang(index) {
      let lang = index.lang
      uni.setStorageSync('language', lang);
      // 改变在main.js中定义的locale
      this._i18n.locale = lang;
      console.log(lang);
      uni.setTabBarItem({
        index: 0,
        text: this.$t('message').tabBar.home
      })
      uni.setTabBarItem({
        index: 1,
        text: this.$t('message').tabBar.market
      })
      uni.setTabBarItem({
        index: 2,
        text: this.$t('message').tabBar.assets
      })
      uni.setTabBarItem({
        index: 3,
        text: this.$t('message').tabBar.me
      })
    },
    // 跳转到应用设置
    handleToSetting() {
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
  background: url(../../static/images/my/personal-bg.png);
  background-size: 100% 100%;
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
    color: #ffffff;
  }

  &--account {
    font-size: 26rpx;
    color: #e6ebee;
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

.list-cell{
  margin-top: 30rpx;
  background-color: #fff;
  border-radius:10rpx;
}

</style>
