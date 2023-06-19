<template>
  <div id="index">
    <div class="part1">
      <div>
        <img src="../assets/img/唱片.png" alt="" class="logo" />
      </div>

      <div class="title">
        <h1>stacksofwax</h1>
        <div class="text"><em>Find music records here...</em></div>
      </div>
      <div class="sign" v-if="!log">
        <div class="block" @click="tosign">sign up</div>
        <div class="block" @click="tolog">log in</div>
      </div>
      <div class="sign" v-else>
        <div class="block" @click="tohome">MY HOME</div>
      </div>
    </div>
    <div class="container">
      <button class="search_btn" @click="tosearch">Search</button>
    </div>
    <hr class="hr2" />
    <part2></part2>
    <hr class="hr2" />
    <part3></part3>
  </div>
</template>

<script>
//import component
import part2 from "../components/part2.vue";
import part3 from "../components/part3.vue";
export default {
  name: "index",
  data() {
    return {
      content: "",
      info: "",
      log: false,
    };
  },

  components: { part2, part3 },

  methods: {
    tosign() {
      this.$router.push("/register");
    },
    tolog() {
      this.$router.push("/login");
    },
    tohome() {
      this.$router.push("/home");
    },
    tosearch() {
      this.$router.push("/search");
    },
  },
  created() {
     //check whether the user is logged in and whether the page displays a home button or a login button
    if (this.$session.getSession("loginInfo")) { 
      this.log = true;
    } else {
      this.log = flase;
    }
  },
};
</script>

<style scoped>
.hr2 {
  margin-left: 120px;
  margin-right: 120px;
  margin-top: 110px;
  height: 12px;
  border: 0;
  box-shadow: inset 0 12px 12px -12px rgba(0, 0, 0, 0.5);
}

.logo {
  opacity: 0.9;
}

#index {
  width: 100%;
  min-height: 100vh;
  background: #2e3132;
  color: yellow;
  padding: 20px 0;
}
.part1 {
  padding-top: 130px;
  display: flex;
  width: 100%;
  justify-content: space-evenly;
  margin-left: 30px;
}
.logo {
  width: 320px;
  animation: move1 3s infinite linear;
}
@keyframes move1 {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
.title {
  margin: auto 0;
  margin-left: -20px;
  margin-top: -1px;
  font-family: fantasy;
}
h1 {
  font-size: 80px;
}
.text {
  font-size: 30px;
  margin-top: 20px;
  margin-left: 30px;
}
.sign {
  width: 250px;
  height: 120px;
  font-size: 28px;
  margin-top: 60px;
  font-family: Marker Felt, fantasy;
}
.block {
  margin: 15px;
  cursor: pointer;
}
.block:hover {
  color: orange;
  font-size: 30px;
}

/* 搜索button */
.container {
  height: 70px;
  width: 570px;
  margin: -10px auto 0 auto;
  margin-left: 480px;
}
.search_btn {
  font-size: 25px;
  height: 70px;
  width: 250px;
  background-color: #000;
  border: 3px solid yellow;
  border-radius: 1em;
  color: yellow;
  font-weight: bolder;
  transition: cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.4s;
  box-shadow: -5px 5px 0px 0px yellow;
  font-family: fantasy;
}
.search_btn:hover {
  transform: translate(5px, -5px);
}

.space {
  width: 100%;
  height: 50px;
}
</style>
