<template>
  <div class="beers">
      <table>
      </table>
  </div>
</template>

<script>
export default {
    data() {
        
    },
    props: {
        breweryId: Number,
        beer: {}
    },
    created() {
        fetch(`${process.env.VUE_APP_REMOTE_API}/beers/breweryId/:breweryId`)
    
    }
    
}
</script>

<style>

</style>