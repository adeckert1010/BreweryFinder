<template>
  <div class="brewery">
    Text
    <h2>{{brewery.name}}</h2>
    <img :src="brewery.imageLocation" :alt="brewery.name" @click="changeHidden"/>
    <div v-if="isHidden">
      Hidden div
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