<template>
  <div class="header">
  	<div class="header-wrap">
      <!-- logo -->
  		<router-link to="/home" class="header-logo">
  			<img src="../../assets/img/logo.png">
  		</router-link>
      <!-- 菜单 -->
      <transition :name="transitionName">
        <el-menu :default-active="activeIndex" class  ="xs-header-menu" mode="vertical" @select="handleSelect" v-show="menuVisible">
          <el-menu-item :index="v.url" v-for="v in menuData" :key="v.url">{{v.navName}}</el-menu-item>
        </el-menu>
      </transition>
      <el-menu :default-active="activeIndex" class  ="header-menu" mode="horizontal" @select="handleSelect">
          <el-menu-item :index="v.url" v-for="v in menuData" :key="v.url">{{v.navName}}</el-menu-item>
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
      activeIndex: this.$route.path,
      // 搜索关键字
      keywords: "",
      // 搜索模态框显示flag
      searchDialogVisible: false,
      // 侧边导航显示flag
      menuVisible: false,
      screenWidth: document.body.clientWidth,
      transitionName: "slide-fade"
    };
  },
  computed: {
    menuData: function() {
      return this.$store.state.menuData;
    }
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
        setTimeout(function() {}, 100);
      }
    },
    $route(to, from) {
      this.activeIndex = to.path;
    }
  },
  methods: {
    handleSelect(key, keyPath) {
      this.$router.push({
        path: key
      });
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
