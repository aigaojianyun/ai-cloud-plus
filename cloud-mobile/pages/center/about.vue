<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.my.about" bgColor="#f3f4f6"></u-navbar>
    <view class="logo">
      <image src="/static/logo.png" mode="widthFix"></image>
    </view>
    <view class="list-cell b-b m-t" hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.about.version }}</text>
      <text class="cell-tip">1.0.0</text>
      <text class="cell-more yticon icon-you"></text>
    </view>
    <view class="list-cell b-b" hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.about.mailbox }}</text>
      <text class="cell-tip">aicloud888@163.com</text>
      <text class="cell-more yticon icon-you"></text>
    </view>
    <view class="list-cell b-b" hover-class="cell-hover" :hover-stay-time="50">
      <text class="cell-tit">{{ i18n.about.serve }}</text>
      <text class="cell-tip">13888888888</text>
      <text class="cell-more yticon icon-you"></text>
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
      title: this.i18n.my.about
    })
  },
  created() {

  },
  methods: {}
}

</script>

<style lang='scss' scoped>
.logo{
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 60rpx;
  padding-bottom: 60rpx;
  image{
    width: 200rpx;
  }
}
.list-cell{
  display:flex;
  align-items:baseline;
  padding: 20rpx 30rpx;
  line-height:80rpx;
  position:relative;
  background-color: #fff;
  justify-content: center;
  border-bottom: 0.5px solid #e6ebee;
  &.log-out-btn{
    margin-top: 40rpx;
    .cell-tit{
      color: $uni-color-primary;
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


