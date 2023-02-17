<template>
  <view class="container">
      <Navbar :hideBtn="true" title="应用设置" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
      <view class="list-cell b-b m-t"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">修改密码</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b"  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">检查更新</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell b-b "  hover-class="cell-hover" :hover-stay-time="50">
        <text class="cell-tit">系统语言</text>
        <text class="cell-more yticon icon-you"></text>
      </view>
      <view class="list-cell log-out-btn" @click="handleLogout">
        <text class="cell-tit">退出登录</text>
      </view>
  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'

export default {
  components: {
    Navbar
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
  background: $u-page-color-base;
}
.list-cell{
  display:flex;
  align-items:baseline;
  padding: 20rpx $u-page-row-spacing;
  line-height:60rpx;
  position:relative;
  background: #fff;
  justify-content: center;
  border-bottom: 0.5px solid #e6ebee;
  &.log-out-btn{
    margin: 44rpx auto;
    width: 80%;
    border-radius: 20rpx;
    .cell-tit{
      color: $u-color-primary;
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
    font-size: $u-font-base + 2rpx;
    color: $u-font-color-dark;
    margin-right:10rpx;
  }
  .cell-tip{
    font-size: $u-font-base;
    color: $u-font-color-light;
  }
  switch{
    transform: translateX(16rpx) scale(.84);
  }
}
</style>

