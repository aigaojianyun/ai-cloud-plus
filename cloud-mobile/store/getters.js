const getters = {
    systemInfo: state => state.system.systemInfo,
    token: state => state.user.token,
    name: state => state.user.name,
}
export default getters
