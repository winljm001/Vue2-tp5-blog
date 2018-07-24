// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue";
import App from "./App";
import router from "./router";

// 引入vuex
import store from "./store/store";

import axios from "./axios";
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
