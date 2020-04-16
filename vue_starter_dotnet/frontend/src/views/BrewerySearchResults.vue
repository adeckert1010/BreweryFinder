<template>
  <v-container fluid>
    <v-content v-if="breweries.length == 0">No breweries matched your search :(</v-content>
    <v-row dense>
    <brewery v-for="brewery in breweries" v-bind:brewery='brewery' v-bind:key='brewery.id'/>
    </v-row>
  </v-container>
</template>

<script>
import Brewery from '@/components/Brewery.vue'
export default {
components: {
    Brewery
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
data() {
   return{  
     breweries: []
   }
}

}
</script>

<style>

</style>