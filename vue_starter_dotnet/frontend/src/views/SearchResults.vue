<template>
  <v-container fluid >
      <beer v-for="beer in beers" v-bind:key= beer.id></beer>
  </v-container>
</template>

<script>
import Beer from '@/components/Beer.vue'
export default {
components: {
    Beer
    },
data() {
   return{ beers: []
   }
}

}
</script>

<style>

</style>