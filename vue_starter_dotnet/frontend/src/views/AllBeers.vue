<template>
  <v-content class="beers secondary">
    <beer-filter v-on:filter="handleFilter" ></beer-filter>
    <v-container fluid>
    <v-row dense justify="center">
    <beer
      class="beer ma-5"
      :key="beer.id"
      v-for="beer in filteredBeers"
      v-bind:beer="beer"
      v-bind:search="search"
      
    ></beer>
    </v-row>
    </v-container>
  </v-content>
</template>

<script>
import Beer from "@/components/Beer.vue";
import BeerFilter from "@/components/BeerFilter.vue";

export default {
  components: {
    Beer,
    BeerFilter
  },
  name: "beers",
  data() {
    return {
      beers: [],
      search: ''

    };
  },


  methods: {
    handleFilter(search){
      this.search = search;
    }
    //return beers where it matches what is in search bar
   
  },

   computed: {
     filteredBeers() {
        const filter = new RegExp(this.search,'i');
        return this.beers.filter(Beer => Beer.name.match(filter));
    }
  },

  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/beers`, {
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
        this.beers = data;
      })
      .catch(err => console.error(err));
  }
};
</script>
