<template>
  <div v-if="isSuccessful" id="logout" class="text-center">    
  </div>
</template>

<script>
import auth from '../auth';

export default {
  name: 'logout',
  components: {},
  data() {
    return{
    isSuccessful : false
    }
  },
  methods: {
    changeStatus(){
      this.isSuccessful = true;
      alert("You have successfully logged out!");
      this.$router.push({name: 'home'});
      
    }
  },
  created () {
    auth.logout();
    this.changeStatus();
  }
  };
</script>

<style>

</style>
