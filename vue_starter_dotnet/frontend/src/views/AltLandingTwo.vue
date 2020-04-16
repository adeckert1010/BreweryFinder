<template>
  <!-- <v-content  class="altlanding secondary"> -->
    <v-row  class="secondary" align="center" justify="space-around">
      <!-- <v-col  md="1"  sm="1"></v-col> -->
      <v-col  md="4" xs="10">
        <v-card dark class="accent">
          <brewery-search-card></brewery-search-card>
        </v-card>
      </v-col>

      <!-- <v-col   md="1" sm="1">
        <v-card dark class="accent"></v-card>
      </v-col>
      <v-col   md="1" sm="1">
        <v-card dark class="accent"></v-card>
      </v-col> -->

      <v-col   md="4" xs="10">
        <v-card dark class="accent">
          <search-beers></search-beers>
        </v-card>
        
      </v-col>
      <!-- <v-col   md="1" sm="1"></v-col> -->
    </v-row>
  <!-- </v-content> -->
</template>

<script>
import SearchBeers from "@/components/SearchBeers.vue";
import BrewerySearchCard from "@/components/BrewerySearchCard.vue";

export default {
  name: "altlandingtwo",
  data() {
    return {
      breweries: [],
      images: []
    };
  },
  components: {
    SearchBeers,
    BrewerySearchCard
  },
  methods: {
    setImages() {
      this.breweries.forEach(brewery => {
        this.images.push(brewery.imageLocation);
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