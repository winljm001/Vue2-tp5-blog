<template>
  <div class="container">
  <el-card class="box-card">

    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="昵称">
        <el-input v-model="form.nickname"></el-input>
      </el-form-item>
      <el-form-item label="用户名">
        <el-input v-model="form.username"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input v-model="form.password" type="password"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email"></el-input>
      </el-form-item>
      <el-form-item label="技术栈">
        <el-input v-model="form.technology"></el-input>
      </el-form-item>
      <el-form-item label="备案号">
        <el-input v-model="form.reference"></el-input>
      </el-form-item>
      <el-form-item label="头像设置">
        <el-upload
        class="upload-demo"
        :action="uploadUrl"
        :on-success="uploadSuccess"
        :file-list="form.headImg"
        :limit="1"
        :headers="{ApiAuth:this.$store.state.user.token}"
        list-type="picture">
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
      </el-form-item>
      <el-form-item label="logo设置">
        <el-upload
        class="upload-demo"
        :action="uploadUrl"
        :on-success="uploadSuccess1"
        :file-list="form.logo"
        :limit="1"
        :headers="{ApiAuth:this.$store.state.user.token}"
        list-type="picture">
        <el-button size="small" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">保存</el-button>
      </el-form-item>
    </el-form>
</el-card>
</div>
</template>

<script>
// import { isvalidUsername } from '@/utils/validate'
import { getAdmin, setAdmin } from '@/api/admin'
export default {
  components: { },
  name: 'adminSet',
  data() {
    return {
      form: {
        name: '',
        fileList2: []
      },
      uploadUrl: this.$store.state.app.globalUrl + 'admin/Index/upload'
    }
  },
  methods: {
    onSubmit() {
      const saveObj = {
        id: this.form.id,
        nickname: this.form.nickname,
        username: this.form.username,
        password: this.form.password,
        email: this.form.email,
        technology: this.form.technology,
        reference: this.form.reference,
        headImg: this.form.headImg[0].url,
        logo: this.form.logo[0].url
      }
      setAdmin(saveObj).then(response => {
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
      console.log('submit!')
    },
    uploadSuccess(response, file, fileList) {
      this.form.headImg = [{ name: 'headImg', url: response.data.fileUrl }]
    },
    uploadSuccess1(response, file, fileList) {
      this.form.logo = [{ name: 'logo', url: response.data.fileUrl }]
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {
    const that = this
    getAdmin(this.$store.state.user.uid).then(response => {
      that.form = response.data.data.admin
      that.form.logo = [{ name: 'logo', url: response.data.data.admin.logo }]
      that.form.headImg = [{ name: 'headImg', url: response.data.data.admin.headImg }]
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
