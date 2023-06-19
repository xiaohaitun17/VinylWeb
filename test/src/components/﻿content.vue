<template>
  <div class="com">
    <el-button type="text" @click="table = true" class="comment_btn">Comment</el-button>
    <el-drawer title="Comment" :visible.sync="table" direction="rtl" size="30%">
      <ul class="box1">
        <li v-for="(item, index) in com" :key="index" class="box2">
          <el-avatar
            size="large"
            src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
            class="hd"
          ></el-avatar>
          <div class="pl">
            <div>
              <span class="name">{{ item.user_name }}</span>
              <span class="time">{{ item.time }}</span>
            </div>
            <div class="content">{{ item.content }}</div>
          </div>
        </li>
      </ul>
      <div class="talk">
        <el-input type="text" v-model="from.content" class="inp"></el-input>
        <el-button @click="send">send</el-button>
      </div>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name: "comment",
  data() {
    return {
      table: false,
      com: [],
      from: {
        album_id: "",
        user_name: "",
        content: "",
        time: null,
      },
    };
  },

  props: {
    mes: String,
  },

  components: {},

  methods: {
    send() {
      if (this.$session.getSession("loginInfo")) {
        this.from.album_id = this.mes;
        this.from.time = this.getTimesInterval();
        let user_mes = this.$session.getSession("loginInfo");
        //   console.log(user_mes);
        this.from.user_name = user_mes.username;
        //   console.log(this.from);
        this.axios.post("/add_comment", this.from).then((res) => {
          console.log(res);
        });
      }else {
        this.$message('Please log in first!')
      }
    },
    getTimesInterval() {
      let year = new Date().getFullYear(); //获取当前时间的年份
      let month = new Date().getMonth() + 1; //获取当前时间的月份
      let day = new Date().getDate(); //获取当前时间的天数
      let hours = new Date().getHours(); //获取当前时间的小时
      let minutes = new Date().getMinutes(); //获取当前时间的分数
      let seconds = new Date().getSeconds(); //获取当前时间的秒数
      //当小于 10 的是时候，在前面加 0
      if (hours < 10) {
        hours = "0" + hours;
      }
      if (minutes < 10) {
        minutes = "0" + minutes;
      }
      if (seconds < 10) {
        seconds = "0" + seconds;
      }
      //拼接格式化当前时间
      return (
        year +
        "-" +
        month +
        "-" +
        day +
        " " +
        hours +
        ":" +
        minutes +
        ":" +
        seconds
      );
    },
  },
  created() {
    this.axios
      .get("get_comment", {
        params: {
          id: this.mes,
        },
      })
      .then((res) => {
        console.log(res);
        this.com = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style scoped>
.com {
    float: right;
    margin-right: 80px;
}
.comment_btn {
    width: 120px;
    height: 40px;
    font-size: 24px;
    color: yellow;
    font-family: fantasy;
}
.comment_btn:hover {
    color: orange;
    font-size: 26px;
}

.box1 {
  width: 95%;
  margin: 0 auto;
  color: black;
}
.box2 {
  width: 100%;
  min-height: 50px;
  border-bottom: 1px solid #f6f6f6;
  display: flex;
}
.pl {
  margin: auto 0;
}
.hd {
  margin: auto 10px;
}
.name {
  color: #7b7b7b;
}
.time {
  color: #7b7b7b;
  margin: 5px 10px;
}
.content {
  float: left;
  margin-top: 5px;
}

.talk {
  width: 100%;
  height: 80px;
  position: absolute;
  bottom: 15px;
  /* background: pink; */
}
.inp {
  width: 80%;
}
</style>
