<template>
  <div class="header">
  	<div class="header-wrap">
      <!-- logo -->
  		<router-link to="/home" class="header-logo">
  			<img src="../../assets/img/logo.png">
  		</router-link>
      <!-- 菜单 -->
      <el-menu :default-active="activeIndex" class  ="header-menu" :mode="menuMode" @select="handleSelect" v-show="menuVisible">
        <el-menu-item index="1">处理中心</el-menu-item>
        <el-submenu index="2">
          <template slot="title">我的工作台</template>
          <el-menu-item index="3-1">选项1</el-menu-item>
          <el-menu-item index="2-2">选项2</el-menu-item>
          <el-menu-item index="2-3">选项3</el-menu-item>
          <el-submenu index="2-4">
            <template slot="title">选项4</template>
            <el-menu-item index="2-4-1">选项1</el-menu-item>
            <el-menu-item index="2-4-2">选项2</el-menu-item>
            <el-menu-item index="2-4-3">选项3</el-menu-item>
          </el-submenu>
        </el-submenu>
        <el-menu-item index="3" disabled>消息中心</el-menu-item>
        <el-menu-item index="4" disabled>消息中心</el-menu-item>
      </el-menu>
      <i class="el-icon-menu xs-menu" @click="toggleMenu"></i>
      <!-- 搜索框 -->
  		<el-input placeholder="请输入搜索内容" v-model="keywords" size="small" class="header-search" @keyup.enter.native="searchKeywords">
  		    <el-button slot="append" icon="el-icon-search" @click="searchKeywords"></el-button>
  		</el-input>
  		<i class="el-icon-search xs-search" @click="searchDialogVisible=!searchDialogVisible"></i>
  	</div>
    <el-dialog
      title="搜索"
      :visible.sync="searchDialogVisible"
      center
      customClass="search-dialog"
      >
      <div>
        <el-input placeholder="请输入搜索内容" v-model="keywords" size="small" class="header-search" @keyup.enter.native="searchKeywords">
            <el-button slot="append" icon="el-icon-search" @click="searchKeywords"></el-button>
        </el-input>
      </div>
    </el-dialog>
    <div class="header-occupied"></div>
  </div>
</template>

<script>
export default {
  name: "myheader",
  data() {
    return {
      // 菜单索引
      activeIndex: "1",
      // 搜索关键字
      keywords: "",
      // 搜索模态框显示flag
      searchDialogVisible: false,
      // 侧边导航显示flag
      menuVisible: !(document.body.clientWidth < 640),
      screenWidth: document.body.clientWidth,
      menuMode: document.body.clientWidth < 640 ? "vertical" : "horizontal",
      timerFlag: false
    };
  },
  mounted() {
    const that = this;
    window.onresize = () => {
      return (() => {
        window.screenWidth = document.body.clientWidth;
        that.screenWidth = window.screenWidth;
      })();
    };
  },
  watch: {
    screenWidth(val) {
      if (!this.timerFlag) {
        this.timerFlag = true;
        let that = this;
        setTimeout(function() {
          that.timerFlag = false;
          if (val < 640) {
            if (that.menuMode == "horizontal") {
              that.menuVisible = false;
            }
            that.menuMode = "vertical";
          } else {
            if (that.menuMode == "vertical") {
              that.menuVisible = true;
            }
            that.menuMode = "horizontal";
          }
        }, 400);
      }
    }
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    searchKeywords() {
      if (this.keywords === "") {
        this.$message.error("请输入搜索内容");
      } else {
        console.log(this.keywords);
      }
    },
    toggleMenu() {
      this.menuVisible = !this.menuVisible;
      // this.menuMode = "horizontal";
    }
  }
};
</script>
<style scoped>
@import url("../../assets/css/header.css");
</style>
<style>
@media screen and (max-width: 480px) {
  .search-dialog.el-dialog {
    width: 85%;
  }
}
</style>
