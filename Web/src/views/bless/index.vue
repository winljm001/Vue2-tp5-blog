<template>
  <div class="bless">
  	<div class="header-wrap">
    	<img :src="mainImg" class="main-img">
    	<transition name="bounce">
    	<div class="bless-form" :class="formClass">
    		<el-input
			  type="textarea"
			  :rows="3"
			  placeholder="请输入内容"
			  v-model.trim="leaveWord"
			  resize="none"
			  @focus="formFocus"
			  @blur="formBlur"
			  >
			</el-input>
			<el-button type="primary" plain class="form-btn" @click="submitForm">留言</el-button>
    	</div>
    	</transition>
    </div>
  </div>
</template>

<script>
export default {
  name: "myBless",
  data() {
    return {
      mainImg: "./static/img/bg2.jpg",
      leaveWord: "",
      formClass: { focus: false, show: false }
    };
  },
  mounted() {},
  methods: {
    formFocus() {
      this.formClass.focus = true;
    },
    formBlur() {
      this.formClass.focus = false;
    },
    submitForm() {
      if (this.leaveWord === "") {
        this.$message.error("请输入搜索内容");
      } else {
        console.log(this.leaveWord);
      }
    }
  }
};
</script>
<style scoped lang="less">
.bounce-enter-active {
  animation: bounce-in 0.5s;
}
.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}
.bless {
  .header-wrap {
    position: relative;
    .main-img {
      width: 100%;
      height: auto;
      max-height: 640px;
    }
    .bless-form {
      top: 30px;
      position: absolute;
      width: 50%;
      left: 50%;
      margin-left: -25%;
      background-color: rgba(255, 255, 255, 0.4);
      padding: 18px 24px;
      border-radius: 5px;
      transition: all 0.4s;
      &.focus {
        background-color: rgba(255, 255, 255, 0.6);
        box-shadow: 0px 0px 6px 0px rgba(64, 158, 255, 0.6);
        .form-btn {
          display: block;
        }
      }
      @media (max-width: 768px) {
        width: 80%;
        margin-left: -40%;
      }
      .form-btn {
        display: none;
        float: right;
        margin-top: 12px;
      }
    }
  }
}
</style>
