<template>
<v-container fluid> 
    <v-content>
    <v-col cols="12">
      <v-card-title class="ma-0 pa-0 font-weight-bold" >{{beer.name}}</v-card-title>
      <p class=font-italic>{{beer.description}}</p>
      <v-img :src="beer.imageLocation"  :alt="beer.beer_name" height="200px" width="100px" ></v-img>
      <p>ABV: {{beer.abv}}%</p>
      <p>IBU: {{beer.ibu}}</p>
      <p>Type: {{beer.type}}</p>
    </v-col>
    </v-content>
</v-container>
</template>

<script>
export default {
    name: "beer",
    props: {
        beer: Object
    },
    data() {
        return {
            singleBeer: {}
        }
    },
    
}
</script>

<style scoped>

</style>