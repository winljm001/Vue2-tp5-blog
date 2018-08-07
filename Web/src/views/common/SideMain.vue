<template>
  <div>
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
</template>

<script>
import CloudTag from "./CloudTag";
import HotArticle from "./HotArticle";

export default {
  name: "myside",
  components: {
    CloudTag,
    HotArticle
  },
  data() {
    return {};
  },
  computed: {},
  mounted() {},
  watch: {},
  methods: {}
};
</script>

<style lang="less">
.side-item {
  background-color: #fff;
  margin-bottom: 14px;
  padding: 12px 16px;
  box-shadow: 3px 3px 6px #ddd;
  h3 {
    font-size: 20px;
    color: #333;
    font-weight: normal;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px dashed #dededd;
    position: relative;
    &::after,
    &::before {
      content: "";
      position: absolute;
      bottom: -1px;
      width: 0px;
      height: 1px;
      background-color: #409eff;
      transition: all 0.3s;
    }
    &::after {
      right: 0px;
    }
    &::before {
      left: 0px;
    }
    .dot {
      font-size: 14px;
      transform-origin: 50% 50%;
      &.fa-spin {
        animation: none;
      }
    }
  }
  &:hover {
    .dot {
      &.fa-spin {
        animation: fa-spin 2s infinite linear;
      }
    }
    h3::after,
    h3::before {
      width: 50%;
    }
  }
}
</style>
