<template>
    <view class="container">
      <Navbar :hideBtn="true" title="关于我们" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
      <view class="logo">
        <image src="/static/logo.png" mode="widthFix"></image>
      </view>
      <view class="list-cell b-b m-t"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">版本信息</text>
        <text class="cell-tip">1.0.0</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">官方邮箱</text>
        <text class="cell-tip">aicloud888@163.com</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">服务热线</text>
        <text class="cell-tip">13888888888</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
    </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
export default {
  components: {
    Navbar
  },
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
  padding: 20rpx $u-page-row-spacing;
  line-height:80rpx;
  position:relative;
  background: #fff;
  justify-content: center;
  &.log-out-btn{
    margin-top: 40rpx;
    .cell-tit{
      color: $uni-color-primary;
      text-align: center;
      margin-right: 0;
    }
  }
  &.cell-hover{
    background:#fafafa;
  }
  &.b-b:after{
    left: 30rpx;
  }
  &.m-t{
    margin-top: 16rpx;
  }
  .cell-more{
    align-self: baseline;
    font-size:$u-font-lg;
    color:$u-font-color-light;
    margin-left:10rpx;
  }
  .cell-tit{
    flex: 1;
    font-size: $u-font-md + 2rpx;
    color: $u-font-color-dark;
    margin-right:10rpx;
  }
  .cell-tip{
    font-size: $u-font-md;
    color: $u-font-color-light;
  }
  switch{
    transform: translateX(16rpx) scale(.84);
  }
}
</style>

