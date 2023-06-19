<template>
  <div id="login">
    <div class="box">
      <h2>stacksofwax</h2>
      <h2>Log In!</h2>
      <el-form ref="form" :model="form" label-width="20%" :rules="rule">
        <el-form-item label="Name:" prop="username">
          <el-input
            v-model="form.username"
            placeholder="Membername or Emial"
          ></el-input>
        </el-form-item>
        <el-form-item label="Password:" prop="password">
          <el-input
            v-model="form.password"
            type="password"
            placeholder="Password"
          ></el-input>
        </el-form-item>
      </el-form>
      <el-button type="primary" round @click="login" class="btn"
        >Log in</el-button
      >
      <span @click="sign" class="reg">TO SIGN UP</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      form: {
        username: "",
        password: "",
      },
    };
  },

  components: {},

  methods: {
    login() {  //log in
      this.$refs.form.validate((valid) => {
        if(valid) {  //check that neither the username nor the password is empty
          this.axios
          .get("/login", {
            params: this.form
          })
          .then((res) => {
            if (res.data.status == 200) {
              //Login successfully, store user information in session and jump to home page
              this.$session.setSession("loginInfo", res.data.data[0]);
              this.$router.push("/home");
            } else {
              this.$alert("Incorrect username or password", "Login failed", {
                confirmButtonText: "Confirm",
                callback: (action) => {
                  (this.form.username = ""), (this.form.password = "");
                },
              });
            }
          })
          .catch((err) => {
            console.log("Login failed" + err);
          });
        }
      })
    },
    sign() {
      this.$router.push('/register')
    },
  },
  computed: {
    rule() {   //Login form RULE, username and password cannot be empty
      return {
        username: {
          required: true,
          message: "Cannot be null !",
          trigger: "blur",
        },
        password: {
          required: true,
          message: "Cannot be null !",
          trigger: "blur",
        },
      };
    },
  },
};
</script>

<style scoped>
#login {
  background: #2e3132;
  color: yellow;
  width: 100%;
  height: 100vh;
}
h2 {
  font-size: 28px;
}
.box {
  height: 350px;
  width: 450px;
  box-shadow: 0 2px 12px 0 rgba(255, 231, 17, 0.25);
  border-radius: 20px;
  position: absolute;
  top: 15%;
  left: 30%;
  text-align: center;
  display: flex;
  flex-direction: column; /*横向*/
  padding: 30px;
}
h2 {
  padding-bottom: 30px;
}
.btn {
  width: 60%;
  margin: auto;
  font-size: 18px;
  padding: 15px 30px;
  font-size: 18px;
  outline: none;
  border: none;
  border-radius: 10px;
  transition: 0.5s;
  background: #1e1e1e;
  color: yellow;
  box-shadow: 0 0 10px #363636, inset 0 0 10px #363636;
}
.reg {
  color: red;
  position: absolute;
  bottom: 10px;
  right: 20px;
  cursor: pointer;
}
</style>