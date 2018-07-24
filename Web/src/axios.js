import axios from "axios";
// 超时时间
axios.defaults.timeout = 5000;
axios.defaults.headers.post["Content-Type"] =
  "application/x-www-form-urlencoded;charset=UTF-8";
axios.defaults.baseURL = process.env.API_HOST + "";
axios.interceptors.request.use(
  config => {
    if (localStorage.getItem("apiAuth")) {
      config.headers["ApiAuth"] = localStorage.getItem("apiAuth");
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);
// http响应拦截器
axios.interceptors.response.use(
  data => {
    return data;
  },
  error => {
    return Promise.reject(error);
  }
);

export default axios;
