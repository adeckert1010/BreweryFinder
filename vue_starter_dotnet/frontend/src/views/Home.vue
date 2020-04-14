<template>
  <v-content class="home secondary">
    <v-container style="position: fixed">
      <search-beers></search-beers>
    </v-container>
  </v-content>
</template>

<script>
import SearchBeers from "@/components/SearchBeers.vue";
export default {
  name: 'home',

  components: {
    SearchBeers
  }
}
</script>

<style>

</style>