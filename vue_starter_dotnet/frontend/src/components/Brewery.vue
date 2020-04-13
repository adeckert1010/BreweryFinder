<template>

  <v-col md="4" lg="3" sm="9" xs="12">
    <v-card dark class="mx-auto primary" hover>
      <v-img
        height="500px"
        width="750px"
        :lazy-src="brewery.imageLocation"
        :src="brewery.imageLocation"
        :alt="brewery.name"
        @click="isHidden = !isHidden"
        class="align-end"
      ></v-img>
      <v-card-title class="headline" @click="isHidden = !isHidden">
        {{brewery.name}}
        <v-spacer></v-spacer>
        <v-card-actions>
          <v-btn icon>
            <v-icon>{{isHidden ? 'mdi-chevron-up' : 'mdi-chevron-down'}}</v-icon>
          </v-btn>
        </v-card-actions>
      </v-card-title>
      <v-expand-transition>
        <v-card-text v-show="isHidden">
          <v-divider></v-divider>
          <br/>
          {{brewery.type}} <strong>|</strong> {{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}
          <br/>
          <p v-if="brewery.established">Established: {{brewery.established}}</p>
          <br/>
          {{brewery.backgroundInfo}}
          <v-card-actions class="justify-center">
            <v-btn text @click="isHiddenBeer = !isHiddenBeer">View Beers</v-btn>
          </v-card-actions>
          <v-expand-transition>
            <div>
              <v-card
                class="accent mx-auto ma-5"
                v-for="beer in beers"
                v-bind:key="beer.id"
                hover
                v-show="isHiddenBeer"
              >
                <beer v-bind:beer="beer"></beer>
              </v-card>
            </div>
          </v-expand-transition>
        </v-card-text>
      </v-expand-transition>
      <!-- <router-link>See Beers available</router-link> -->
    </v-card>
  </v-col>
</template>

<script>
import Beer from "@/components/Beer.vue";
export default {
  name: "brewery",
  data() {
    return {
      isHidden: false,
      beers: [],
      isHiddenBeer: false
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
  },

 
};
</script>

<style scoped>
.rounded {
  border-radius: 8px;
}
</style>