<script>
import config from './config'
import {getToken} from '@/utils/auth'

export default {
  methods: {
    // 初始化应用
    initApp() {
      // 初始化应用配置
      this.initConfig()
      // 检查用户登录状态
      //#ifdef H5
      this.checkLogin()
      //#endif
    },
    initConfig() {
      this.globalData.config = config
    },
    checkLogin() {
      if (!getToken()) {
        this.$tab.reLaunch('/pages/login/lgoin')
      }
    }
  },
  onLaunch: function () {
    // 初始化应用
    this.initApp();
    // 加载系统信息
    this.$store.dispatch('SystemInfo')
  },
  onShow: function() {
    console.log('App Show')
    uni.setTabBarItem({
      index: 0,
      text: this.$t('message').tabBar.home
    })
    uni.setTabBarItem({
      index: 1,
      text: this.$t('message').tabBar.market
    })
    uni.setTabBarItem({
      index: 2,
      text: this.$t('message').tabBar.assets
    })
    uni.setTabBarItem({
      index: 3,
      text: this.$t('message').tabBar.me
    })
  },
  onHide: function() {
    console.log('App Hide')
  },
}
</script>

<style lang="scss">
@import "@/uni_modules/uview-ui/index.scss";
</style>

