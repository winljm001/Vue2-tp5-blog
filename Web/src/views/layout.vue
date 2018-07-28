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
  mounted() {},
  methods: {}
};
</script>
<style scoped>
</style>
