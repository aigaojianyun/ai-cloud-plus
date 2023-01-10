<template>
  <i-frame :src="url"/>
</template>
<script>
import iFrame from "@/components/iFrame/index";

export default {
  name: "Knife4j",
  components: {iFrame},
  data() {
    return {
      url: "http://localhost:8080/doc.html#/home"
    };
  },
};
</script>
