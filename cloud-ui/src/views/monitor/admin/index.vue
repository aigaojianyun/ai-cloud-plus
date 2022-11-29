<template>
  <i-frame :src="url" />
</template>
<script>
import iFrame from "@/components/iFrame/index";

export default {
  name: "Admin",
  components: { iFrame },
  data() {
    return {
      url: "http://10.0.0.9:9100/login"
    };
  },
};
</script>
