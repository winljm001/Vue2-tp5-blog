<template>
  <ul class="hot-list">
    <li v-for="(v,i) in hotList" :key="v.id" @click="jumpDetail(v.id)"><span class="num">{{i+1}}</span>{{v.title}}</li>
  </ul>
</template>

<script>
export default {
  name: "hotArticle",
  components: {},
  data() {
    return {
      hotList: []
    };
  },
  mounted() {
    this.getHotArticle();
  },
  methods: {
    jumpDetail(id) {
      console.log(id);
    },
    getHotArticle() {
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleList",
        data: { order: "watchnum" }
      }).then(function(res) {
        that.hotList = res.data.data.list;
      });
    }
  }
};
</script>
<style scoped lang="less">
.hot-list {
  line-height: 32px;
  font-size: 14px;
  color: #80817f;
  margin-top: 6px;
  li {
    cursor: pointer;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    &:hover {
      text-decoration: underline;
    }
  }
  .num {
    margin-right: 6px;
    display: inline-block;
    width: 24px;
    height: 24px;
    color: #525251;
    background-color: #efefee;
    text-align: center;
    line-height: 24px;
    border-radius: 50%;
  }
  li:nth-child(1) {
    .num {
      background-color: #f56c6c;
      color: #fff;
    }
  }
  li:nth-child(2) {
    .num {
      background-color: #0366d6;
      color: #fff;
    }
  }
  li:nth-child(3) {
    .num {
      background-color: #6bc30d;
      color: #fff;
    }
  }
}
</style>
