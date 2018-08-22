import request from '@/utils/request'

export function articleList(data) {
  return request({
    url: 'admin/Article/index',
    method: 'post',
    data
  })
}

export function addArticle(data) {
  return request({
    url: 'admin/Article/add',
    method: 'post',
    data
  })
}

export function delArticle(data) {
  return request({
    url: 'admin/Article/del',
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
