<template>
  <div class="index">
    <div class="recently-list">
      <ArticleItem v-for="v in recentlyData" :key="v.id" :article-data="v"></ArticleItem>
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
      recentlyData: [
        {
          id: "1",
          title: "题目",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3"
        },
        {
          id: "2",
          title: "题目1",
          author: "Mr li",
          typeName: "前端",
          tagList: ["nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3"
        },
        {
          id: "3",
          title: "题目3",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3"
        }
      ]
    };
  },
  mounted() {},
  methods: {
    loadMore() {
      console.log("加载更多");
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
</style>
