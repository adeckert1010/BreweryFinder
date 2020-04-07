<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  
}
</script>

<style>
html {
  --japanese-indigo: #264653;
  --jungle-green: #2A9D8F;
  --hansa-yellow: #E9C46A;
  --sandy-brown: #F4A261;
  --light-red-ochre: #E76F51;
}

nav a {
  color: var(--jungle-green);
}
</style>