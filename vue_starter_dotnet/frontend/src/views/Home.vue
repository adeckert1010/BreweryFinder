<template>
  <div class="home">
    <div class="brewery" :key="brewery.id" v-for="brewery in breweries">
      <h2>{{brewery.name}}</h2>
      <img v-bind:src="brewery.image_address" :alt="brewery.name">
      <p>Established: {{brewery.established}}</p>
      <p>Address: {{brewery.address_line1}} {{brewery.city}},{{brewery.state}} {{brewery.zipcode}}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'home',
  data(){
    return {
      breweries: []
    };
  },
  created(){
    fetch(`${process.env.VUE_APP_REMOTE_API}/Breweries`, {
      method: 'GET',
      headers: {
        "Content-Type": "application/json"
      }
    })
    .then((response)=> {
      return response.json();
    })
    .then((data) => {
      this.breweries = data;
    })
    .catch((err) => console.error(err));
  }
}
</script>
