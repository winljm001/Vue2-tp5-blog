<template>
  <div class="container">
    <el-card class="box-card">
      <div class="filter-container">
        <el-button class="filter-item" type="primary" v-waves icon="el-icon-plus" @click="addDialog = true">{{$t('table.add')}}</el-button>
      </div>
      <el-table :data="list" v-loading="listLoading" border fit highlight-current-row
      style="width: 100%;">
      <el-table-column align="center" :label="$t('table.id')" >
        <template slot-scope="scope">
          <span>{{scope.row.Id}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="150px" :label="$t('table.title')">
        <template slot-scope="scope">
          <span>{{scope.row.name}}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" :label="$t('table.actions')" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="showEditDialog(scope.row)">{{$t('table.edit')}}</el-button>
          <el-button  size="mini" type="danger" @click="delType(scope.row.Id)">{{$t('table.delete')}}
          </el-button>
        </template>
      </el-table-column>
    </el-table>  
    
    </el-card>
    <el-dialog
      title="添加类型"
      :visible.sync="addDialog"
      width="40%">
      <el-form ref="form" :model="form" label-width="80px" @keyup.enter.native="addType">
      <el-form-item label="类型名">
        <el-input v-model="form.name"></el-input>
      </el-form-item>
    </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="addDialog = false">取 消</el-button>
        <el-button type="primary" @click="addType()">确 定</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title="编辑类型"
      :visible.sync="editDialog"
      width="40%">
      <el-form ref="form" :model="form2" label-width="80px" @keyup.enter.native="editType">
      <el-form-item label="类型名">
        <el-input v-model="form2.name"></el-input>
      </el-form-item>
    </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="editDialog = false">取 消</el-button>
        <el-button type="primary" @click="editType()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { addArticleType, articleTypeList, updateArticleType, delArticleType } from '@/api/article'

export default {
  components: { },
  name: 'articleType',
  data() {
    return {
      listLoading: true,
      addDialog: false,
      editDialog: false,
      list: [],
      form: {
        name: ''
      },
      form2: {
        name: '',
        Id: 0
      }
    }
  },
  methods: {
    getList() {
      articleTypeList({ size: 999 }).then(response => {
        if (response.data.msg === '操作成功') {
          this.list = response.data.data.list
          this.listLoading = false
        } else {
          this.$message.error('获取数据失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    addType() {
      this.addDialog = false
      addArticleType({ name: this.form.name }).then(response => {
        if (response.data.msg === '操作成功') {
          this.$message({
            message: '添加成功',
            type: 'success'
          })
          this.getList()
          this.form.name = ''
        } else {
          this.$message.error('添加失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    showEditDialog(obj) {
      this.editDialog = true
      this.form2 = obj
    },
    editType() {
      this.editDialog = false
      updateArticleType(this.form2).then(response => {
        if (response.data.msg === '操作成功') {
          this.$message({
            message: '编辑成功',
            type: 'success'
          })
          this.getList()
        } else {
          this.$message.error('编辑失败！')
        }
      }).catch(error => {
        console.log(error)
      })
    },
    delType(id) {
      this.$confirm('确认删除？')
        .then(_ => {
          delArticleType({ id: id }).then(response => {
            if (response.data.msg === '操作成功') {
              this.$message({
                message: '删除成功',
                type: 'success'
              })
              this.getList()
            } else {
              this.$message.error('删除失败！')
            }
          }).catch(error => {
            console.log(error)
          })
        })
    }
  },
  created() {
    // window.addEventListener('hashchange', this.afterQRScan)
  },
  mounted() {
    this.getList()
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
