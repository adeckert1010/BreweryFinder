<template>
  <v-col v-if="!isSingleBrewery" xs="12" sm="9" md="4" lg="3">
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
          <br />
          {{brewery.type}}
          <strong>|</strong>
          {{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}
          <br />
          <p v-if="brewery.established">Established: {{brewery.established}}</p>
          <br />
          {{brewery.backgroundInfo}}
          <v-card-actions class="justify-center">
            <v-btn text @click="isHiddenBeer = !isHiddenBeer">View Beers</v-btn>
            <v-btn
              v-if="!isSingleBrewery"
              :to="{name: 'singleBrewery', params: {id: brewery.id}}"
            >View More Details</v-btn>
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
                <router-link :to="{name: 'singleBeer', params: {id: beer.id}}">View beer info</router-link>
              </v-card>
            </div>
          </v-expand-transition>
        </v-card-text>
      </v-expand-transition>
      <!-- <router-link>See Beers available</router-link> -->
    </v-card>
  </v-col>
  <v-container fluid v-else>
    <v-col>
      <v-card dark class="primary" hover>
        <v-img
          width="100%"
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
            <br />
            {{brewery.type}}
            <strong>|</strong>
            {{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}
            <br />
            <p v-if="brewery.established">Established: {{brewery.established}}</p>
            <br />
            {{brewery.backgroundInfo}}
            <v-card-actions class="justify-center">
              <v-btn text @click="isHiddenBeer = !isHiddenBeer">View Beers</v-btn>
              <v-btn
                v-if="!isSingleBrewery"
                :to="{name: 'singleBrewery', params: {id: brewery.id}}"
              >View More Details</v-btn>
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
                  <router-link :to="{name: 'singleBeer', params: {id: beer.id}}">View beer info</router-link>
                </v-card>
              </div>
            </v-expand-transition>
          </v-card-text>
        </v-expand-transition>
        <!-- <router-link>See Beers available</router-link> -->
      </v-card>
    </v-col>
    <v-col>
      <v-card hover>
          <iframe
            width="100%"
            height="100%"
            id="gmap_canvas"
            :src="setMapSource"
            frameborder="0"
            scrolling="no"
            marginheight="0"
            marginwidth="0"
          ></iframe>
      </v-card>
    </v-col>
  </v-container>
</template>

<script>
import Beer from "@/components/Beer.vue";
export default {
  name: "brewery",
  data() {
    return {
      isHidden: false,
      beers: [],
      isHiddenBeer: false,
      colSizes: {},
      mapSource: ""
    };
  },
  components: {
    Beer
  },
  props: {
    brewery: Object,
    isSingleBrewery: Boolean
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

    this.setMapSource();
  },
  computed: {
    setMapSource() {
      return `https://maps.google.com/maps?q=${this.brewery.name}&t=&z=13&ie=UTF8&iwloc=&output=embed`;
    }
  }
};
</script>

<style scoped>
.rounded {
  border-radius: 8px;
}
</style>