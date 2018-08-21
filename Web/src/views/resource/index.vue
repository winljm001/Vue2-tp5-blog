<template>
  <div class="resource">
    <ul class="resource-list">
    	<li v-for="v in resourceData" :key="v.id">
    		<div class="list-img">
    			<img :src="v.mainImg">
    		</div>
    		<div class="list-content">
    			<h4>{{v.title}}</h4>
    			<p>{{v.introduce}}</p>
    			<div class="list-info">
    				<div class="list-icons">
    					<span>
    						<i class="fa fa-eye"></i>{{v.watchNum}}
    					</span>
    					<span>
    						<i class="fa fa-commenting"></i>{{v.commentNum}}
    					</span>
    					<span>
    						<i class="fa fa-heart"></i>{{v.likeNum}}
    					</span>
    				</div>
    				<a href="#"><i class="fa fa-download"></i></a>
    			</div>
    		</div>
    		
    	</li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "resource",
  data() {
    return {
      resourceData: [
        {
          id: "1",
          title: "题目",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "2",
          title: "题目1",
          author: "Mr li",
          typeName: "前端",
          tagList: ["nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce: "正则表达式（",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "3",
          title: "题目3",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（表达式（表达式（表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "1",
          title: "题目",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "2",
          title: "题目1",
          author: "Mr li",
          typeName: "前端",
          tagList: ["nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "3",
          title: "题目3",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "1",
          title: "题目",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "2",
          title: "题目1",
          author: "Mr li",
          typeName: "前端",
          tagList: ["nodejs", "css"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        },
        {
          id: "3",
          title: "题目3",
          author: "Mr li",
          typeName: "前端",
          tagList: ["Audio", "nodejs"],
          time: "2018年7月30日",
          mainImg:
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2771861135,3895685363&fm=27&gp=0.jpg",
          introduce:
            "正则表达式（英语：Regular Expression，在代码中常简写为regex、regression，在代码中常简写为regex、regression，在代码中常简写为regex、regexp或RE）使用单个字符串来描述、匹配一系列符合某个句法规则的字符串搜索模式。",
          watchNum: "12",
          commentNum: "3",
          likeNum: "12"
        }
      ]
    };
  },
  mounted() {},
  methods: {}
};
</script>
<style lang="less" scoped>
.resource {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding-top: 24px;
  padding-bottom: 36px;
  transition: all 0.5s;
  @media (max-width: 1200px) {
    padding-left: 12px;
    padding-right: 12px;
  }
  .resource-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    li {
      flex-basis: 23%;
      width: 23%;
      height: 340px;
      background-color: #fff;
      margin-bottom: 18px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
      @media (max-width: 480px) {
        height: 440px;
      }
      .list-img {
        padding-top: 60%;
        position: relative;
        img {
          width: 100%;
          height: 100%;
          position: absolute;
          left: 0px;
          top: 0px;
        }
      }
      .list-content {
        padding: 8px 14px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        h4 {
          font-size: 16px;
          color: #181817;
          font-weight: normal;
        }
        p {
          line-height: 1.5rem;
          height: 96px;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 4;
          overflow: hidden;
          text-overflow: ellipsis;
          color: #9c9d9b;
          font-size: 14px;
        }
        .list-info {
          display: flex;
          justify-content: space-between;
          align-items: center;
          span,
          a {
            color: #9c9d9b;
          }
          span {
            margin-right: 12px;
            cursor: pointer;
            i {
              margin-right: 6px;
            }
            &:hover {
              color: #409eff;
            }
          }
          i {
            font-size: 18px;
            cursor: pointer;
            &:hover {
              color: #409eff;
            }
          }
        }
      }
    }
    @media (max-width: 960px) {
      li {
        flex-basis: 30%;
        width: 30%;
      }
    }
    @media (max-width: 768px) {
      li {
        flex-basis: 48%;
        width: 48%;
      }
    }
    @media (max-width: 480px) {
      li {
        flex-basis: 100%;
        width: 100%;
      }
      justify-content: center;
    }
  }
}
</style>
