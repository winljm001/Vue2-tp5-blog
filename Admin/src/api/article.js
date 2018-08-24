import request from '@/utils/request'

export function articleList(data) {
  return request({
    url: 'admin/home/ArticleList',
    method: 'post',
    data
  })
}

export function articleDetail(data) {
  return request({
    url: 'admin/home/ArticleDetail',
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
    url: 'admin/Article/edit',
    method: 'post',
    data
  })
}

export function articleTagList(data) {
  return request({
    url: 'admin/home/ArticleTagList',
    method: 'post',
    data
  })
}

export function articleTagDetail(data) {
  return request({
    url: 'admin/home/ArticleTagDetail',
    method: 'post',
    data
  })
}

export function addArticleTag(data) {
  return request({
    url: 'admin/ArticleTag/add',
    method: 'post',
    data
  })
}

export function delArticleTag(data) {
  return request({
    url: 'admin/ArticleTag/del',
    method: 'post',
    data
  })
}

export function updateArticleTag(data) {
  return request({
    url: 'admin/ArticleTag/edit',
    method: 'post',
    data
  })
}

export function articleTypeList(data) {
  return request({
    url: 'admin/home/ArticleTypeList',
    method: 'post',
    data
  })
}

export function articleTypeDetail(data) {
  return request({
    url: 'admin/home/ArticleTypeDetail',
    method: 'post',
    data
  })
}

export function addArticleType(data) {
  return request({
    url: 'admin/ArticleType/add',
    method: 'post',
    data
  })
}

export function delArticleType(data) {
  return request({
    url: 'admin/ArticleType/del',
    method: 'post',
    data
  })
}

export function updateArticleType(data) {
  return request({
    url: 'admin/ArticleType/edit',
    method: 'post',
    data
  })
}
