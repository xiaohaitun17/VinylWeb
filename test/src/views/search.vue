<template>
  <div id="bg">
    <div class="container">
      <form action="" class="parent">
        <input
          type="text"
          class="search"
          placeholder="search vinyl/artist/member here..."
          v-model="content"
        />
        <input type="button" class="btn" @click="search" />
      </form>
    </div>
    <div class="list">
      <ul>
        <li class="hd_list">
          <div class="zero"></div>
          <div class="one">album</div>
          <div class="two">artist</div>
          <div class="three">genre</div>
        </li>
        <li
          v-for="(item, index) in list"
          :key="index"
          class="strip"
          @click="todetail(item)"
        >
          <div class="zero">{{ index + 1 }}</div>
          <div class="one">{{ item.name }}</div>
          <div class="two">{{ item.artist }}</div>
          <div class="three">{{ item.genre }}</div>
        </li>
        <li class="foot_list"></li>
      </ul>
    </div>
    <back></back>
  </div>
</template>

<script>
import back from "../components/back.vue";
export default {
  name: "search",
  data() {
    return {
      list: [],
      content: "",
    };
  },

  components: { back },

  methods: {
    getsong() {   //get all album
      this.axios.get("/all_album").then((res) => {
        this.list = res.data;
      });
    },
    todetail(item) {   //Jump to the album details page where the song is located
      this.$router.push({
        path: "/album",
        query: {
          id: item.album_id,
          name: item.album_name,
        },
      });
    },
    search() {    //search
      this.axios
        .get("/search", {
          params: {
            search: "%" + this.content + "%",
          },
        })
        .then((res) => {
          this.list = res.data;
          if (res.data.length > 0) {  //Determine if the search result is greater than 0
            this.$message({
              type: "success",
              message: "success",
            });
          } else {
            this.$message("No Date yet");
          }
        });
    },
    genre_class(item) {    //Search by genre
      this.axios
        .get("/genre_class", {
          params: {
            genre: item,
          },
        })
        .then((res) => {
          this.list = res.data;
          if (res.data.length > 0) {
            this.$message({
              type: "success",
              message: "success",
            });
          } else {
            this.$message("No Date yet");
          }
        });
    },
  },
  created() {
    if (this.$route.query.genre) {    
      //check if the route jump carries genre information, yes: show search results by genre No: show all song information
      this.genre_class(this.$route.query.genre);
    } else {
      this.getsong();
    }
  },
};
</script>

<style scoped>
#bg {
  width: 100%;
  min-height: 100vh;
  background: #2e3132;
  color: azure;
  padding-top: 40px;
}

.search {
  width: 90px;
  margin: auto;
  text-align: center;
  display: flex;
}
.searchsubmit {
  display: flex;
}
.search input[type="text"] {
  width: 400px;
  height: 30px;
  font-size: 16px;
  position: relative;
  right: 100px;
  border: 2px solid #ccc;
  border-radius: 20px;
  outline: none;
}
.search button[type="submit"] {
  height: 36px;
  width: 80px;
  position: relative;
  right: 100px;
  background-color: #2e3132;
  color: yellow;
  border: none;
  border-radius: 20px;
  font-size: 16px;
}

.container {
  height: 70px;
  width: 550px;
  margin: 0 auto;
  padding-top: 50px;
}
.parent {
  position: relative;
}
.search {
  width: 500px;
  height: 40px;
  border-radius: 18px;
  outline: none;
  border: 1px solid #ccc;
  padding-left: 20px;
  position: absolute;
  font-size: 20px;
}
.btn {
  height: 35px;
  width: 35px;
  position: absolute;
  background: url("../assets/img/topbar.png") no-repeat;
  background-size: 30px 30px;
  top: 6px;
  left: 485px;
  border: none;
  outline: none;
  cursor: pointer;
}

.kind {
  display: flex;
  justify-content: space-evenly;
}
.class_btn {
  width: 80px;
  height: 40px;
  color: yellow;
  border: 1px solid yellow;
  line-height: 40px;
  cursor: pointer;
}
.class_btn:hover {
  color: beige;
  border: 1px solid beige;
}

.list {
  width: 80%;
  margin: 10px auto;
  /* border: 1px solid silver; */
  box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.5);
  border-radius: 20px;
}
.hd_list {
  border-radius: 20px 20px 0 0;
  background-color: rgba(211, 211, 211, 0.25);
}
.foot_list {
  border-radius: 0 0 20px 20px;
  background-color: rgba(211, 211, 211, 0.25);
}
.zero {
  height: 50px;
  width: 50px;
  /* background: pink; */
}
.one {
  height: 50px;
  width: 300px;
  margin: 0;
  /* background: red; */
}
.two {
  height: 50px;
  width: 200px;
  /* background: blue; */
}
.three {
  height: 50px;
  width: 200px;
  /* background: yellow; */
}

li {
  height: 50px;
  line-height: 50px;
  display: flex;
  justify-content: space-around;
}
.strip {
  cursor: pointer;
  margin: 5px;
}
.strip:hover {
  color: yellow;
  box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.3);
}
</style>
