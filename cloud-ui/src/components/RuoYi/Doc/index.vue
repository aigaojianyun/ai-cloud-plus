<template>
  <div>
    <svg-icon icon-class="question" @click="goto"/>
  </div>
</template>

<script>
export default {
  name: 'Doc',
  data() {
    return {
      url: ''
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
