import Cookies from 'js-cookie'

export function getUserinfo() {
  const userinfo = {}
  userinfo.name = Cookies.get('name')
  userinfo.avatar = Cookies.get('avatar')
  return userinfo
}

export function setUserinfo(name, avatar) {
  Cookies.set('avatar', avatar)
  return Cookies.set('name', name)
}

export function removeUserinfo() {
  Cookies.remove('avatar')
  return Cookies.remove('name')
}
