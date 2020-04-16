<template>
  <v-col align="center">
    <v-card class="accent" hover dark>
      <v-card-text class="title font-weight-bold">{{beer.name}}</v-card-text>
      <v-container>
      <v-card-text style="overflow: hidden; text-overflow: ellipsis; whitespace: nowrap; height: 100px">{{beer.description}}</v-card-text>
      <!-- <v-icon>mdi-glass-mug-variant</v-icon> -->
      
      <v-img
        :src="beer.imageLocation"
        :alt="beer.beer_name"
        class="beer_image"
        width="250px"
        height="250px"
        contain
      ></v-img>
       <fav-toggle-button :beerList="beerList" :beerId="beer.id" @toggle-favorite="toggleFavorite"></fav-toggle-button>
      <v-card-text class="text"> {{beer.abv}} | IBU: {{beer.ibu}} | {{beer.type}} </v-card-text>
      </v-container>
      <v-btn text v-if="isSingleBeer == false" :to="{name: 'singleBeer', params: {id: beer.id}}">View beer info</v-btn>
    </v-card>
  </v-col>
</template>

<script>
import FavToggleButton from "@/components/FavToggleButton.vue";

export default {
  components: {
    FavToggleButton
  },
  name: "beer",
  props: {
    beer: Object,
    isSingleBeer: Boolean,
    beerList: []
  },
  data() {
    return {
      singleBeer: {}
    };
  },
  methods: {
    toggleFavorite(favoriteBeerId) {
      this.$emit("toggle-favorite", favoriteBeerId);
    }
  }
};
</script>

<style scoped>
.text {
  overflow: ellipse;
}

</style>