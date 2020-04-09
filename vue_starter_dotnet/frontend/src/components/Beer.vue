<template>
  <div class="beer">
      <h3>{{beer.name}}</h3>
      <p>{{beer.description}}</p>
      <img :src="beer.imageLocation" :alt="beer.beer_name"/>
      <p>ABV: {{beer.abv}}</p>
      <p>IBU: {{beer.ibu}}</p>
      <p>{{beer.type}}</p>
      <router-link :to="{name: 'singleBeer', params: {id: beer.id}}">View beer info</router-link>
  </div>
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

<style>

</style>