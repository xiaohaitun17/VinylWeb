<template>
  <div id="register">
    <div class="box">
      <h2>stacksofwax</h2>
      <h2>Sign up!</h2>
      <el-form ref="form" :model="form" label-width="20%" :rules="rule">
        <el-form-item label="Username:" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="Password:" prop="password">
          <el-input v-model="form.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="Email:">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="Birthday:">
          <el-date-picker
            type="date"
            v-model="form.birthday"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
      </el-form>
      <el-button type="primary" round @click="sign" class="btn"
        >Sign up</el-button
      >
    </div>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    return {
      form: {
        username: "",
        password: "",
        email: "",
        birthday: "",
      },
    };
  },

  components: {},

  methods: {
    sign() {  //log in
      this.$refs.form.validate((valid) => {
        if (valid) {   //check that the username and password are not empty
          this.axios
            .post("/register", this.form)
            .then((res) => {
              // console.log(res.data.message);
              if (res.data.status == 200) {
                this.$alert("Go to log in", "Registration successful", {
                  confirmButtonText: "Confirm",
                  callback: (action) => {
                    this.$router.push("/login");
                  },
                });
              } else if (res.data.status == 202) {
                this.$alert("Username already exists", "Registration failed", {
                  confirmButtonText: "Confirm",
                  callback: (action) => {
                    (this.form.username = ""), (this.form.password = "");
                  },
                });
              } else {
                console.log(res);
              }
            })
            .catch((err) => {
              console.log("Operation failed" + err);
            });
        }
      });
    },
  },
  computed: {
    rule() {   //Registration form RULE, username and password are not empty
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
#register {
  background: #2e3132;
  color: yellow;
  width: 100%;
  height: 100vh;
}
h2 {
  font-size: 28px;
}
.box {
  height: 450px;
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
</style>