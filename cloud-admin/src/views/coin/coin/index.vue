<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="货币名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入货币名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="中文名称" prop="cnName">
        <el-input
          v-model="queryParams.cnName"
          placeholder="请输入中文名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="英文简称" prop="enName">
        <el-input
          v-model="queryParams.enName"
          placeholder="请输入英文简称"
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
          v-hasPermi="['coin:coin:add']"
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
          v-hasPermi="['coin:coin:edit']"
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
          v-hasPermi="['coin:coin:remove']"
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
          v-hasPermi="['coin:coin:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="coinList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="编号" align="center" prop="id"/>
      <el-table-column label="货币全称" align="center" prop="name" width="120"/>
      <el-table-column label="中文名称" align="center" prop="cnName"/>
      <el-table-column label="英文简称" align="center" prop="enName"/>
      <el-table-column label="icon" align="center" prop="iconUrl">
        <template slot-scope="scope">
          　<img :src="scope.row.iconUrl" width="30" height="30" style="border-radius: 50%;"/>
        </template>
      </el-table-column>
      <el-table-column label="账户类型" align="center" prop="accountType">

      </el-table-column>
      <el-table-column label="最小提币手续费" align="center" prop="minTxFee" width="120">

      </el-table-column>
      <el-table-column label="最小提币数量" align="center" prop="minWithdrawAmount" width="100">

      </el-table-column>
      <el-table-column label="最大提币手续费" align="center" prop="maxTxFee" width="120">

      </el-table-column>
      <el-table-column label="最大提币数量" align="center" prop="maxWithdrawAmount" width="100">

      </el-table-column>
      <el-table-column label="提币" align="center" prop="canWithdraw">
        <template slot-scope="scope">
          　<el-tag :type="scope.row.canWithdraw === 0 ? 'success' : 'info'">是</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="充币" align="center" prop="canRecharge">
        <template slot-scope="scope">
          　<el-tag :type="scope.row.canWithdraw === 0 ? 'success' : 'info'">是</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="转账" align="center" prop="canTransfer">
        　<template slot-scope="scope">
          　<el-tag :type="scope.row.canWithdraw === 0 ? 'success' : 'info'">是</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="自动提币" align="center" prop="canAutoWithdraw" width="80">
        　<template slot-scope="scope">
          　<el-tag :type="scope.row.canWithdraw === 0 ? 'success' : 'info'">是</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="充币阈值" align="center" prop="rechargeAmount" width="80">

      </el-table-column>
      <el-table-column label="提现阈值" align="center" prop="withdrawThreshold" width="80">

      </el-table-column>
      <el-table-column label="矿工费" align="center" prop="minerFee">

      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit-outline"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['coin:coin:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['coin:coin:remove']"
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

    <!-- 添加或修改货币对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="货币名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入货币名称"/>
        </el-form-item>
        <el-form-item label="中文名称" prop="cnName">
          <el-input v-model="form.cnName" placeholder="请输入中文名称"/>
        </el-form-item>
        <el-form-item label="英文简称" prop="enName">
          <el-input v-model="form.enName" placeholder="请输入英文简称"/>
        </el-form-item>
        <el-form-item label="logo图url" prop="iconUrl">
          <el-input v-model="form.iconUrl" placeholder="请输入logo图url"/>
        </el-form-item>
        <el-form-item label="币种资料链接" prop="infolink">
          <el-input v-model="form.infolink" placeholder="请输入币种资料链接"/>
        </el-form-item>
        <el-form-item label="币种简介" prop="information">
          <el-input v-model="form.information" placeholder="请输入币种简介"/>
        </el-form-item>
        <el-form-item label="最小提币手续费" prop="minTxFee">
          <el-input v-model="form.minTxFee" placeholder="请输入最小提币手续费"/>
        </el-form-item>
        <el-form-item label="最小提币数量" prop="minWithdrawAmount">
          <el-input v-model="form.minWithdrawAmount" placeholder="请输入最小提币数量"/>
        </el-form-item>
        <el-form-item label="最大提币手续费" prop="maxTxFee">
          <el-input v-model="form.maxTxFee" placeholder="请输入最大提币手续费"/>
        </el-form-item>
        <el-form-item label="最大提币数量" prop="maxWithdrawAmount">
          <el-input v-model="form.maxWithdrawAmount" placeholder="请输入最大提币数量"/>
        </el-form-item>
        <el-form-item label="对人民币汇率" prop="cnyRate">
          <el-input v-model="form.cnyRate" placeholder="请输入对人民币汇率"/>
        </el-form-item>
        <el-form-item label="对美元汇率" prop="usdRate">
          <el-input v-model="form.usdRate" placeholder="请输入对美元汇率"/>
        </el-form-item>
        <el-form-item label="是否能提币" prop="canWithdraw">
          <el-input v-model="form.canWithdraw" placeholder="请输入是否能提币"/>
        </el-form-item>
        <el-form-item label="是否能充币" prop="canRecharge">
          <el-input v-model="form.canRecharge" placeholder="请输入是否能充币"/>
        </el-form-item>
        <el-form-item label="是否能转账" prop="canTransfer">
          <el-input v-model="form.canTransfer" placeholder="请输入是否能转账"/>
        </el-form-item>
        <el-form-item label="是否能自动提币" prop="canAutoWithdraw">
          <el-input v-model="form.canAutoWithdraw" placeholder="请输入是否能自动提币"/>
        </el-form-item>
        <el-form-item label="充币阈值" prop="rechargeAmount">
          <el-input v-model="form.rechargeAmount" placeholder="请输入充币阈值"/>
        </el-form-item>
        <el-form-item label="提现阈值" prop="withdrawThreshold">
          <el-input v-model="form.withdrawThreshold" placeholder="请输入提现阈值"/>
        </el-form-item>
        <el-form-item label="转账时付给矿工的手续费" prop="minerFee">
          <el-input v-model="form.minerFee" placeholder="请输入转账时付给矿工的手续费"/>
        </el-form-item>
        <el-form-item label="充值地址" prop="depositAddress">
          <el-input v-model="form.depositAddress" placeholder="请输入充值地址"/>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序"/>
        </el-form-item>
        <el-form-item label="状态：0启用，2停用" prop="statusFlag">
          <el-input v-model="form.statusFlag" placeholder="请输入状态：0启用，2停用"/>
        </el-form-item>
        <el-form-item label="删除：0未删除，2已删除" prop="deleteFlag">
          <el-input v-model="form.deleteFlag" placeholder="请输入删除：0未删除，2已删除"/>
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
import {addCoin, delCoin, getCoin, listCoin, updateCoin} from "@/api/coin/coin";

