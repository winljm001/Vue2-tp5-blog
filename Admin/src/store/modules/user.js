import { loginByUsername, logout } from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'
import { setUserinfo, getUserinfo, removeUserinfo } from '@/utils/userinfo'

const user = {
  state: {
    user: '',
    status: '',
    code: '',
    token: getToken(),
    name: getUserinfo().name,
    avatar: getUserinfo().avatar,
    introduction: '',
    roles: ['admin'],
    setting: {
      articlePlatform: []
    }
  },

  mutations: {
    SET_CODE: (state, code) => {
      state.code = code
    },
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_INTRODUCTION: (state, introduction) => {
      state.introduction = introduction
    },
    SET_SETTING: (state, setting) => {
      state.setting = setting
    },
    SET_STATUS: (state, status) => {
      state.status = status
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    }
  },

  actions: {
    // 用户名登录
    LoginByUsername({ commit }, userInfo) {
      const username = userInfo.username.trim()
      return new Promise((resolve, reject) => {
        loginByUsername(username, userInfo.password).then(response => {
          const data = response.data.data
          if (response.data.msg === '登录成功') {
            commit('SET_TOKEN', data.apiAuth)
            commit('SET_NAME', data.nickname)
            commit('SET_AVATAR', data.headImg)
            setToken(data.apiAuth)
            setUserinfo(data.nickname, data.headImg)
          } else {
            reject('用户名或者密码错误！')
          }
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    LogOut({ commit, state }) {
      return new Promise((resolve, reject) => {
        logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          removeToken()
          removeUserinfo()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        removeUserinfo()
        resolve()
      })
    }
  }
}

export default user
