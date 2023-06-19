<template>
  <div id="home">
    <!-- <audio src="../assets/music/Delacey-Dream It Possible.mp3" autoplay="autoplay" controls="controls" ref="audio">
      Your browser does not support the audio element.
    </audio> -->
    <div class="block1">
      <div class="info">
        <img src="../assets/img/profile.png" alt="" class="hd_pic" />
        <div class="name">{{ user_name }}</div>
      </div>
      <div class="collect">
        <div class="header">
          <p>MY COLLECTION LIST</p>
          <el-divider></el-divider>
        </div>
        <div class="col_list">
          <ul class="list" :class="{no_data: data_null}">
            <li
              v-for="item in pages.value"
              :key="item.album_id"
              class="card"
              @click="todetail(item)"
            >
              <img :src="item.image" alt="" class="album_pic" />
              <span class="mes">
                <h1 class="title">{{ item.name }}</h1>
                <p>
                  {{ item.artist }} - {{ item.recordCompany }} - {{ item.year }}
                </p>
              </span>
              <div class="del_btn" @click="del(item.album_id)">
                <img src="../assets/img/删除.png" alt="" width="30px" />
              </div>
            </li>
          </ul>
          <div class="page">
            <el-pagination
              @current-change="getcurrent"
              layout="prev, pager, next"
              :total="pages.total"
              :page-size="pages.size"
              background
            >
            </el-pagination>
          </div>
        </div>
      </div>
      <div class="toindex" @click="toindex">
        <p>TO SEARCH</p>
      </div>
      <div class="exit" @click="exit">
        
        <p>Exit</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      album_list: [],
      pages: {
        total: 0,
        current: 1,
        size: 4,
        value: [],
      },
      user_name: "",
      data_null: true
    };
  },

  components: {},

  methods: {
    getcurrent(i) {   //Functions executed by clicking on a page turn
      this.pages.current = i;
      const p = (i - 1) * this.pages.size;
      this.pages.value = this.album_list.slice(p, p + this.pages.size);
      // console.log(this.pages.value);
    },
    exit() {   //Log out
      this.$session.removeSession("loginInfo");    //Deleting login information stored in a session
      this.$router.push("/index");    //jump to home page
    },
    toindex() {   //Jump to home page
      this.$router.push("/index");
    },
    todetail(item) {    //Carries the album id and jumps to the album info detail page
      this.$router.push({
        path: "/album",
        query: {
          id: item.album_id,
          name: item.album_name,
        },
      });
    },
    getall() {    //Get a list of the user's favorites
      // console.log(this.$session.getSession('loginInfo'));
      this.axios
        .get("/get_collect", {
          params: {
            user_id: this.$session.getSession("loginInfo").user_id,
          },
        })
        .then((res) => {
          // console.log(res.data);
          this.album_list = res.data;
          this.pages.total = res.data.length;
          this.pages.value = res.data.slice(0, this.pages.size);
          this.no_date()
        })
        .catch((err) => {
          console.log("Failed to acquire data" + err);
        });
    },
    del(id) {   //Cancel favorites/delete favorite albums
      this.$confirm(
        "Are you sure you want to delete this collection?",
        "DELETE",
        {
          confirmButtonText: "YES",
          cancelButtonText: "NO",
        }
      )
        .then(() => {
          this.axios
            .post("/del_collect", {
              album_id: id,
              user_id: this.$session.getSession("loginInfo").user_id,
            })
            .then((res) => {
              this.getall();
              this.$message({
                type: "success",
                message: "Deleted successfully!",
              });
            })
            .catch((err) => {
              console.log("Failed to delete  " + err);
              this.$message({
                type: "error",
                message: "Failed to delete",
              });
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "Collection cancled",
          });
        });
    },
    no_date() {    //check if the collection list is empty, binding dynamic style
      if (this.pages.total == 0) {
        this.data_null = true;
      } else {
        this.data_null = false;
      }
    },
  },
  computed: {
    
  },
  created() {
    this.user_name = this.$session.getSession("loginInfo").name;  //get user name from session
    this.getall();
  },
};
</script>

<style scoped>
#home {
  width: 100%;
  min-height: 100vh;
  background: #2e3132;
  position: relative;
  color: beige;
}

.block1 {
  display: flex;
}

.info {
  width: 500px;
  /* background: palevioletred; */
}
.hd_pic {
  margin-top: 150px;
  /* margin: 150px 50px 0 50px; */
  width: 250px;
  box-shadow: 0 2px 12px 0 rgba(255, 207, 49, 0.1);
}
.name {
  color: beige;
  font-size: 30px;
  margin-top: 25px;
}

.collect {
  flex: 1;
  /* min-width: 1200px; */
  margin-top: 120px;
  padding-left: 50px;
  /* background: darkorchid; */
}
.header {
  width: 400px;
  color: beige;
  font-size: 20px;
}

.exit {
  width: 200px;
  height: 100px;
  color: yellow;
  position: absolute;
  top: 100px;
  right: 80px;
  font-size: 28px;
  font-family: fantasy;
  cursor: pointer;
}
.exit:hover {
  color: orange;
  font-size: 30px;
}

.toindex {
  width: 200px;
  height: 100px;
  color: yellow;
  position: absolute;
  top: 100px;
  left: 80px;
  font-size: 28px;
  font-family: fantasy;
  cursor: pointer;
}
.toindex:hover {
  color: orange;
  font-size: 30px;
}

.col_list {
  width: 600px;
}
.list {
  height: 400px;
}
.no_data {
  /* box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.25); */
  /* border: 1px solid #ffffff; */
  background: url("../assets/img/暂无﻿数据.png") no-repeat;
  background-size: contain;
}
.card {
  width: 580px;
  height: 90px;
  /* padding: 5px; */
  border: 1px solid #787878;
  margin: 5px;
  display: flex;
}
.card:hover {
  box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.2);
}
.album_pic {
  width: 90px;
  height: 90px;
  /* margin: 5px; */
  float: left;
}
.mes {
  flex: 1;
  /* background: pink; */
}
.title {
  font-size: 22px;
  font-family: fantasy;
  margin: 15px 0;
  /* background: yellow; */
}

.pic {
  width: 80px;
  height: 80px;
}

.del_btn {
  /* width: 90px;
  height: 90px; */
  float: right;
  /* line-height: 90px; */
  cursor: pointer;
  margin: 30px;
}
.del_btn:hover {
  background: red;
  border-radius: 50%;
}
</style>
