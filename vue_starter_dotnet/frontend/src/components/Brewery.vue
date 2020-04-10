<template>
  <v-container>
    <v-card class="mx-auto primary" max-width="80%" hover>
      <v-img
        :lazy-src="brewery.imageLocation"
        :src="brewery.imageLocation"
        :alt="brewery.name"
        @click="isHidden = !isHidden"
        class="white--text"
      ></v-img>
      <v-card-title>{{brewery.name}}</v-card-title>
      <v-card-actions>
        <v-btn icon @click="isHidden = !isHidden">
          <v-icon>{{isHidden ? 'mdi-chevron-up' : 'mdi-chevron-down'}}</v-icon>
        </v-btn>
      </v-card-actions>
      <v-expand-transition>
        <div v-show="isHidden">
          <v-divider></v-divider>
          <p>{{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}</p>
          <p>{{brewery.type}}</p>
          <p v-if="brewery.established">{{brewery.established}}</p>
          <p>{{brewery.backgroundInfo}}</p>
          <v-card class="accent" v-for="beer in beers" v-bind:key="beer.id">
            <beer v-bind:beer="beer"></beer>
          </v-card>
        </div>
      </v-expand-transition>
      <!-- <router-link>See Beers available</router-link> -->
    </v-card>
  </v-container>
</template>

<script>
import Beer from "@/components/Beer.vue";
export default {
  name: "brewery",
  data() {
    return {
      isHidden: false,
      beers: []
    };
  },
  components: {
    Beer
  },
  props: {
    brewery: {}
  },
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/beers/${this.brewery.id}`, {
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
        this.beers = data;
      })
      .catch(err => console.error(err));
  }
};
</script>

<style scoped>
.rounded {
  border-radius: 8px;
}
</style>