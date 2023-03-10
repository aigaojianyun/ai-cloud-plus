<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" leftText="返回" title="应用设置" bgColor="#f3f4f6" ></u-navbar>
      <view class="list-cell b-b m-t"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">登录密码</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b "  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">交易密码</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">检查更新</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell log-out-btn" @click="handleLogout">
        <text class="cell-tit">退出登录</text>
      </view>
  </view>
</template>

<script>

export default {
  components: {

  },
  data() {
    return {
    }
  },
  created() {
  },
  methods: {
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
    width: 60%;
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

