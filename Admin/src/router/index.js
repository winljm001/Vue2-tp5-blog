import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/views/layout/Layout'

/** note: submenu only apppear when children.length>=1
*   detail see  https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
**/

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
*                                if not set alwaysShow, only more than one route under the children
*                                it will becomes nested mode, otherwise not show the root menu
* redirect: noredirect           if `redirect:noredirect` will no redirct in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    roles: ['admin','editor']     will control the page roles (you can set multiple roles)
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
    noCache: true                if true ,the page will no be cached(default is false)
  }
**/
export const constantRouterMap = [
  { path: '/login', component: () => import('@/views/login/index'), hidden: true },
  { path: '/authredirect', component: () => import('@/views/login/authredirect'), hidden: true },
  { path: '/404', component: () => import('@/views/errorPage/404'), hidden: true },
  { path: '/401', component: () => import('@/views/errorPage/401'), hidden: true },
  {
    path: '',
    component: Layout,
    redirect: 'dashboard',
    children: [{
      path: 'dashboard',
      component: () => import('@/views/dashboard/index'),
      name: 'dashboard',
      meta: { title: 'dashboard', icon: 'index', noCache: true }
    }]
  },
  {
    path: '',
    component: Layout,
    redirect: 'adminset',
    children: [{
      path: 'adminset',
      component: () => import('@/views/adminset/index'),
      name: 'adminset',
      meta: { title: 'adminset', icon: 'user', noCache: true }
    }]
  },
  {
    path: '',
    component: Layout,
    redirect: 'articlelist',
    name: 'articlemanage',
    meta: {
      title: 'articlemanage',
      icon: 'form'
    },
    children: [{
      path: 'articlelist',
      component: () => import('@/views/articleset/index'),
      name: 'articlelist',
      meta: { title: 'articlelist', icon: 'list', noCache: true }
    },
    {
      path: 'articleadd',
      component: () => import('@/views/articleset/add'),
      name: 'articleadd',
      meta: { title: 'articleadd', icon: 'edit', noCache: true }
    },
    {
      path: 'articleedit',
      component: () => import('@/views/articleset/edit'),
      name: 'articleedit',
      meta: { title: 'articleedit', icon: 'edit', noCache: true },
      hidden: true
    },
    {
      path: 'articletag',
      component: () => import('@/views/articleset/tag'),
      name: 'articletag',
      meta: { title: 'articletag', icon: 'tab', noCache: true }
    },
    {
      path: 'articletype',
      component: () => import('@/views/articleset/type'),
      name: 'articletype',
      meta: { title: 'articletype', icon: 'type', noCache: true }
    }]
  }
]

export default new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

export const asyncRouterMap = [
  { path: '*', redirect: '/404', hidden: true }
]
