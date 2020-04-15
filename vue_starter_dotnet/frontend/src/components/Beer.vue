<template>
<v-container>
  <v-content class="beer mx-auto pa-0">
      <v-card-title>{{beer.name}}</v-card-title>
      <p>{{beer.description}}</p>
      <v-img :src="beer.imageLocation" :alt="beer.beer_name" class="beer_image justify-center" max-width="50%"></v-img>
      <p>ABV: {{beer.abv}}</p>
      <p>IBU: {{beer.ibu}}</p>
      <p>{{beer.type}}</p>
      <router-link :to="{name: 'singleBeer', params: {id: beer.id}}">View beer info</router-link>
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