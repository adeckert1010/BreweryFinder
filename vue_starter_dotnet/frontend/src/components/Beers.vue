<template>
  <div class="beers">
      <h3>{{beer.name}}</h3>
      <p>{{beer.description}}</p>
      <img :src="beer.imageLocation" :alt="beer.beer_name"/>
      <p>ABV: {{beer.abv}}</p>
      <p>IBU: {{beer.ibu}}</p>
      <p>{{beer.type}}</p>
  </div>
</template>

<script>
export default {
    name: "beers",
    props: {
        beer: Object
    }
}
</script>

<style>

</style>