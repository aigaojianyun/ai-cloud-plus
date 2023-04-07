export const commonI18n = {
    computed: {
        i18n() {
            return this.$t('message');
        }
    },
    data() {
        return {
            contentText: {
                contentdown: "上拉显示更多",
                contentrefresh: "正在加载...",
                contentnomore: "没有更多数据了"
            },
            loadText: {
                loadmore: '轻轻上拉',
                loading: '努力加载中',
                nomore: '实在没有了'
            }
        }
    },
    filters: {
        fixed(v, scale){
            if(v){
                if(!scale){
                    scale = 2
                }
                return parseFloat(v).toFixed(scale)
            }
            return v
        }
    },
    onShow() {
        this.contentText = {
            contentdown: this.i18n.common.loadmoreText,
            contentrefresh: this.i18n.common.loadingText,
            contentnomore: this.i18n.common.nomoreText
        }
        this.loadText = {
            loadmore: this.i18n.common.loadmoreText,
            loading: this.i18n.common.loadingText,
            nomore: this.i18n.common.nomoreText
        }
    },
    methods: {

    }
}


