<template>
  <v-container fluid>
      
    <v-row dense justify="center">
      <v-col sm="12" md="9" lg="9" justify="center">
        <v-form @submit.prevent="filterBreweries">
          <v-text-field
            :v-model="searchBrewery"
            type="text"
            id="searchbrewery"
            name="searchbrewery"
            label="Search For A Brewery"
            color="primary"
          ></v-text-field>
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
      searchBrewery: "",
      breweries: []
    };
  },

  methods: {
    filterBreweries() {
      this.$router.push({
        name: "brewerysearchresults",
        params: { search: document.getElementById("searchbrewery").value }
      });
    }
  }
};
</script>
<style>
</style>