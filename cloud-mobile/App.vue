<script>
import config from './config'
import {getToken} from '@/utils/auth'

export default {
  onLaunch: function () {
    // 初始化应用
    this.initApp();
    // 加载系统信息
    this.$store.dispatch('SystemInfo')
  },
  onShow() {
  },
  onHide() {
  },
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
        this.$tab.reLaunch('/pages/login')
      }
    }
  }
}
</script>

<style lang="scss">
@import "@/uni_modules/uview-ui/index.scss";
@import '@/static/style.scss';
</style>

