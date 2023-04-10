<script>
import config from '@/config'
import lang from '@/common/language/lang'
import {getToken,getLang} from '@/utils/auth'

export default {
  methods: {
    // 初始化应用
    initApp() {
      // 初始化应用配置
      this.initConfig()
      // 检查用户登录状态
      this.checkLogin()
    },
    // 初始化语言
    initLang(){
      if (!getLang()){
        uni.setStorageSync('language',lang.ZH_CN)
      }else {
        uni.getStorageSync('language')
      }
    },
    // 初始化请求
    initConfig() {
      this.globalData.config = config
    },
    checkLogin() {
      if (!getToken()) {
        this.$tab.reLaunch('/pages/login/login')
      }else {
        this.$tab.reLaunch('/pages/home/index')
      }
    }
  },
  onLaunch: function () {
    // 初始化应用
    this.initApp();
    // 初始化语言
    this.initLang();
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

