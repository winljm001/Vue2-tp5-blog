import Cookies from 'js-cookie'

export function getUserinfo() {
  const userinfo = {}
  userinfo.name = Cookies.get('name')
  userinfo.uid = Cookies.get('uid')
  userinfo.avatar = Cookies.get('avatar')
  return userinfo
}

export function setUserinfo(name, avatar, id) {
  Cookies.set('avatar', avatar)
  Cookies.set('uid', id)
  return Cookies.set('name', name)
}

export function removeUserinfo() {
  Cookies.remove('avatar')
  return Cookies.remove('name')
}
