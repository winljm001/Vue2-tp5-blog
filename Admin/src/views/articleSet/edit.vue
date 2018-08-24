<template>
  <div class="container">
    <el-card class="box-card">
      <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="题目">
        <el-input v-model="form.title"></el-input>
      </el-form-item>
      <el-form-item label="添加时间">
        <el-date-picker
          v-model="form.addtime"
          type="date"
          default-time="form.addtime"
          placeholder="选择日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="作者">
        <el-input v-model="form.author"></el-input>
      </el-form-item>
      <el-form-item label="分类">
        <el-select clearable style="width: 130px" v-model="form.type" :placeholder="$t('table.type')">
          <el-option v-for="item in  typeList" :key="item.Id" :label="item.name" :value="item.Id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="标签">
        <el-tag v-for="v in form.tag" style="margin-right: 12px;">{{v.name}}</el-tag>
        <el-button size="small" type="primary" @click="selectTag">选择分类</el-button>
      </el-form-item>
      <el-form-item label="简介">
        <el-input v-model="form.abstract" type="textarea"></el-input>
      </el-form-item>
      <el-form-item label="排序">
        <el-input v-model="form.sort"></el-input>
      </el-form-item>
      <el-form-item label="观看人数">
        <el-input v-model="form.watchnum"></el-input>
      </el-form-item>
      <el-form-item label="转载地址">
        <el-input v-model="form.from"></el-input>
      </el-form-item>
      <el-form-item label="主图设置">
        <el-upload
        class="upload-demo"
        :action="uploadUrl"
        :on-success="uploadSuccess"
        :file-list="form.mainimg"
        :limit="1"
        :headers="{ApiAuth:this.$store.state.user.token}"
        list-type="picture">
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
      </el-form-item>
      <el-form-item label="文章内容">
        <tinymce :height="300" v-model="form.content"></tinymce>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit" class="save-btn">保存</el-button>
      </el-form-item>
    </el-form>
    </el-card>
    <el-dialog title="标签" :visible.sync="tagDialogVisible" width="40%">
      <el-table :data="tagList" border height="320" @selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column property="Id" label="id" width="150"></el-table-column>
        <el-table-column property="name" label="姓名"></el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="tagDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveTag">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { timeToTimestamp, dateToTime } from '@/utils/index'
import Tinymce from '@/components/Tinymce'
import { articleDetail, updateArticle, articleTypeList, articleTagList } from '@/api/article'
export default {
  components: { Tinymce },
  name: 'articleEdit',
  data() {
    return {
      form: {},
      typeList: [],
      tagList: [],
      multipleSelection: [],
      tagDialogVisible: false,
      uploadUrl: this.$store.state.app.globalUrl + 'admin/Index/upload'
    }
  },
  methods: {
    onSubmit() {
      if (this.form.mainimg.length === 0) {
        this.form.mainimg.push({ url: '' })
      }
      const saveObj = {
        Id: this.form.id,
        title: this.form.title,
        addtime: timeToTimestamp(dateToTime(this.form.addtime, 'yyyy-MM-dd HH:mm:ss')),
        from: this.form.from,
        type: this.form.type,
        tags: JSON.stringify(this.form.tag),
        author: this.form.author,
        abstract: this.form.abstract,
        sort: this.form.sort,
        watchnum: this.form.watchnum,
        mainimg: this.form.mainimg[0].url,
        content: this.form.content
      }
      updateArticle(saveObj).then(response => {
        if (response.data.msg === '操作成功') {
          this.$message({
            message: '保存成功',
            type: 'success'
          })
        } else {
          this.$message.error('保存失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    uploadSuccess(response, file, fileList) {
      this.form.mainimg = [{ name: 'mainimg', url: response.data.fileUrl }]
    },
    getTypeList() {
      articleTypeList().then(response => {
        if (response.data.msg === '操作成功') {
          this.$nextTick(() => {
            this.typeList = response.data.data.list
          })
        } else {
          this.$message.error('获取类型失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    getTagList() {
      articleTagList().then(response => {
        if (response.data.msg === '操作成功') {
          this.$nextTick(() => {
            this.tagList = response.data.data.list
          })
        } else {
          this.$message.error('获取标签失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    saveTag() {
      this.form.tag = this.multipleSelection
      this.tagDialogVisible = false
    },
    selectTag() {
      this.tagDialogVisible = true
      this.multipleSelection = this.form.tag
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {
    this.getTypeList()
    this.getTagList()
    articleDetail({ id: this.$route.query.id }).then(response => {
      if (response.data.msg === '操作成功') {
        const article = response.data.data.article
        this.form = {
          id: article.Id,
          title: article.title,
          addtime: new Date(article.addtime * 1000),
          from: article.from,
          type: article.type,
          tag: JSON.parse(article.tags),
          author: article.author,
          abstract: article.abstract,
          sort: article.sort,
          watchnum: article.watchnum,
          mainimg: [{ url: article.mainimg }],
          content: article.content
        }
      } else {
        this.$message.error('获取文章失败')
      }
    }).catch(error => {
      console.log(error)
    })
  },
  destroyed() {
    // window.removeEventListener('hashchange', this.afterQRScan)
  }
}
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
.container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

</style>
