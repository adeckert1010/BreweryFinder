<template>
<v-content class="secondary" light flat>
  <v-row justify="center">
    <brewery :brewery="brewery" :isSingleBrewery="true"></brewery>
  </v-row>
</v-content>
</template>

<script>
import Brewery from '@/components/Brewery.vue'
export default {
  components: {
    Brewery
  },
  name: "singleBrewery",
  data() {
    return {
      brewery: {
        id: this.$route.params.id
      }
    }
  },
    created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/breweries/${this.$route.params.id}`, {
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
        this.brewery = data;
      })
      .catch(err => console.error(err));
  }
}

</script>
<style scoped>

</style>