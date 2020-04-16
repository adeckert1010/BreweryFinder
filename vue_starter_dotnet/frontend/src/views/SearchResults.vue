<template>
  <v-content class="secondary">
    <v-container v-if="beers.length == 0">
      <v-row>
        <v-col align="center">
          <v-card dark class="primary">
            <v-card-text>No beers matched your search :(</v-card-text>
            <v-btn to="/beers" color="accent" class="ma-3 pa-1">See All Beers</v-btn>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-row dense>
      <beer v-for="beer in beers" v-bind:beer="beer" v-bind:key="beer.id" />
    </v-row>
  </v-content>
</template>

<script>
import Beer from "@/components/Beer.vue";
export default {
  components: {
    Beer
  },
  created() {
    fetch(
      `${process.env.VUE_APP_REMOTE_API}/beers/searchresults/${this.$route.params.search}`,
      {
        method: "GET",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json"
        }
      }
    ).then(response => {
      response.json().then(data => {
        this.beers = data;
      });
    });
  },
  data() {
    return {
      beers: []
    };
  }
};
</script>

<style>
</style>