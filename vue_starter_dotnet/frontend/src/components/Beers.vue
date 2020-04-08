<template>
  <div class="beers">
      <h3>{{beer.beer_name}}</h3>
      <p>{{beer.beer_description}}</p>
      <img :src="beer.beer_image" :alt="beer.beer_name"/>
      <p>ABV: {{beer.abv}}</p>
      <p>IBU: {{beer.ibu}}</p>
      <p>{{beer.beer_type}}</p>
  </div>
</template>

<script>
export default {
    data() {
    
    },
    props: {
        beer: Object
    }
}
</script>

<style>

</style>