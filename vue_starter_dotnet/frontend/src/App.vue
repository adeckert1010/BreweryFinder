<template>
  <v-app>
    <v-app-bar app dark class="indigo">
    
      <router-link to="/">Home</router-link>
   </v-app-bar>
    <router-view/>
    
  </v-app>
</template>

<script>
export default {
  
}
</script>

<style>
/* html {
  --japanese-indigo: #264653;
  --jungle-green: #2A9D8F;
  --hansa-yellow: #E9C46A;
  --sandy-brown: #F4A261;
  --light-red-ochre: #E76F51;
}

body {
  background-color:#264653;
  color: #F4A261;
  display:flex;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}



button{
  background-color:var(--light-red-ochre);
  color: lightslategray;
}

a {
  color: var(--jungle-green);
}

input[type=text],  input[type=password]{
  
  padding: 6px;
  border: none;
  margin-top: 8px;
  margin-right: 16px;
  font-size: 16px;
  background-color: var(--jungle-green);
} */
img {
  height: 25%;
  width:25%;
  border-radius: 5px;
  float: left;

}
.info{
  float: right;
}

.beer-list{
  float:none;
}


</style>