<template>
  <div id="album">
    <back></back>
    <div class="box1">
      <div class="left">
        <h2 class="title1">{{ from.name }}</h2>
        <ul>
          <h2 class="title2">{{ from.artist }}</h2>
          <li v-for="item in list" :key="item.vinyl_id" class="song">
            {{ item.name }}
          </li>
        </ul>
      </div>
      <div class="right">
        <div class="bg_r"></div>
        <el-image :src="from.image" class="pic" fit="cover"></el-image>
      </div>

      <like :like="like" :id="id" class="like"></like>
    </div>
    <!-- <comment :mes="id"></comment> -->
    <div class="box2">
      <span class="block"
        ><p>Company: {{ from.recordCompany }}</p></span
      >
      <span class="block"
        ><p>Genre: {{ from.genre }}</p></span
      >
      <span class="block">
        <p>Rate:</p>
        <el-rate
          v-model="from.rating"
          show-score
          text-color="#ff9900"
        ></el-rate>
      </span>
      <span>
        <comment :mes="id"></comment>
      </span>
    </div>
    <back></back>
  </div>
</template>

<script>
//导入组件
import comment from "../components/content.vue";
import like from "../components/like.vue";
import back from "../components/back.vue";
export default {
  name: "album",
  data() {
    return {
      list: [],
      value1: null,
      id: "",
      from: {},
      like: false,
    };
  },

  components: { comment, like, back },

  methods: {
    getsong() {    //Get tracklist by album id
      this.axios
        .get("/song_list", {
          params: {
            id: this.$route.query.id,
          },
        })
        .then((res) => {
          this.list = res.data;
        });
    },
    getalbum() {    //Get album details by album id
      this.axios
        .get("/album_info", {
          params: {
            id: this.$route.query.id,
          },
        })
        .then((res) => {
          this.from = res.data[0];
          console.log(res.data[0]);
        });
    },
    judge_like() {    //check if the user has liked the album
      if (this.$session.getSession("loginInfo")) {     //check if the user is logged in
        let mes = this.$session.getSession("loginInfo");
        this.axios
          .get("/judge_like", {
            params: {
              user_id: mes.user_id,
              album_id: this.id,
            },
          })
          .then((res) => {
            this.like = res.data.result;
          });
      } else {
        this.like = false;
      }
    },
  },
  created() {
    this.id = this.$route.query.id;  //Get the album id that the page jump is carrying
    this.getalbum();
    this.getsong();
    this.judge_like();
  },
};
</script>

<style scoped>
#album {
  width: 100%;
  min-height: 100vh;
  background: #2e3132;
  color: aliceblue;
}

.box1 {
  width: 100%;
  height: 700px;
  display: flex;
  justify-content: center;
  padding-top: 100px;
  position: relative;
}
.left {
  width: 600px;
  /* background: pink; */
  margin: 50px;
}
.right {
  width: 650px;
  /* background: palegoldenrod; */
  margin-left: 50px;
  padding-left: 50px;
  position: relative;
}
.title1 {
  font-size: 70px;
  margin: 15px;
}

.title2 {
  font-size: 30px;
  margin-bottom: 20px;
}
.song {
  height: 35px;
  cursor: pointer;
}
.song:hover {
  color: orange;
}

.pic {
  width: 500px;
  height: 400px;
  border-radius: 50%;
  transform: rotate(10deg);
  position: absolute;
  left: 10px;
  top: 50px;
}
.bg_r {
  position: absolute;
  left: 0;
  width: 550px;
  height: 400px;
  border-radius: 50%;
  border: 2px solid seashell;
  transform: rotate(-15deg);
  top: 50px;
}

.box2 {
  display: flex;
  justify-content: center;
  position: relative;
}
.block {
  width: 350px;
  margin: 20px 40px;
  padding: 10px;
  border-top: 1px solid #ffffff;
  color: aliceblue;
  font-size: 24px;
}
.block:hover {
  border-top: 1px solid yellow;
  color: yellow;
}
p {
  float: left;
}

.like {
  /* float: right; */
  position: absolute;
  right: 310px;
  bottom: 100px;
  cursor: pointer;
} 
</style>
