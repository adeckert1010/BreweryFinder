<template>

  <v-btn icon @click="isFav = !isFav">
      <v-icon v-if="isFav" color="info">mdi-glass-mug-variant</v-icon>
      <v-icon v-if="!isFav">mdi-glass-mug-variant</v-icon>        
</v-btn>
  <!-- <v-btn icon v-if="!isFav"><v-icon>mdi-glass-mug-variant</v-icon></v-btn> -->

</template>

<script>
export default {
name: "FavToggleButton",
data(){
   return{ 
       isFav:false
   }
}
}
</script>

<style>

</style>