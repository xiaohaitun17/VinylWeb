<template>
  <div id="part2">
    <div class="box">
      <div class="min_box">
        <h1 class="title">Discover your next Vinly</h1>
        <p  class="titlep">With our carefully selected high-rated albums, you're guaranteed to find something that will resonate with you.</p>
        <ul class="block">
          <li
            v-for="item in album_list"
            :key="item.album_id"
            class="list"
            @click="todetail(item)"
          >
            <el-image :src="item.image" fit="cover" class="pic"></el-image>
            <el-divider></el-divider>
            <div class="mes">
              <h2>{{ item.name }}</h2>
              <p>{{ item.year }}</p>
            </div>
          </li>
        </ul>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "part2",
  data() {
    return {
      album_list: [],
    };
  },

  components: {},

  methods: {
    todetail(item) {   //Jump to the album details page with album id information
      this.$router.push({
        path: "/album",
        query: {
          id: item.album_id,
          name: item.album_name
        },
      });
    },
    getalbum() {  //Get all album information
      this.axios
        .get("/all_album")
        .then((res) => {
          console.log(res);
          this.album_list = res.data.slice(0, 8);
        })
        .catch((err) => {
          console.log(err);
        });
    },
   
  },

  created() {   //Create page to get all album information
    this.getalbum();
  },
};
</script>

<style scoped>
#part2 {
  width: 100%;
  margin: auto;
  padding-top: 10px;
}
.box {
  padding-bottom: 25px;
  display: flex;
  justify-content: center;
}
.min_box {
  width: 90%;
  margin: auto;
}

.title {
  font-size: 30px;
  /* font-family: fantasy; */
  margin-top: 90px;
  margin-bottom: 40px;
  float: middle;
  font-family: fantasy;
}
.titlep {
  font-size: 25px;
  /* font-family: fantasy; */
  margin-left: 300px; 
  margin-right :300px;
  margin-bottom: 50px;
  float: middle;
  font-family: fantasy;
}

.block {
  width: 90%;
  margin: 0 auto;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}

.list {
  /* display: flex; */
  width: 200px;
  cursor: pointer;
  padding: 5px;
  color: aliceblue;
  margin: 10px;
}
.list:hover {
  color: yellow;
  box-shadow: 0 2px 12px 0 rgba(255, 239, 18, 0.1);
}
.pic {
  width: 200px;
  height: 200px;
}
.mes {
  height: 50px;
  padding: 5px;
  font-size: 18px;
  /* background: pink; */
}
p {
  display: block;
  /* float: left; */
  font-size: 15px;
  margin-top: 8px;
}
.song_list {
  height: 35px;
  display: flex;
  width: 400px;
  cursor: pointer;
  padding: 5px;
}
.song_list:hover {
  color: orange;
}
</style>