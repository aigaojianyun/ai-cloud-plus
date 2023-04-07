<template>
  <view class="container">
    <u-navbar :safeAreaInsetTop="true" :placeholder="true" :fixed="true" :autoBack="true" :leftText="i18n.common.regain"
              :title="i18n.my.about" bgColor="#f3f4f6"></u-navbar>
    <view class="logo">
      <image src="/static/logo.png" mode="widthFix"></image>
    </view>
    <view class="list-cell">
      <u-cell-group>
        <!-- 版本信息 -->
          <view @click="">
            <u-cell   size="large" :title="i18n.about.version" value="1.0.0"></u-cell>
          </view>
          <!-- 官方邮箱 -->
          <view @click="">
            <u-cell  size="large" :title="i18n.about.mailbox" value="aicloud888@163.com"></u-cell>
          </view>
          <!-- 服务热线-->
          <view @click="">
            <u-cell  size="large" :title="i18n.about.serve" value="13888888888"></u-cell>
          </view>
      </u-cell-group>
    </view>
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
      title: this.i18n.my.about
    })
  },
  methods: {

  }
}

</script>

<style lang='scss' scoped>
.container{
  background-color: $uni-bg-color;
}

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

</style>


