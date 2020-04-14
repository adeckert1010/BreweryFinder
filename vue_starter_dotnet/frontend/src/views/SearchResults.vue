<template>
  <v-container fluid>
    <v-content v-if="beers.length == 0">No beers matched your search :(</v-content>
    <v-row dense>
    <beer v-for="beer in beers" v-bind:beer='beer' v-bind:key='beer.id'/>
    </v-row>
  </v-container>
</template>

<script>
import Beer from '@/components/Beer.vue'
export default {
components: {
    Beer
    },
    created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/beers/searchresults/${this.$route.params.search}`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    }) 
      .then(response => {
        response.json().then(data=>{
          this.beers=data
        });
      })
    },
data() {
   return{  
     beers: []
   }
}

}
</script>

<style>

</style>