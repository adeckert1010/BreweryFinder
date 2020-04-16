<template>
  <v-content class="secondary">
    <v-container v-if="beers.length == 0">
      <v-row>
        <v-col align="center">
          <v-card dark class="primary">
            <v-card-text>No beers matched your search :(</v-card-text>
            <v-btn to="/beers" color="accent" class="ma-3 pa-1">See All Beers</v-btn>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <beer-filter v-on:filter="handleFilter"></beer-filter>
    <v-content> 
    <v-row justify="center" class="ma-auto"> <beer v-for="beer in filteredBeers" v-bind:beer="beer" :beerList="beerList" v-bind:key="beer.id" @toggle-favorite="toggleFavorite"/>
    </v-row>
    </v-content>
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
  created() {
    fetch(
      `${process.env.VUE_APP_REMOTE_API}/beers/searchresults/${this.$route.params.search}`,
      {
        method: "GET",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json"
        }
      }
    ).then(response => {
      response.json().then(data => {
        this.beers = data;
      });
    });
  },
  data() {
    return {
      beers: [],
      search: ''
    };
  },
  props:{
    beerList: []
  },
  methods: {
    handleFilter(search){
      this.search = search;
    },
    //return beers where it matches what is in search bar
   toggleFavorite(favoriteBeerId){
    this.$emit('toggle-favorite', favoriteBeerId);
            
    }
    
  },
  computed: {
     filteredBeers() {
        const filter = new RegExp(this.search,'i');
        return this.beers.filter(beer => beer.name.match(filter));
    }
  }
};
</script>

<style>
</style>