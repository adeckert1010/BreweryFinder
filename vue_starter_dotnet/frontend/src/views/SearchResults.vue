<template>
  <v-container fluid>
    <beer v-for="beer in beers" v-bind:beer='beer' v-bind:key='beer.id'/>
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