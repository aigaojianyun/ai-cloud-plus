<template>
  <view>
    <uni-card :title="title" class="view-title">
      <text class="uni-body view-content">{{ content }}</text>
    </uni-card>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: '',
      content: ''
    }
  },
  onLoad(options) {
    this.title = options.title
    this.content = options.content
    uni.setNavigationBarTitle({
      title: options.title
    })
  }
}
</script>

<style scoped>
page {
  background-color: #ffffff;
}

.view-title {
  font-weight: bold;
}

.view-content {
  font-size: 26 rpx;
  padding: 12px 5px 0;
  color: #333;
  line-height: 24px;
  font-weight: normal;
}
</style>
