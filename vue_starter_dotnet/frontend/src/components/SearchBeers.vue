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
    const query = this.searchBeer;
    fetch(`${process.env.VUE_APP_REMOTE_API}/beers/search/${query}`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.beers = data;
      })
      .then(this.$router.push({name: 'searchresults'}))
      .catch(err => console.error(err));
    
    }
  }
};
</script>
<style>

</style>