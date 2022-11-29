// 应用全局配置
module.exports = {
    // 本地部署的后端
    baseUrl: 'http://162.14.103.169:8080',
	// 测试环境配置
	//baseUrl: 'http://127.0.0.1:8080/stage-api',
    // 生产环境配置
    //baseUrl: 'http://192.168.2.18:8080',
    // 应用信息
    appInfo: {
        // 应用名称
        name: "cloud-mobile",
        // 应用版本
        version: "1.0.0",
        // 应用logo
        logo: "/static/logo.png",
        // 官方网站
        site_url: "https://aiclouds.vip",
        // 政策协议L
        agreements: [{
            title: "隐私政策",
            url: "https://aiclouds.vip/protocol.html"
        },
            {
                title: "用户服务协议",
                url: "https://aiclouds.vip/protocol.html"
            }
        ]
    }
}
