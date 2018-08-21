<template>
  <div class="container">
    <el-card class="box-card">
      文章列表
    </el-card>
  </div>
</template>

<script>
// import { isvalidUsername } from '@/utils/validate'

export default {
  components: { },
  name: 'articleSet',
  data() {
    return {
      // uploadUrl: this.$store.state.app.globalUrl + 'admin/Index/upload'
    }
  },
  methods: {
    onSubmit() {
      // const saveObj = {
      //   id: this.form.id,
      //   nickname: this.form.nickname,
      //   username: this.form.username,
      //   password: this.form.password,
      //   email: this.form.email,
      //   technology: this.form.technology,
      //   reference: this.form.reference,
      //   headImg: this.form.headImg[0].url,
      //   logo: this.form.logo[0].url
      // }
      // setAdmin(saveObj).then(response => {
      //   if (response.data.msg === '操作成功') {
      //     this.$message({
      //       message: '保存成功',
      //       type: 'success'
      //     })
      //   } else {
      //     this.$message.error('保存失败！')
      //   }
      // }).catch(error => {
      //   console.log(error)
      // })
      // console.log('submit!')
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {
    // const that = this
    // getAdmin(this.$store.state.user.uid).then(response => {
    //   that.form = response.data.data.admin
    //   that.form.logo = [{ name: 'logo', url: response.data.data.admin.logo }]
    //   that.form.headImg = [{ name: 'headImg', url: response.data.data.admin.headImg }]
    // }).catch(error => {
    //   console.log(error)
    // })
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
