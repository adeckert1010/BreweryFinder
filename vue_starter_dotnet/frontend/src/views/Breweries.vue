<template>
  <v-content class="breweries secondary">
    <search-brewery v-on:filter="handleFilter" ></search-brewery>
    <v-container fluid>
    <v-row dense justify="center">
    <brewery
      class="brewery ma-5"
      :key="brewery.id"
      v-for="brewery in filteredBreweries"
      v-bind:brewery="brewery"
      v-bind:search="search"
      
    ></brewery>
    </v-row>
    </v-container>
  </v-content>
</template>

<script>
import Brewery from "@/components/Brewery.vue";
import SearchBrewery from "@/components/SearchBrewery.vue";

export default {
  components: {
    Brewery,
    SearchBrewery
  },
  name: "home",
  data() {
    return {
      breweries: [],
      search: ''

    };
  },


  methods: {
    handleFilter(search){
      this.search = search;
    }
    //return breweries where it matches what is in search bar
   
  },

   computed: {
     filteredBreweries() {
        const filter = new RegExp(this.search,'i');
        return this.breweries.filter(Brewery => Brewery.name.match(filter));
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
      })
      .catch(err => console.error(err));
  }
};
</script>
