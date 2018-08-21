import request from '@/utils/request'

export function articleList(query) {
  return request({
    url: '/article/list',
    method: 'get',
    params: query
  })
}

export function addArticle(data) {
  return request({
    url: 'admin/Article/add',
    method: 'post',
    data
  })
}

export function updateArticle(data) {
  return request({
    url: '/article/update',
    method: 'post',
    data
  })
}
