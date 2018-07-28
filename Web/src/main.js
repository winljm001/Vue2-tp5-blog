// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue";
import App from "./App";
import router from "./router";
// 引入element-ui
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
// 引入font-awesome
import "font-awesome/css/font-awesome.min.css";
// 引入vuex
import store from "./store/store";

import axios from "./axios";
Vue.use(ElementUI);
Vue.prototype.axios = axios;

Vue.config.productionTip = false;
// global.DOUBAN_API = 'https://api.douban.com'
/* eslint-disable no-new */
new Vue({
  el: "#app",
  store,
  router,
  components: { App },
  template: "<App/>"
});
