import request from '@/utils/request'

export function setAdmin(data) {
  return request({
    url: 'admin/Admin/setAdmin',
    method: 'post',
    data
  })
}

export function getAdmin(uid) {
  return request({
    url: 'admin/home/getAdmin',
    method: 'post',
    data: { uid: uid }
  })
}

