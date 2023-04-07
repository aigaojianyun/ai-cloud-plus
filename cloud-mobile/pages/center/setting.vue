<template>
  <view class="container">
      <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
                :title="i18n.my.set" bgColor="#f3f4f6"></u-navbar>
      <view class="list-cell">
        <u-cell-group>
            <!-- 登录密码 -->
            <view @click="">
              <u-cell  icon="lock-fill" size="large" :title="i18n.set.loginpwd" :isLink="true"></u-cell>
            </view>
            <!-- 支付密码 -->
            <view @click="">
              <u-cell icon="lock-fill" size="large" :title="i18n.set.paypwd" :isLink="true"></u-cell>
            </view>
            <!-- 检查更新 -->
            <view @click="">
              <u-cell icon="reload" size="large" :title="i18n.set.renew" :isLink="true"></u-cell>
            </view>
        </u-cell-group>
    </view>
      <!-- 退出登录 -->
      <button  class="log-out-btn" @click="handleLogout">{{ i18n.set.out }}</button>
  </view>
</template>

<script>

import {commonI18n} from '@/common/language/mixin.js'

export default {
  components: {},
  mixins: [commonI18n],
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
.container{
  background-color: $uni-bg-color;
}

.log-out-btn{
  margin: 60rpx auto;
  background-color: #dd524d;
  width: 70%;
  border: 1px solid #ea2424;
  border-radius: 20rpx;
}

</style>

