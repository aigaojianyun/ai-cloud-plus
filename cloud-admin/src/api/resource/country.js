import request from '@/utils/request'

// 查询国家信息列表
export function listCountry(query) {
    return request({
        url: '/system/country/list',
        method: 'get',
        params: query
    })
}

// 查询国家信息详细
export function getCountry(id) {
    return request({
        url: '/system/country/' + id,
        method: 'get'
    })
}

// 新增国家信息
export function addCountry(data) {
    return request({
        url: '/system/country',
        method: 'post',
        data: data
    })
}

// 修改国家信息
export function updateCountry(data) {
    return request({
        url: '/system/country',
        method: 'put',
        data: data
    })
}

// 删除国家信息
export function delCountry(id) {
    return request({
        url: '/system/country/' + id,
        method: 'delete'
    })
}
