<template>
  <section class="article-item">
    <div class="article-item-head">
      <div class="article-item-info">
        <h3 class="item-title">{{articleData.title}}</h3>
        <span>作者：{{articleData.author}}</span><span>分类：{{articleData.type}}</span>
      </div>
      <div class="article-item-date">
        {{articleData.addtime}}
      </div>
    </div>
    <div class="article-item-content">
      <img :src="articleData.mainimg" class="article-img">
      <p class="article-introduce">{{articleData.abstract}}</p>
    </div>
    <div class="article-item-footer">
      <p class="article-tag"><i class="fa fa-tags"></i><span v-for="(v,i) in articleData.tags" :key="i">{{v.name}}</span></p>
      <div class="article-amount"><span><i class="fa fa-eye"></i>{{articleData.watchnum}}</span><span><i class="fa fa-commenting"></i>{{articleData.commentNum}}</span></div>
    </div>
  </section>
</template>

<script>
import { timestampToTime } from "@/utils/index";
export default {
  name: "articleItem",
  components: {},
  props: ["articleData"],
  data() {
    return {};
  },
  mounted() {
    this.articleData.addtime = timestampToTime(
      parseInt(this.articleData.addtime)
    );
    this.articleData.tags = JSON.parse(this.articleData.tags);
    console.log(this.articleData);
  },
  methods: {}
};
</script>
<style scoped>
@import url("../../assets/css/articleItem.css");
</style>
