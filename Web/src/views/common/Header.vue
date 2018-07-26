<template>
  <div class="header">
	<div class="header-wrap">
		<router-link to="/home" class="header-logo">
			<img src="../../assets/img/logo.png">
		</router-link>
  		<el-menu :default-active="activeIndex" class="header-menu" mode="horizontal" @select="handleSelect">
		  <el-menu-item index="1">处理中心</el-menu-item>
		  <el-submenu index="2">
		    <template slot="title">我的工作台</template>
		    <el-menu-item index="2-1">选项1</el-menu-item>
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
		  <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
		</el-menu>
		<i class="el-icon-menu xs-menu"></i>
		<el-input placeholder="请输入搜索内容" v-model="keywords" class="header-search">
		    <el-button slot="append" icon="el-icon-search"></el-button>
		</el-input>
		<i class="el-icon-search xs-search"></i>
	</div>
  </div>
</template>

<script>
export default {
  name: "myheader",
  data() {
    return { activeIndex: "1", keywords: "" };
  },
  mounted() {},
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    }
  }
};
</script>
<style scoped>
.header-wrap {
  padding: 0 24px;
  display: flex;
  align-items: center;
  border-bottom: solid 1px #e6e6e6;
  justify-content: space-between;
  min-height: 54px;
}
.header-wrap .el-menu--horizontal {
  border-bottom: none;
}
.header-wrap .header-logo {
  flex-shrink: 0;
  margin-right: 24px;
}
.header-wrap .header-logo img {
  width: 120px;
  height: 36px;
}
.header-wrap .header-menu {
  flex-grow: 1;
}
.header-wrap .header-search {
  flex-basis: 20%;
  min-width: 240px;
}
.header-wrap .xs-search {
  font-size: 24px;
  margin: 0 12px;
  cursor: pointer;
  display: none;
}
.header-wrap .xs-menu {
  font-size: 24px;
  margin: 0 12px;
  cursor: pointer;
  display: none;
}
@media screen and (max-width: 960px) {
  .header-wrap .header-logo {
    display: none;
  }
}
@media screen and (max-width: 800px) {
  .header-wrap .header-search {
    display: none;
  }
  .header-wrap .xs-search {
    display: block;
  }
}
@media screen and (max-width: 768px) {
  .header-wrap .el-menu-item,
  .header-wrap .el-submenu__title {
    padding: 0 8px;
  }
  .header-wrap {
    padding: 0 8px;
  }
}
@media screen and (max-width: 480px) {
  .header-wrap .header-menu {
    display: none;
  }
  .header-wrap .xs-menu {
    display: block;
  }
}
</style>
