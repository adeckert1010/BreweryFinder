<template>
  <div class="brewery">
    Text
    <h2>{{brewery.name}}</h2>
    <img :src="brewery.imageLocation" :alt="brewery.name" @click="changeHidden"/>
    <div v-if="isHidden">
      <p></p>
      <!-- <router-link>See Beers available</router-link> -->
    </div>
  </div>
</template>

<script>
export default {
    
    name: "brewery",
    data() {
      return {isHidden: true}
    },
    
    props: {
      brewery: {}
      
    },
    methods: {
      changeHidden() {
        this.isHidden = !this.isHidden;
      }
    }
    
}
</script>

<style>

</style>