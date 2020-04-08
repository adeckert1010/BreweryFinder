<template>
  <div class="brewery">
    Text
    <h2>{{brewery.name}}</h2>
    <img :src="brewery.imageLocation" :alt="brewery.name" @click="changeHidden"/>
    <div v-if="isHidden">
      <p>{{brewery.address_1}} {{brewery.address_2}} {{brewery.city}}, {{brewery.district}} {{brewery.zipCode}}</p>
      <p>{{brewery.type}}</p>
      <p v-if="brewery.established">{{brewery.established}}</p>
      <p>{{brewery.backgroundInfo}}</p>
      <beers v-for="beer in beers" v-bind:key="beer.beerId" v-bind:breweryId="brewery.id"></beers>
      <!-- <router-link>See Beers available</router-link> -->
    </div>
  </div>
</template>

<script>
export default {
    
    name: "brewery",
    data() {
      return {
        isHidden: true,
        beers: []
        }
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