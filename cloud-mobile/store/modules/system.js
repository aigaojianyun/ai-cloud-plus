import storage from '@/utils/storage'
import constant from '@/utils/constant'

const system = {

    state: {
        systemInfo: storage.get(constant.systemInfo)
    },

    mutations: {
        SET_SYSTEM_INFO: (state, systemInfo) => {
            state.systemInfo = systemInfo
            storage.set(constant.systemInfo, systemInfo)
        }
    },

    actions: {
        // 获取用户终端系统信息
        SystemInfo({commit, state}) {
            return new Promise((resolve, reject) => {
                if (state.info) {
                    resolve(res)
                } else {
                    uni.getSystemInfo({
                        success(res) {
                            commit('SET_SYSTEM_INFO', res)
                            // 信息存入缓存（有效期1天）
                            storage.set('SYSTEM_INFO', res, 86400);
                            resolve(res)
                        },
                        fail(err) {
                            reject(err)
                        }
                    })
                }
            })
        },
    }
}

export default system
