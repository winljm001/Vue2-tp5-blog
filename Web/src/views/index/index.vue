<template>
  <div class="index">
    <div class="main" id="demo">
      <div class="content">
        <div class="top_logo"></div>  
        <div class="topcn">
          <p>这星空一般，学无止境</p>
        </div>
        <div class="nav">
          <router-link to="/home" class="gv">首页</router-link>
          <router-link to="/article" class="gv">文章</router-link>
          <router-link to="/note" class="gv">笔记</router-link>
          <router-link to="/resource" class="gv">资源下载</router-link>
          <router-link to="/author" class="gv">关于作者</router-link>
        </div>
      </div>
      <div class="canvaszz"></div>
      <canvas id="canvas" width="1440" height="769"></canvas> 
    </div>
  </div>
</template>

<script>
export default {
  name: "myIndex",
  data() {
    return {
      canvas: {},
      ctx: {},
      w: 0,
      h: 0,
      hue: 217,
      count: 0,
      maxStars: 1300,
      canvas2: {},
      ctx2: {},
      half: 0,
      gradient2: {},
      Star: {}
    };
  },
  mounted() {
    let that = this;
    this.canvas = document.getElementById("canvas");
    this.ctx = canvas.getContext("2d");
    this.w = canvas.width = window.innerWidth;
    this.h = canvas.height = window.innerHeight;
    this.hue = 217;
    this.stars = [];
    this.count = 0;
    this.maxStars = 1300; // 星星数量
    this.canvas2 = document.createElement("canvas");
    this.ctx2 = this.canvas2.getContext("2d");
    this.canvas2.width = 100;
    this.canvas2.height = 100;
    this.half = this.canvas2.width / 2;
    this.gradient2 = this.ctx2.createRadialGradient(
      this.half,
      this.half,
      0,
      this.half,
      this.half,
      this.half
    );
    this.gradient2.addColorStop(0.025, "#CCC");
    this.gradient2.addColorStop(0.1, "hsl(" + this.hue + ", 61%, 33%)");
    this.gradient2.addColorStop(0.25, "hsl(" + this.hue + ", 64%, 6%)");
    this.gradient2.addColorStop(1, "transparent");
    this.ctx2.fillStyle = this.gradient2;
    this.ctx2.beginPath();
    this.ctx2.arc(this.half, this.half, this.half, 0, Math.PI * 2);
    this.ctx2.fill();

    that.Star = function() {
      this.orbitRadius = that.random(that.maxOrbit(that.w, that.h));
      this.radius = that.random(60, this.orbitRadius) / 8;
      // 星星大小
      this.orbitX = that.w / 2;
      this.orbitY = that.h / 2;
      this.timePassed = that.random(0, that.maxStars);
      this.speed = that.random(this.orbitRadius) / 800000;
      // 星星移动速度
      this.alpha = that.random(2, 10) / 10;

      return this;
    };

    that.Star.prototype.draw = function() {
      let x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX;
      let y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY;
      let twinkle = that.random(10);

      if (twinkle === 1 && this.alpha > 0) {
        this.alpha -= 0.05;
      } else if (twinkle === 2 && this.alpha < 1) {
        this.alpha += 0.05;
      }

      that.ctx.globalAlpha = this.alpha;
      that.ctx.drawImage(
        that.canvas2,
        x - this.radius / 2,
        y - this.radius / 2,
        this.radius,
        this.radius
      );
      this.timePassed += this.speed;
    };
    for (let i = 0; i < this.maxStars; i++) {
      let tempStar = new this.Star();
      this.count++;
      this.stars[this.count] = tempStar;
    }
    this.animation();
    window.onresize = () => {
      this.w = canvas.width = window.innerWidth;
      this.h = canvas.height = window.innerHeight;
      this.stars.forEach(v => {
        v.orbitX = this.w / 2;
        v.orbitY = this.h / 2;
      });
    };
  },
  methods: {
    random(min, max) {
      if (arguments.length < 2) {
        max = min;
        min = 0;
      }

      if (min > max) {
        let hold = max;
        max = min;
        min = hold;
      }

      return Math.floor(Math.random() * (max - min + 1)) + min;
    },
    maxOrbit(x, y) {
      let max = Math.max(x, y);
      let diameter = Math.round(Math.sqrt(max * max + max * max));
      return diameter / 2;
      // 星星移动范围，值越大范围越小，
    },
    animation() {
      this.ctx.globalCompositeOperation = "source-over";
      this.ctx.globalAlpha = 0.5; // 尾巴
      this.ctx.fillStyle = "hsla(" + this.hue + ", 64%, 6%, 2)";
      this.ctx.fillRect(0, 0, this.w, this.h);

      this.ctx.globalCompositeOperation = "lighter";
      for (var i = 1, l = this.stars.length; i < l; i++) {
        this.stars[i].draw();
      }

      window.requestAnimationFrame(this.animation);
    }
  }
};
</script>
<style scoped>
.main {
  margin: 0 auto;
  width: 100%;
  min-height: 100vh;
  position: relative;
}
.main canvas {
  width: 100%;
  height: auto;
  display: inline-block;
  vertical-align: baseline;
  position: absolute;
  z-index: -1;
}
.main .canvaszz {
  /*用来解决视频右键菜单，用于视频上面的遮罩层*/
  width: 100%;
  background-image: url(../../assets/img/5a28eaddb3fbc.jpg);
  background-size: 100% 100%;
  min-height: 100vh;
  position: absolute;
  z-index: 10;
  filter: alpha(opacity=40);
  -moz-opacity: 0.4;
  -khtml-opacity: 0.4;
  opacity: 0.4;
}
.main .content {
  position: absolute;
  height: 100%;
  width: 100%;
  left: 0px;
  top: 0px;
  z-index: 30;
}
.main .top_logo {
  background-image: url(../../assets/img/top_logo.png);
  background-repeat: no-repeat;
  background-position: center center;
  margin: 0 auto;
  width: 100%;
  height: 129px;
  line-height: 129px;
  text-align: center;
  margin-top: 70px;
  color: #fff;
  font-size: 86px;
}

.main .nav {
  max-width: 800px;
  width: 100%;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap-reverse;
  margin: 0 auto;
  margin-top: 64px;
}
.main .nav a.gv {
  text-decoration: none;
  background: url(../../assets/img/nav_gv.png) repeat 0px 0px;
  /*background-color: rgba(255, 255, 255, 0.1);*/
  width: 130px;
  height: 43px;
  display: block;
  text-align: center; /*水平居中*/
  line-height: 43px; /*上下居中*/
  cursor: pointer;
  float: left; /*左浮动*/
  margin: 8px 2px 8px 2px;
  font: 18px/43px "microsoft yahei";
  color: #fff;
}
.main .nav a.gv span {
  display: none;
}
.main .nav a.gv:hover {
  background: url(../../assets/img/nav_gv.png) repeat 0px -43px;
  color: #fff;
  -webkit-box-shadow: 0 0 6px #fff;
  transition-duration: 0.5s;
}

.main .topcn {
  max-width: 860px;
  width: 100%;
  margin: 18px auto 0;
  color: #fff;
  font-size: 18px;
  text-align: center;
}
@media screen and (max-width: 860px) {
  .main .topcn {
    padding: 0 36px;
  }
}
@media screen and (max-width: 768px) {
  .main .top_logo {
    font-size: 10vw;
    background-size: 70% auto;
    margin-top: 5vw;
  }
  .main .nav {
    margin-top: 5vw;
  }
}
</style>
