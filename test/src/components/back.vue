<template>
  <div>
    <div class="back" @click="back"> BACK </div>
  </div>
</template>

<script>
export default {
  name: 'back',
  data () {
    return {
    };
  },

  components: {},

  methods: {
    back() {   //Return to previous level of routing
      this.$router.back()
    },
  }
}
</script>

<style scoped>
.back {
  position: absolute;
  top: 100px;
  left: 120px;
  font-size: 24px;
  color: yellow;
  cursor: pointer;
  font-family: fantasy;
  font-weight: 700;
  
}
.back:hover {
  font-size: 26px;
  color: orange;
}
</style>