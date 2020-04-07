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

body {
  background-color:#264653;
  color: #F4A261;
  display:flex;
  
}

img {
  height: 50%;
  width:50%;
  border-radius: 5px;
  float: left;
width: 50%;
height: 90%;
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
  font-size: ;
  background-color: var(--jungle-green);
}

.info{
  float: right;
}

.beer-list{
  float:none;
}


</style>