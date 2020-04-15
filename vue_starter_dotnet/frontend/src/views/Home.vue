<template>
  <v-content class="home secondary">
    <v-container>
    <v-carousel continuous cycle dark interval="4000" show-arrows show-arrows-on-hover touch>
      <v-carousel-item v-for="(image, i) in images" :key="i">
        <v-img 
        :src="image"
        height="500px"
        position="center"
        ></v-img>
      </v-carousel-item>
    </v-carousel>
    </v-container>
    <search-beers></search-beers>
  </v-content>
</template>

<script>
import SearchBeers from "@/components/SearchBeers.vue";
export default {
  name: "home",
  data() {
    return {
      breweries: [],
      images: []
    }
  },
  components: {
    SearchBeers
  },
  methods: {
    setImages(){
      this.breweries.forEach(brewery => {
        this.images.push(brewery.imageLocation)
      });
    }
  },
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/breweries`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.breweries = data;
        this.setImages();
      })
      .catch(err => console.error(err));
  }
};
</script>

<style>
</style>