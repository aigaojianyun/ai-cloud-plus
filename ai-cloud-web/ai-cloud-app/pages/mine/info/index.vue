<template>
  <view class="container">
    <uni-list>
      <uni-list-item :extraIcon="{type: 'person-filled'}" :rightText="user.nickName" showExtraIcon="true" title="昵称"/>
      <uni-list-item :extraIcon="{type: 'phone-filled'}" :rightText="user.phone" showExtraIcon="true" title="手机号码"/>
    </uni-list>
  </view>
</template>

<script>
import {getUserProfile} from "@/api/user"

export default {
  data() {
    return {
      user: {}
    }
  },
  onLoad() {
    this.getUser()
  },
  methods: {
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data
      })
    }
  }
}
</script>

<style lang="scss">
page {
  background-color: #ffffff;
}
</style>
