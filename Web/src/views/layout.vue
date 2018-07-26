<template>
  <div class="main">
  	<Header></Header>
    <router-view></router-view>
  	<Footer></Footer>
  </div>
</template>

<script>
import Footer from "./common/Footer";
import Header from "./common/Header";
export default {
  name: "mymain",
  components: {
    Footer,
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
