<template>
  <div id="like">
    <div @click="collect">
      <img :src="likeVal" alt="" width="40px" />
    </div>
  </div>
</template>

<script>
export default {
  name: "like",
  data() {
    return {
     
    };
  },
  props: {  //Get the parameters passed by the parent component
    like: {   //Parameters passed by the parent component as to whether the user has favorites or not
      type: Boolean,
      default: false,
    },
    id: String   //Album id passed by the parent component
  },
  components: {},

  methods: {
    collect() {   //Click to collect
      if (this.$session.getSession("loginInfo")) {  //Determine if the user is logged in
        if (!this.like) {  //Determine if the user has favorites
          let mes = this.$session.getSession("loginInfo");
          this.axios
            .post("/add_collect", {
              user_id: mes.user_id,
              album_id: this.id,
            })
            .then((res) => {
              this.$message({
                type: 'success',
                message: 'Successful collection'
              })
              this.like = true;
            });
        }
      } else {
        this.$message("Please log in first !");
      }
    },
  },
  computed: {
    likeVal() {  //display different icon according to if user like or not like
      if (this.like) {
        return require("../assets/img/收藏.png");
      } else {
        return require("../assets/img/未收藏.png");
      }
    },
  },
};
</script>

<style scoped>
#like {
  width: 50px;
  height: 50px;
}
</style>
