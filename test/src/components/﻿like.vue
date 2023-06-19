<template>
  <div id="like">
    <div @click="collect">
      <img :src="likeVal" alt="" width="40px">
    </div>
  </div>
</template>

<script>
export default {
  name: 'like',
  data () {
    return {
      like: true
    };
  },

  components: {},

  methods: {
    collect() {
      this.like = !this.like
    }
  },
  computed: {
    likeVal() {
      if(this.like) {
        return require('../assets/img/收藏.png')
      }else {
        return require('../assets/img/未收藏.png')
      }
    }
  }
}
</script>

<style scoped>
#like {
  width: 50px;
  height: 50px;
}
</style>