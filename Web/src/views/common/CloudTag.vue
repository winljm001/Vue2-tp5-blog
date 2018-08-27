<template>
  <div>
    <tag-cloud :data="hotTag" @clickTag="clickTagItem"></tag-cloud>
  </div>
</template>

<script>
// import CloudTag from "./CloudTag";
import tagCloud from "v-tag-cloud/src/components/tagCloud";
export default {
  name: "cloudTag",
  components: {
    tagCloud
  },
  data() {
    return {
      hotTag: []
    };
  },
  computed: {},
  mounted() {
    this.getTagList();
  },
  watch: {},
  methods: {
    clickTagItem(tag) {
      // TODO
    },
    getTagList() {
      // admin/home/ArticleTagList
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleTagList",
        data: {}
      }).then(function(res) {
        that.hotTag = res.data.data.list;
      });
    }
  }
};
</script>

<style lang="less">
.tag-cloud p {
  cursor: pointer;
}
</style>
