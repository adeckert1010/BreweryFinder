<template>
  <input type="text" id="search" name="search" v-on:keyup="filter" placeholder="Search Breweries" />
</template>

<script>
export default {
  data() {
    return {
      apiURL: ""
      
    };
  },
  methods: {
    filter() {
      const query = document.getElementById("search").value;
      this.$emit("filter", query);
    }
  }
};
</script>

<style>
</style>