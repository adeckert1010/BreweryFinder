<template>
<div class="singleBeer">
<beer :beer = singleBeer></beer>
</div>
</template>

<script>
import Beer from '@/components/Beer.vue'
export default {
  components: {
    Beer
  },
  name: "singleBeer",
  props: {
      singleBeer: {}
    },
    created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/beer/${this.$route.params.id}`, {
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
        this.singleBeer = data;
      })
      .catch(err => console.error(err));
  }
}

</script>