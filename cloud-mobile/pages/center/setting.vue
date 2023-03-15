<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.my.set" bgColor="#f3f4f6"></u-navbar>
    <view class="list-cell b-b m-t" hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.set.loginpwd }}</text>
      <text class="cell-more yticon icon-you"></text>
    </view>
    <view class="list-cell b-b " hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.set.paypwd }}</text>
      <text class="cell-more yticon icon-you"></text>
    </view>
    <view class="list-cell b-b" hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.set.renew }}</text>
      <text class="cell-more yticon icon-you"></text>
    </view>
    <view class="list-cell log-out-btn" @click="handleLogout">
      <text class="cell-tit">{{ i18n.set.out }}</text>
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
      data: {},
      autoplay: true
    }
  },
  onShow() {
    uni.setNavigationBarTitle({
      title: this.i18n.my.set
    })
  },
  methods: {
    // 退出登录
    handleLogout() {
      this.$modal.confirm(this.i18n.set.outfirm).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          this.$tab.reLaunch('/pages/login/login')
        })
      })
    }
  }
}
</script>

<style lang='scss' scoped>
page{
  background-color: $uni-bg-color;
}
.list-cell{
  display:flex;
  align-items:baseline;
  padding: 20rpx 30rpx;
  line-height:60rpx;
  position:relative;
  background-color: #fff;
  justify-content: center;
  border-bottom: 0.5px solid #e6ebee;
  &.log-out-btn{
    margin: 60rpx auto;
    width: 80%;
    border: 1px solid #14191f;
    border-radius: 20rpx;
    .cell-tit{
      color: #dd524d;
      text-align: center;
      margin-right: 0;
    }
  }
  &.cell-hover{
    background-color:#fafafa;
  }
  &.b-b:after{
    left: 30rpx;
  }
  &.m-t{
    margin-top: 16rpx;
  }
  .cell-more{
    align-self: baseline;
    font-size:34rpx;
    color: #2479a8;
    margin-left:10rpx;
  }
  .cell-tit{
    flex: 1;
    font-size: 30rpx + 2rpx;
    color: #14191f;
    margin-right:10rpx;
  }
  .cell-tip{
    font-size: 30rpx;
    color: #8b9Faa;
  }
  switch{
    transform: translateX(16rpx) scale(.84);
  }
}
</style>

