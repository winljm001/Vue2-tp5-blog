import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "index",
      component: () => import("@/views/index/index")
    },
    {
      path: "/main",
      name: "main",
      component: () => import("@/views/layout"),
      redirect: "/home",
      children: [
        {
          path: "/home",
          component: () => import("@/views/home/index"),
          name: "home",
          meta: { title: "home", icon: "dashboard" }
        },
        {
          path: "/article",
          component: () => import("@/views/article/index"),
          name: "article",
          meta: { title: "article", icon: "dashboard" }
        },
        {
          path: "/bless",
          component: () => import("@/views/bless/index"),
          name: "bless",
          meta: { title: "bless", icon: "dashboard" }
        },
        {
          path: "/resource",
          component: () => import("@/views/resource/index"),
          name: "resource",
          meta: { title: "resource", icon: "dashboard" }
        },
        {
          path: "/author",
          component: () => import("@/views/author/index"),
          name: "author",
          meta: { title: "author", icon: "dashboard" }
        }
      ]
    }
  ]
});
