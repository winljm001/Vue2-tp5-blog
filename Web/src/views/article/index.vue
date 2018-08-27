<template>
  <div class="article">
    <div class="recently-list">
      <ArticleItem v-for="v in recentlyData" :key="v.Id" :article-data="v"></ArticleItem>
      <div v-if="recentlyData.length<=0" class="no-data">没有文章哦</div>
      <button class="loading-more-btn" @click="loadMore">加载更多</button>
    </div>
    <div class="side-content">
      <div class="side-item">
        <h3>文章分类<i class="dot fa fa-circle-o-notch fa-spin"></i></h3>
        <div>
          	<ul class="type-list" @mouseleave="activeClassIndex=aCurrentTypeIndex">
          		<li v-for="(v,i) in typeList" :key="v.Id" @mouseenter="moveActive(i)" @click="changeType(v.Id)">{{v.name}}</li>
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
      recentlyData: [],
      typeList: [],
      // 分类背景索引位置
      activeClassIndex: 0,
      aCurrentType: 0
    };
  },
  computed: {
    aCurrentTypeIndex() {
      let that = this;
      let i = this.typeList.findIndex(function(value, index, arr) {
        return that.aCurrentType === value.Id;
      });
      return i === -1 ? 0 : i;
    }
  },
  mounted() {
    this.activeClassIndex = this.aCurrentTypeIndex;
    this.getData();
    this.getArticleType();
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
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleList",
        data: { type: this.$route.query.type }
      }).then(function(res) {
        that.recentlyData = res.data.data.list;
        // console.log(res.data.data.list);
      });
    },
    getArticleType() {
      let that = this;
      this.axios({
        method: "post",
        url: "admin/home/ArticleTypeList"
      }).then(function(res) {
        that.typeList = res.data.data.list;
        that.aCurrentType = that.$route.query.type
          ? that.$route.query.type
          : that.typeList[0].Id;
      });
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
