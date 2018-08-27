<template>
  <div class="index">
    <div v-html="article.content"></div>
  </div>
</template>

<script>
export default {
  name: "myAuthor",
  data() {
    return {
      article: {}
    };
  },
  mounted() {
    this.getAboutMe();
  },
  methods: {
    getAboutMe() {
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleList",
        data: { type: "6" }
      }).then(function(res) {
        that.article = res.data.data.list[0];
      });
    }
  }
};
</script>
<style scoped lang="less">
.index {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  margin-top: 24px;
  margin-bottom: 36px;
  transition: all 0.5s;
  background: #fff;
}
@media screen and (max-width: 1200px) {
  .index {
    padding-left: 12px;
    padding-right: 12px;
  }
}
</style>
