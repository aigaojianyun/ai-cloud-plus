import request from '@/utils/request'

// 查询货币列表
export function listCoin(query) {
  return request({
    url: '/system/coin/list',
    method: 'get',
    params: query
  })
}

// 查询货币详细
export function getCoin(id) {
  return request({
    url: '/system/coin/' + id,
    method: 'get'
  })
}

// 新增货币
export function addCoin(data) {
  return request({
    url: '/system/coin',
    method: 'post',
    data: data
  })
}

// 修改货币
export function updateCoin(data) {
  return request({
    url: '/system/coin',
    method: 'put',
    data: data
  })
}

// 删除货币
export function delCoin(id) {
  return request({
    url: '/system/coin/' + id,
    method: 'delete'
  })
}
