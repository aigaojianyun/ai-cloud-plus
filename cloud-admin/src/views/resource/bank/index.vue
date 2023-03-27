<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="银行名称" prop="bankName">
        <el-input
          v-model="queryParams.bankName"
          placeholder="请输入银行名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['resource:bank:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit-outline"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['resource:bank:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['resource:bank:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['resource:bank:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bankList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="编号" align="center" prop="id"/>
      <el-table-column label="银行名称" align="center" prop="bankName"/>
      <el-table-column label="icon" align="center" prop="bankIcon">
        <template slot-scope="scope">
          　<img :src="scope.row.bankIcon" width="40" height="40" style="border-radius: 50%;"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit-outline"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['resource:bank:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['resource:bank:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改银行信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="银行名称" prop="bankName">
          <el-input v-model="form.bankName" placeholder="银行名称"/>
        </el-form-item>
        <el-form-item label="icon" prop="bankIcon">
          <div class="component-upload-image">
            <el-upload
              v-model="form.bankIcon"
              list-type="picture-card"
              name="file"
              :action="uploadFile"
              :before-upload="handleBeforeUpload"
              :on-success="handleUploadSuccess"
              :on-error="handleUploadError"
              :show-file-list="false"
              style="display: inline-block; vertical-align: top">
              <el-image v-if="!form.bankIcon" :src="form.bankIcon">
                <div slot="error" class="image-slot">
                  <i class="el-icon-plus"/>
                </div>
              </el-image>
              <div v-else class="image">
                <el-image :src="form.bankIcon" :style="`width:150px;height:150px;`" fit="fill"/>
                <div class="mask">
                  <div class="actions">
                <span title="预览" @click.stop="dialogVisible = true"><i class="el-icon-zoom-in"/>
                </span>
                    <span title="移除" @click="handleDeleteFile(form.bankIcon)"><i class="el-icon-delete"/>
                </span>
                  </div>
                </div>
              </div>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible" title="预览" width="800" append-to-body>
              <img :src="form.bankIcon" style="display: block; max-width: 100%; margin: 0 auto;">
            </el-dialog>
          </div>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>

    </el-dialog>
  </div>
</template>

<script>
import {addBank, delBank, getBank, listBank, updateBank} from "@/api/resource/bank";
import {uploadFile,} from "@/api/upload";

export default {
  name: "Bank",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 银行信息表格数据
      bankList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bankName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        bankName: [
          {required: true, message: "银行名称不能为空", trigger: "blur"}
        ],
      },
      //上传图片
      uploadFile,
      dialogVisible: false,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询银行信息列表 */
    getList() {
      this.loading = true;
      listBank(this.queryParams).then(response => {
        this.bankList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        bankName: null,
        bankIcon: null,
        sort: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加银行信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getBank(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改银行信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBank(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBank(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除银行信息编号为"' + ids + '"的数据项？').then(function () {
        return delBank(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/bank/export', {
        ...this.queryParams
      }, `bank_${new Date().getTime()}.xlsx`)
    },
    /** 验证图片格式和大小  */
    handleBeforeUpload(file) {
      const isLt1024M = file.size / 1024 / 1024 < 1024;
      if (['image/jpg', 'image/png', 'image/jpeg', 'image/gif'].indexOf(file.type) == -1) {
        this.$modal.msgError('请上传正确的图片格式');
        return false;
      }
      if (!isLt1024M) {
        this.$modal.msgError('上传图片大小不能超过1024MB哦!');
        return false;
      }
    },
    /** 上传成功回调 */
    handleUploadSuccess(res, file) {
      if (res.code == 200) {
        this.form.bankIcon = res.data.url;
        this.$modal.msgSuccess(res.msg);
      } else {
        this.$modal.msgError('上传失败，请重新上传！');
      }
      this.$emit("input", res.url);
    },
    /** 上传失败 */
    handleUploadError(err) {
      this.$modal.msgError("上传失败, 请重试");
    },
    /** 删除文件 */
    handleDeleteFile() {
      this.form.bankIcon = null;
      this.$emit("input", '');
    },
  }
};
</script>
<style scoped lang="scss">
.image {
  position: relative;

  .mask {
    opacity: 0;
    position: absolute;
    top: 0;
    width: 100%;
    height: 150px;
    background-color: rgba(0, 0, 0, 0.5);
    transition: all 0.3s;
  }

  &:hover .mask {
    opacity: 1;
  }
}
</style>
