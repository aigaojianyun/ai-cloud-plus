<template>
  <view>
    <Navbar :hideBtn="true" title="我的" bgColor="#fff" :h5Show="false" :fixed="false"></Navbar>
    <view class="profile-top">
      <view class="user-info">
        <view>
          <view class="user-info--name">{{  user.nickName }}</view>
          <text class="user-info--account">{{ user.phone  == null? '':user.phone }}</text>
        </view>
        <view>
          <u-avatar :src="user.headImg" size="120rpx"></u-avatar>
        </view>
      </view>
      <view style="padding: 40rpx 40rpx 0 40rpx;">
        <view class="profile-rule">
          <u-row>
            <u-col span="8">
              <view style="color: white; font-size: 20px;">
                {{ user.userType == 1 ? '普通用户' : '会员用户' }}
              </view>
            </u-col>
            <u-col span="4">
              <u-button icon="" text="" style="height: 36px;">{{ user.vipType == 1 ? '开通会员' : user.vipEndTime }}</u-button>
            </u-col>
          </u-row>
        </view>
      </view>
    </view>
    <view style="padding: 40rpx; background-color: #fff;">
      <u-grid>
        <u-grid-item @click="handleToWallet">
          <u-icon name="rmb-circle" color="red" size="60rpx"></u-icon>
          <text class="btn-text">钱包</text>
        </u-grid-item>
      </u-grid>
    </view>

    <view style="padding: 40rpx; margin-top: 500rpx;">
      <u-row gutter="32">
        <u-col span="6">
          <u-button icon="phone" text="联系我们" plain></u-button>
        </u-col>
        <u-col span="6">
          <u-button icon="reload" text="退出" type="error" @click="handleLogout"></u-button>
        </u-col>
      </u-row>
    </view>

  </view>
</template>

<script>
import Navbar from '@/components/navbar/Navbar'
import {getUserInfo} from "@/api/user"

export default {
  components: {
    Navbar
  },
  data() {
    return {
      user: {}
    }
  },
  created() {
    this.getInfo()
  },
  methods: {
    // 跳转到钱包
    handleToWallet() {
      this.$tab.navigateTo('/pages/wallet/index')
    },
    // 获取用户详细信息
    getInfo() {
      getUserInfo().then(response => {
        this.user = response.data
      })
    },
    // 退出登录
    handleLogout() {
      this.$modal.confirm('确定注销并退出系统吗？').then(() => {
        this.$store.dispatch('LogOut').then(() => {
          this.$tab.reLaunch('/pages/login/index')
        })
      })
    }
  }
}
</script>

<style lang="scss">
.profile-top {
  background-color: #f3f4f6;
  padding-top: 50rpx;
}

.profile-rule {
  height: 140rpx;
  line-height: 140rpx;
  padding: 0px 40rpx;
  background-color: $u-main-color;
  border-radius: 16px 16px 0 0;
  box-shadow: 0px 16px 26px rgba(0, 0, 0, .8);
}

.btn-text {
  font-size: 28rpx;
  color: #606266;
}

.user-info {
  display: flex;
  justify-content: space-between;
  padding: 40rpx;
  max-width: 100%;
  color: #303133;

  &--name {
    font-size: 56rpx;
    font-weight: bold;
    width: 100%
  }

  &--account {
    font-size: 26rpx;
    color: #909399;
  }

}
</style>
