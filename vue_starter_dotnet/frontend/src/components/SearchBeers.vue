<template>
<v-container fluid>
  <v-row dense justify="center">
    <v-col sm="12" md="9" lg="9" justify="center">
<v-form @submit.prevent="filterBeers">
    <v-text-field :v-model="searchBeer" type="text" id="searchbeer" name="searchbeer"  placeholder="Search For A Beer"></v-text-field>
    <v-btn class="primary" type="submit">Search</v-btn>
</v-form>
</v-col>
  </v-row>
</v-container>
</template>

<script>
export default {
  data() {
    return {
      apiURL: "",
      searchBeer: "",
      beers: []
      
    };
  },


  methods: {
filterBeers() {
       this.$router.push({
         name: 'searchresults', 
         params:{search: document.getElementById("searchbeer").value}
        })
    }
  }
};
</script>
<style>

</style>