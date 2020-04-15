<template>
<v-content class="secondary" light flat>
  <v-container class="fill-height secondary" fluid>
    <brewery :brewery="brewery"></brewery>
  </v-container>
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
      brewery: {}
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