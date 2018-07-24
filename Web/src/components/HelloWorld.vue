<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      msg: "Welcome to Your Vue.js App",
      form: {
        username: "root",
        password: "123456"
      }
    };
  },
  mounted() {
    let that = this;
    that.axios
      .post("admin/Login/index", {
        username: this.form.username,
        password: this.form.password
      })
      .then(function(response) {
        console.log(response.data.data.apiAuth);
        localStorage.setItem("apiAuth", response.data.data.apiAuth);
        that.axios
          .get("admin/Menu/index", {
            params: {
              // 请求参数
              ApiAuth: response.data.data.apiAuth
            }
          })
          .then(function(response) {
            console.log(response);
          });
      });
  }
};
</script>
<style scoped>
</style>
