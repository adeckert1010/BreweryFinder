<template>
  <div class="home">
    <div class="brewery" :key="brewery.id" v-for="brewery in breweries">
     <brewery v-bind:brewery = brewery></brewery>
    </div>
  </div>
</template>

<script>
import Brewery from '@/components/Brewery.vue'
export default {
  components: {
    Brewery
  },
  name: "home",
  data() {
    return {
      breweries: []
    };
  },
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/breweries`, {
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
        this.breweries = data;
      })
      .catch(err => console.error(err));
  }
};
</script>
