<template>
  <i-frame :src="url"/>
</template>
<script>
import iFrame from "@/components/iFrame/index";

export default {
  name: "Nacos",
  components: {iFrame},
  data() {
    return {
      url: "http://127.0.0.1:8848/nacos/#/login"
    };
  },
};
</script>
