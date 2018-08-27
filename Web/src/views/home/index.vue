<template>
  <div class="index">
    <div class="recently-list">
      <ArticleItem v-for="v in recentlyData" :key="v.id" :article-data="v"></ArticleItem>
      <div v-if="recentlyData.length<=0" class="no-data">没有文章哦</div>
      <button class="loading-more-btn" @click="loadMore">加载更多</button>
    </div>
    <div class="side-content">
      <div class="side-item">
        <h3>热门标签<i class="dot fa fa-circle-o-notch fa-spin"></i></h3>
        <div>
          <CloudTag></CloudTag>
        </div>
      </div>
      <div class="side-item">
        <h3>热门文章<i class="dot fa fa-circle-o-notch fa-spin"></i></h3>
        <div>
          <HotArticle></HotArticle>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ArticleItem from "../common/ArticleItem";
import CloudTag from "../common/CloudTag";
import HotArticle from "../common/HotArticle";
export default {
  name: "index",
  components: {
    ArticleItem,
    CloudTag,
    HotArticle
  },
  data() {
    return {
      recentlyData: []
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    loadMore() {
      console.log("加载更多");
    },
    getData() {
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleList",
        data: {}
      }).then(function(res) {
        that.recentlyData = res.data.data.list;
        // console.log(res.data.data.list);
      });
    }
  }
};
</script>
<style lang="less" scoped>
@import url("../../assets/css/sideMain.less");
.index {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding-top: 24px;
  padding-bottom: 36px;
  transition: all 0.5s;
  display: flex;
}
@media screen and (max-width: 1200px) {
  .index {
    padding-left: 12px;
    padding-right: 12px;
  }
}
.side-content {
  flex-shrink: 0;
  width: 320px;
  margin-left: 24px;
}
@media screen and (max-width: 768px) {
  .side-content {
    display: none;
  }
}
.loading-more-btn {
  display: block;
  border: none;
  background-color: #409eff;
  color: #fff;
  width: 100%;
  line-height: 32px;
  height: 32px;
  font-size: 16px;
  cursor: pointer;
  &:hover {
    box-shadow: 0px 3px 6px 0px #fff;
  }
}
.recently-list {
  flex-grow: 1;
}
.no-data {
  background-color: #fff;
  padding: 16px 20px;
  border-bottom: 1px solid #dededd;
  position: relative;
  text-align: center;
}
</style>
