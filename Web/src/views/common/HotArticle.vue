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
      hotList: [
        {
          id: "1",
          title: "JavaScript1231231234sdd的的地方覆盖个34435",
          hotNum: "120"
        },
        { id: "2", title: "JavaScript1", hotNum: "120" },
        { id: "3", title: "JavaScript2方覆盖个454556576878", hotNum: "120" },
        { id: "4", title: "JavaScript3", hotNum: "120" },
        { id: "5", title: "JavaScript4", hotNum: "120" },
        {
          id: "6",
          title: "JavaScrip方覆盖个方覆盖个方覆盖个t50------------6777",
          hotNum: "120"
        },
        { id: "7", title: "JavaScript6", hotNum: "120" },
        { id: "8", title: "JavaScript7", hotNum: "120" }
      ]
    };
  },
  mounted() {},
  methods: {
    jumpDetail(id) {
      console.log(id);
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
