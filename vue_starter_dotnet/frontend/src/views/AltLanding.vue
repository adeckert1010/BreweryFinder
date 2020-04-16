<template>
  <v-content class="altlanding secondary">
    
    <v-container>
        <v-card>
    <v-carousel continuous cycle dark interval="4000" show-arrows show-arrows-on-hover touch>
      <v-carousel-item v-for="(image, i) in images" :key="i">
        <v-img 
        :src="image"
        height="500px"
        position="center"
        ></v-img>
      </v-carousel-item>
    </v-carousel>
    </v-card>
    </v-container>

    <v-card dark class="primary">
        <search-beers></search-beers>
    </v-card>

    <v-card dark class="primary">
        <brewery-search-card></brewery-search-card>
    </v-card>

  </v-content>
</template>

<script>

import SearchBeers from "@/components/SearchBeers.vue";
import BrewerySearchCard from "@/components/BrewerySearchCard.vue";

export default {
  name: "altlanding",
  data() {
    return {
      breweries: [],
      images: []
    }
  },
  components: {
    SearchBeers,
    BrewerySearchCard
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