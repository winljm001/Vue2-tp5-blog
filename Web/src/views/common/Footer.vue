<template>
  <div class="footer">
  	<div class="container">
  		<div class="footer-main">
  			<dl class="web-info">
  				<dt>关于本站</dt>
  				<dd>程序：Mr li博客</dd>
  				<dd>作者：Mr li</dd>
  				<dd>技术栈：vue全家桶，element-ui，tp5</dd>
  			</dl>
  			<dl class="web-info">
  				<dt>关于作者</dt>
  				<dd>昵称：Mr li</dd>
  				<dd>邮箱：winljm001@qq.com</dd>
  				<dd>领域：全栈漫漫长路发展ing</dd>
  			</dl>
  		</div>
  		<div class="footer-tip">
  			<span>© 2015 - 2018 Mr li & 版权所有 </span>
  			<span>渝ICP备17006757号</span>
  		</div>
  	</div>
    
  </div>
</template>

<script>
export default {
  name: "myfooter",
  components: {},
  data() {
    return {};
  },
  mounted() {},
  methods: {}
};
</script>
<style scoped>
.footer {
  background-image: url(../../assets/img/bg-foot.gif);
  padding-top: 18px;
  padding-bottom: 18px;
  color: #fff;
}
.footer .footer-main {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.footer .web-info {
  text-align: center;
  flex-shrink: 0;
}
.footer .web-info dt {
  font-size: 20px;
  line-height: 42px;
}
.footer .web-info dd {
  line-height: 32px;
  font-size: 16px;
  color: #bbb;
}
.footer .footer-form {
  width: 50%;
}
.footer .container {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
}
.footer .footer-tip {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-top: 18px;
  border-radius: 6px;
  line-height: 42px;
  font-size: 14px;
  padding: 0 12px;
  background-color: #1f1f1f;
}
@media screen and (max-width: 1200px) {
  .footer .container {
    padding: 0 12px;
  }
}
@media screen and (max-width: 480px) {
  .footer .web-info dt {
    font-size: 18px;
    line-height: 36px;
  }
  .footer .web-info dd {
    line-height: 28px;
    font-size: 14px;
  }
  .footer .container {
    padding: 0 12px;
  }
  .footer .footer-tip {
    font-size: 12px;
  }
}
</style>
