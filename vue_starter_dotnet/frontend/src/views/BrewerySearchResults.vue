<template>
  <v-content class="secondary">
    <v-container v-if="breweries.length == 0">
      <v-row>
        <v-col align="center">
          <v-card dark class="primary">
            <v-card-text>No breweries matched your search :(</v-card-text>
            <v-btn to="/breweries" color="accent" class="ma-3 pa-1">See All Breweries</v-btn>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <search-brewery v-on:filter="handleFilter"></search-brewery>
    <v-content>
      <v-row dense justify="center">
        <brewery v-for="brewery in filteredBreweries" v-bind:brewery="brewery" v-bind:key="brewery.id" />
      </v-row>
    </v-content>
  </v-content>
</template>

<script>
import Brewery from '@/components/Brewery.vue'
import SearchBrewery from '@/components/SearchBrewery.vue'
export default {
components: {
    Brewery,
    SearchBrewery
    },
    created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/breweries/brewerysearchresults/${this.$route.params.search}`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    }) 
      .then(response => {
        response.json().then(data=>{
          this.breweries=data
        });
      })
    },
    computed: {
     filteredBreweries() {
        const filter = new RegExp(this.search,'i');
        return this.breweries.filter(Brewery => Brewery.name.match(filter));
    }
  },
   
    data() {
      return{  
        breweries: [],
        search: ''
      }
    },
    methods: {
    handleFilter(search){
      this.search = search;
    }
    //return breweries where it matches what is in search bar
   
  }

}
</script>

<style>
</style>