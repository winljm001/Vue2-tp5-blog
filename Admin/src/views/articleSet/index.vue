<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input @keyup.enter.native="handleFilter" style="width: 200px;" class="filter-item" :placeholder="$t('table.title')" v-model="listQuery.keywords">
      </el-input>
      <el-select clearable style="width: 90px" class="filter-item" v-model="listQuery.status" :placeholder="$t('table.status')">
        <el-option label="启用" value="1">
        </el-option>
        <el-option label="禁用" value="0">
        </el-option>
      </el-select>
      <!-- <el-select clearable class="filter-item" style="width: 130px" v-model="listQuery.type" :placeholder="$t('table.type')">
        <el-option v-for="item in  calendarTypeOptions" :key="item.key" :label="item.display_name+'('+item.key+')'" :value="item.key">
        </el-option>
      </el-select> -->
      <el-button class="filter-item" type="primary" v-waves icon="el-icon-search" @click="handleFilter">{{$t('table.search')}}</el-button>
    </div>

    <el-table :data="list" v-loading="listLoading" border fit highlight-current-row
      style="width: 100%;">
      <el-table-column align="center" :label="$t('table.id')" width="65">
        <template slot-scope="scope">
          <span>{{scope.row.Id}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="150px" :label="$t('table.title')">
        <template slot-scope="scope">
          <span class="link-type">{{scope.row.title}}</span>
          <el-tag>{{scope.row.typeName}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column width="150px" align="center" :label="$t('table.date')">
        <template slot-scope="scope">
          <span>{{scope.row.addtime | parseTime('{y}-{m}-{d} {h}:{i}')}}</span>
        </template>
      </el-table-column>
      <el-table-column width="150px" align="center" :label="$t('table.author')">
        <template slot-scope="scope">
          <span>{{scope.row.author}}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" :label="$t('table.readings')" width="95">
        <template slot-scope="scope">
          <span>{{scope.row.watchnum}}</span>
        </template>
      </el-table-column>
      <el-table-column class-name="status-col" :label="$t('table.status')" width="100">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusFilterClass">{{scope.row.status | statusFilter}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" :label="$t('table.actions')" width="230" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="handleUpdate(scope.row)">{{$t('table.edit')}}</el-button>
          <el-button  size="mini" type="danger" @click="handleDelete(scope.row,scope.row.Id)">{{$t('table.delete')}}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="pagination-container">
      <el-pagination background @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="listQuery.page" :page-sizes="[10,20,30, 50]" :page-size="listQuery.limit" layout="total, sizes, prev, pager, next, jumper" :total="total">
      </el-pagination>
    </div>

  </div>
</template>

<script>
import { articleList, delArticle } from '@/api/article'
import waves from '@/directive/waves' // 水波纹指令
export default {
  name: 'articleList',
  directives: {
    waves
  },
  data() {
    return {
      list: null,
      total: null,
      listLoading: true,
      listQuery: {
        page: 1,
        size: 10,
        status: undefined,
        keywords: undefined,
        type: undefined
      }

    }
  },
  created() {
    this.getList()
  },
  filters: {
    statusFilterClass(status) {
      const statusMap = ['danger', 'success']
      return statusMap[status]
    },
    statusFilter(status) {
      const statusMap = ['禁用', '启用']
      return statusMap[status]
    }
  },
  methods: {
    getList() {
      this.listLoading = true
      articleList(this.listQuery).then(response => {
        if (response.data.msg === '操作成功') {
          this.listLoading = false
          console.log(response.data)
          this.list = response.data.data.list
          this.total = response.data.data.count
        }
      }).catch(error => {
        console.log(error)
      })
    },
    handleFilter() {
      this.listQuery.page = 1
      this.getList()
    },
    handleSizeChange(val) {
      this.listQuery.limit = val
      this.getList()
    },
    handleCurrentChange(val) {
      this.listQuery.page = val
      this.getList()
    },
    handleModifyStatus(row, status) {
      this.$message({
        message: '操作成功',
        type: 'success'
      })
      row.status = status
    },

    handleDelete(row, id) {
      delArticle({ id: id }).then(response => {
        if (response.data.msg === '操作成功') {
          this.$notify({
            title: '成功',
            message: '删除成功',
            type: 'success',
            duration: 2000
          })
          const index = this.list.indexOf(row)
          this.list.splice(index, 1)
        } else {
          this.$notify.error({
            title: '错误',
            message: '删除失败'
          })
        }
      }).catch(error => {
        console.log(error)
      })
    }

  }
}
</script>
