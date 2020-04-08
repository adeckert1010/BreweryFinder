<template>
  <div class="brewery">
    <h2>{{brewery.name}}</h2>
    <img :src="brewery.imageLocation" :alt="brewery.name" v-on:click="changeHidden"/>
    <div v-show="isHidden">
      <p>{{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}</p>
      <p>{{brewery.type}}</p>
      <p v-if="brewery.established">{{brewery.established}}</p>
      <p>{{brewery.backgroundInfo}}</p>
      <div  v-for="beer in beers" v-bind:key="beer.id">
        <beers v-bind:beer= beer></beers>
      </div>
      <!-- <router-link>See Beers available</router-link> -->
    </div>
  </div>
</template>

<script>
import Beers from '@/components/Beers.vue'
export default {
    
    name: "brewery",
    data() {
      return {
        isHidden: false,
        beers: []
        }
    },
    components: {
      Beers
    },
    props: {
      brewery: {}
      
    },
    methods: {
      changeHidden() {
        this.isHidden = !this.isHidden;
      }
    },
    created(){
      fetch(`${process.env.VUE_APP_REMOTE_API}/beers/${this.brewery.id}`, {
      method: "GET",
      headers: {
        Accept : "application/json",
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
    
}
</script>

<style>

</style>