<template>
  <div class="article">
    <div class="recently-list">
      <ArticleItem v-for="v in recentlyData" :key="v.id" :article-data="v"></ArticleItem>
      <button class="loading-more-btn" @click="loadMore">加载更多</button>
    </div>
    <div class="side-content">
      <div class="side-item">
        <h3>文章分类<i class="dot fa fa-circle-o-notch fa-spin"></i></h3>
        <div>
          	<ul class="type-list" @mouseleave="activeClassIndex=aCurrentTypeIndex">
          		<li v-for="(v,i) in typeList" :key="v.id" @mouseenter="moveActive(i)" @click="changeType(v.id)">{{v.title}}</li>
          		<li class="active" :style="{top:activeClassIndex*44+'px'}"></li>
          	</ul>
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
import HotArticle from "../common/HotArticle";
export default {
  name: "articleCenter",
  components: {
    ArticleItem,
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
      ],
      typeList: [
        { id: "1", title: "css" },
        { id: "3", title: "html" },
        { id: "5", title: "js" },
        { id: "7", title: "php" }
      ],
      // 分类背景索引位置
      activeClassIndex: 0,
      aCurrentType: 0
    };
  },
  computed: {
    aCurrentTypeIndex() {
      let that = this;
      let i = this.typeList.findIndex(function(value, index, arr) {
        return that.aCurrentType === value.id;
      });
      return i === -1 ? 0 : i;
    }
  },
  mounted() {
    this.aCurrentType = this.$route.query.type
      ? this.$route.query.type
      : this.typeList[0].id;
    this.activeClassIndex = this.aCurrentTypeIndex;
    this.getData();
  },
  watch: {
    $route(to, from) {
      // console.log(to);
      this.getData();
    }
  },
  methods: {
    loadMore() {
      console.log("加载更多");
    },
    moveActive(i) {
      this.activeClassIndex = i;
    },
    changeType(i) {
      this.aCurrentType = i;
      this.$router.push({ name: "article", query: { type: i } });
    },
    getData() {
      console.log(this.aCurrentType);
    }
  }
};
</script>
<style scoped lang="less">
@import url("../../assets/css/sideMain.less");
.article {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding-top: 24px;
  padding-bottom: 36px;
  transition: all 0.5s;
  display: flex;
}
@media screen and (max-width: 1200px) {
  .article {
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
.type-list {
  position: relative;
  margin-top: 8px;
  li {
    height: 44px;
    padding-left: 6px;
    line-height: 44px;
    position: relative;
    z-index: 1;
    color: #80817f;
    font-size: 16px;
    cursor: pointer;
    &:hover {
      color: #333;
    }
    &.active {
      left: 0px;
      top: 0px;
      width: 100%;
      background-color: #f8f8f7;
      border-right: 5px solid #525251;
      position: absolute;
      z-index: 0;
      transition: all 0.3s;
    }
  }
}
</style>
