<template>
  <div id="part3">
    <div class="pic"></div>
    <div class="message">
      <div>
        <h1 class="title">Explore Your Favorite Genres:</h1>
        <p class="intro">Whether you're into rock, pop, or jazz, we've got you covered. Simply select your preferred genre and start browsing.</p>
      </div>
      <div class="option">
        <button v-for="item in genres" :key="item" class="genre_btn" @click="tosearch(item)">{{item}}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'part3',
  data () {
    return {
      genres: ['R&B', 'Pop Rock', 'Rock', 'Hard Rock', 'Jazz Fusion', 'Blues'],
    };
  },

  components: {},

  methods: {
    tosearch(item) {    //Carry genre information and jump to the search page
      this.$router.push({
        path: "/search",
        query: {
          genre: item
        },
      });
    },
  }
}
</script>

<style scoped>
#part3 {
  width: 90%;
  height: 600px;
  /* background-color:rgba(211, 211, 211, 0.25); */
  /* box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.5); */
  display: flex;
  font-family: fantasy;
  margin: 20px auto;
}
.pic {
  width: 50%;
  background-image: url('../assets/img/genre.JPG');
  background-size: cover;
}
.message {
  width: 50%;
  margin: 0;
}
.title {
  font-size: 38px;
  font-family: fantasy;
  margin: 30px 0;
}
.intro {
  font-size: 30px;
  margin: 50px;
}
.option {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-evenly;
}
.genre_btn {
  width: 180px;
  height: 50px;
  border-radius: 30px;
  font-size: 18px;
  margin: 20px;
  cursor: pointer;
}
.genre_btn:hover {
  background: yellow;
  font-weight: bold;
  box-shadow: 0 2px 12px 0 rgba(255, 255, 255, 0.5);
}
</style>