export default {
  name: "Coin",
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
      // 货币表格数据
      coinList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        cnName: null,
        enName: null,
        iconUrl: null,
        infolink: null,
        information: null,
        minTxFee: null,
        minWithdrawAmount: null,
        maxTxFee: null,
        maxWithdrawAmount: null,
        cnyRate: null,
        usdRate: null,
        canWithdraw: null,
        canRecharge: null,
        canTransfer: null,
        canAutoWithdraw: null,
        rechargeAmount: null,
        withdrawThreshold: null,
        minerFee: null,
        accountType: null,
        depositAddress: null,
        sort: null,
        statusFlag: null,
        deleteFlag: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          {required: true, message: "货币名称不能为空", trigger: "blur"}
        ],
        statusFlag: [
          {required: true, message: "状态：0启用，2停用不能为空", trigger: "blur"}
        ],
        deleteFlag: [
          {required: true, message: "删除：0未删除，2已删除不能为空", trigger: "blur"}
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询货币列表 */
    getList() {
      this.loading = true;
      listCoin(this.queryParams).then(response => {
        this.coinList = response.rows;
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
        name: null,
        cnName: null,
        enName: null,
        iconUrl: null,
        infolink: null,
        information: null,
        minTxFee: null,
        minWithdrawAmount: null,
        maxTxFee: null,
        maxWithdrawAmount: null,
        cnyRate: null,
        usdRate: null,
        canWithdraw: null,
        canRecharge: null,
        canTransfer: null,
        canAutoWithdraw: null,
        rechargeAmount: null,
        withdrawThreshold: null,
        minerFee: null,
        accountType: null,
        depositAddress: null,
        sort: null,
        statusFlag: null,
        deleteFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
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
      this.title = "添加货币";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCoin(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改货币";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCoin(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCoin(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除货币编号为"' + ids + '"的数据项？').then(function () {
        return delCoin(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/coin/export', {
        ...this.queryParams
      }, `coin_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
