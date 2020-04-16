<template>
<v-container fluid>
  <v-row dense justify="center">
    <v-col sm="12" md="9" lg="9" justify="center">
      <v-text-field id="search" name="search" v-on:keyup="filter" label="Filter Beers" color="white"></v-text-field>
    </v-col>
  </v-row>
</v-container>
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