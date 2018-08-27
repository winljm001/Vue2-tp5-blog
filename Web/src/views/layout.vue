<template>
  <div class="main">
  	<Header></Header>
    <router-view></router-view>
  	<Footer></Footer>
  	<ScrollTop></ScrollTop>
  </div>
</template>

<script>
import Footer from "./common/Footer";
import Header from "./common/Header";
import ScrollTop from "./common/ScrollTop";
export default {
  name: "mymain",
  components: {
    Footer,
    ScrollTop,
    Header
  },
  data() {
    return {};
  },
  mounted() {
    this.getBlogInfo();
  },
  methods: {
    getBlogInfo() {
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/getAdmin",
        data: { uid: 1 }
      }).then(function(res) {
        that.$store.state.blogInfo = res.data.data.admin;
      });
    }
  }
};
</script>
<style scoped>
</style>
