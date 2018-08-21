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
          placeholder="选择日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="作者">
        <el-input v-model="form.author"></el-input>
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
        <el-button type="primary" @click="onSubmit" class="save-btn">添加</el-button>
      </el-form-item>
    </el-form>
    </el-card>
  </div>
</template>

<script>
import { timeToTimestamp, dateToTime } from '@/utils/index'
import Tinymce from '@/components/Tinymce'
import { addArticle } from '@/api/article'
export default {
  components: { Tinymce },
  name: 'articleSet',
  data() {
    return {
      form: {
        author: 'winljm001',
        sort: '0',
        mainimg: [
          { url: '' }
        ]
      },
      uploadUrl: this.$store.state.app.globalUrl + 'admin/Index/upload'
    }
  },
  methods: {
    onSubmit() {
      const saveObj = {
        title: this.form.title,
        addtime: timeToTimestamp(dateToTime(this.form.addtime, 'yyyy-MM-dd HH:mm:ss')),
        from: this.form.from,
        author: this.form.author,
        abstract: this.form.abstract,
        sort: this.form.sort,
        mainimg: this.form.mainimg[0].url,
        content: this.form.content
      }
      addArticle(saveObj).then(response => {
        if (response.data.msg === '操作成功') {
          this.$message({
            message: '添加成功',
            type: 'success'
          })
        } else {
          this.$message.error('添加失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    uploadSuccess(response, file, fileList) {
      this.form.mainimg = [{ name: 'mainimg', url: response.data.fileUrl }]
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {

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
