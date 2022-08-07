<template>
  <view class="pwd-retrieve-container">
    <uni-forms ref="form" :value="user" labelWidth="80px">
      <uni-forms-item label="旧密码" name="oldPassword">
        <uni-easyinput v-model="user.oldPassword" placeholder="请输入旧密码" type="password"/>
      </uni-forms-item>
      <uni-forms-item label="新密码" name="newPassword">
        <uni-easyinput v-model="user.newPassword" placeholder="请输入新密码" type="password"/>
      </uni-forms-item>
      <uni-forms-item label="确认密码" name="confirmPassword">
        <uni-easyinput v-model="user.confirmPassword" placeholder="请确认新密码" type="password"/>
      </uni-forms-item>
      <button type="primary" @click="submit">提交</button>
    </uni-forms>
  </view>
</template>

<script>
import {updateUserPwd} from "@/api/user"

export default {
  data() {
    return {
      user: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      rules: {
        oldPassword: {
          rules: [{
            required: true,
            errorMessage: '旧密码不能为空'
          }]
        },
        newPassword: {
          rules: [{
            required: true,
            errorMessage: '新密码不能为空',
          },
            {
              minLength: 6,
              maxLength: 20,
              errorMessage: '长度在 6 到 20 个字符'
            }
          ]
        },
        confirmPassword: {
          rules: [{
            required: true,
            errorMessage: '确认密码不能为空'
          }, {
            validateFunction: (rule, value, data) => data.newPassword === value,
            errorMessage: '两次输入的密码不一致'
          }
          ]
        }
      }
    }
  },
  onReady() {
    this.$refs.form.setRules(this.rules)
  },
  methods: {
    submit() {
      this.$refs.form.validate().then(res => {
        updateUserPwd(this.user.oldPassword, this.user.newPassword).then(response => {
          this.$modal.msgSuccess("修改成功")
        })
      })
    }
  }
}
</script>

<style lang="scss">
page {
  background-color: #ffffff;
}

.pwd-retrieve-container {
  padding-top: 36 rpx;
  padding: 15px;
}
</style>
