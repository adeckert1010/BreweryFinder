<template>
  <v-app>
    <v-app-bar app color="accent">
      <v-toolbar-title>
        <router-link id="nav-bar-title" :to="{name: 'home'}">Brewery Friend Finder</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn v-if="getUser()">{{getUser().sub}}</v-btn>
      <v-btn to="/">
        Home
        <!-- <router-link :to="{name: 'home'}">Home</router-link> -->
      </v-btn>
      <!-- <span v-if="$auth.loading"> -->
      <!-- <v-btn @authenticated="user=getUser"  v-if="user" to="/logout" > -->
      <v-btn v-if="getUser()" to="/logout">
        Logout
        <!-- <router-link :to="{name: 'logout'}">Logout</router-link> -->
      </v-btn>
      <v-btn v-if="!getUser()" to="/login">
        Login
        <!-- <router-link :to="{name: 'login'}">Login</router-link> -->
      </v-btn>
      <v-btn v-if="!getUser()" to="/register">
        Register
        <!-- <router-link :to="{name: 'login'}">Login</router-link> -->
      </v-btn>
      <!-- </span> -->
    </v-app-bar>
    <router-view />
  </v-app>
</template>

<script>
import auth from "./auth";

export default {
  data() {
    return {
      // loggedIn: Boolean,
      //user: this.getUser()
    };
  },
  methods: {
    getUser() {
      let newUser = auth.getUser();
      console.log(newUser);
      return auth.getUser();
    }
  },
  created() {
    this.user = auth.getUser();
    this.loggedIn = this.user;
  }
};
</script>

<style>
html {
  --japanese-indigo: #264653;
  --jungle-green: #2a9d8f;
  --hansa-yellow: #e9c46a;
  --sandy-brown: #f4a261;
  --light-red-ochre: #e76f51;
}
/*
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

body {
  background-color: #264653;
  color: #f4a261;
}
/* img {
  height: 50%;
  width: 50%;
  border-radius: 5px;
} */

.info {
}

.beer-list {
}
#nav-bar-title {
  text-decoration: none;
  color: #e9c46a;
}
</style>