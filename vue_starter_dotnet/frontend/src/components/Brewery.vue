<template>
  <div class="brewery">
    <h2>{{brewery.name}}</h2>
    <img :src="brewery.imageLocation" :alt="brewery.name" @click="changeHidden"/>
    <div v-if="isHidden==false">
    </div>
  </div>
</template>

<script>
export default {
    name: "brewery",
    data() {
     return
      isHidden = true
    },
    props: {
      breweries: Array
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