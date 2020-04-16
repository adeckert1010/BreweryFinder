<template>
<v-content class="secondary" light flat>
  <v-container class="secondary fill-height" fluid>
    <beer :beer = singleBeer :beerList="beerList" :isSingleBeer="true" @toggle-favorite="toggleFavorite"></beer>
  </v-container>
</v-content>
</template>

<script>
import Beer from '@/components/Beer.vue'
export default {
  components: {
    Beer
  },
  name: "singleBeer",
  props: {
      singleBeer: {},
      beerList: []
    },
    methods:{
        toggleFavorite(favoriteBeerId){this.$emit('toggle-favorite', favoriteBeerId);}
    },
    created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/beer/${this.$route.params.id}`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.singleBeer = data;
      })
      .catch(err => console.error(err));
  }
}

</script>