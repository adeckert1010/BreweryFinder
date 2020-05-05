<template>
  <v-app>
    <v-app-bar app color="primary">
      <v-icon @click.stop="drawer=!drawer" color="info">mdi-menu</v-icon>
      <v-toolbar-title>
        <router-link id="nav-bar-title" :to="{name: 'home'}">
          <v-icon class="pa-2 ma-2" color="info">mdi-glass-mug-variant</v-icon>Brewery Friend Finder
        </router-link>
        </v-toolbar-title >

        <v-spacer></v-spacer>

        <v-toolbar-title id="nav-bar-name"
      v-if="getUser()">{{getUser().sub}}
      </v-toolbar-title>
    </v-app-bar>                
      
    <v-navigation-drawer v-model="drawer" temporary app color="primary">
      <v-list>
        <v-list-item
            color="info"
            dark
            v-for="item in items"
            :key="item.title"
            link
            :to="item.route"
            :beerList="favoriteBeersList"
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>
  
            <v-list-item-content>
              <v-list-item-title >{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          
          <!-- Login Button -->
          <v-list-item
            color="info"
            dark
            v-if="!getUser()"
            link
            to="/login"
            :beerList="favoriteBeersList"
          >
            <v-list-item-icon>
              <v-icon>mdi-login</v-icon>
            </v-list-item-icon>
  
            <v-list-item-content>
              <v-list-item-title >Login</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <!-- Register Button -->
          <v-list-item
            color="info"
            dark
            v-if="!getUser()"
            link
            to="/register"
            :beerList="favoriteBeersList"
          >
            <v-list-item-icon>
              <v-icon>mdi-account-plus</v-icon>
            </v-list-item-icon>
  
            <v-list-item-content>
              <v-list-item-title >Register</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <!-- logout button -->
          <v-list-item
            color="info"
            dark
            v-if="getUser()"
            link
            to="/logout"
            :beerList="favoriteBeersList"
          >
            <v-list-item-icon>
              <v-icon>mdi-logout</v-icon>
            </v-list-item-icon>
  
            <v-list-item-content>
              <v-list-item-title >Logout</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
      </v-list>
      </v-navigation-drawer>
      
      
      
    <router-view @toggle-favorite="toggleFavoriteBeer" />
  </v-app>

</template>

<script>
import auth from "./auth";

export default {
  data() {
    return {
      drawer: null,
      items: [
        { title: 'Home', icon: 'mdi-home', route: '/'},
        // { title: 'Login', icon: 'mdi-login', route: '/login'},
        // { title: 'Logout', icon: 'mdi-logout', route: '/logout'},
        // { title: 'Register', icon: 'mdi-account-plus', route: '/register'},
        { title: 'Beers', icon: 'mdi-glass-mug-variant', route: '/beers'},
        { title: 'Breweries', icon: 'mdi-glass-mug', route: '/breweries'}
      ],
      // loggedIn: Boolean,
      user: this.getUser(),
      favoriteBeersList: [],
      userId: 0
    };
  },
  methods: {
    getUser() {
      // let newUser = auth.getUser();
      // //if(newUser != undefined) {this.userId = newUser.id;}
      // this.favoriteBeersList=fetch(`${process.env.VUE_APP_REMOTE_API}/favoritebeers/1`, {
      //     method: "GET",
      //     headers: new Headers({
      //       Authorization: "Bearer " + auth.getToken(),
      //       'Content-Type': 'application/json',
      //     }),
      //     credentials: "same-origin",
      //     body: beerId
      //   })
      //     .then(response => {
      //       if (response.ok) {
      //         this.favoriteBeersList.push(beerId);
      //       } 
      //     })
          
      //     .catch(err => console.error(err));

      return auth.getUser();
    },
    toggleFavoriteBeer(beerId) {
      if (!this.favoriteBeersList.includes(beerId)) {
        this.favoriteBeersList = this.favoriteBeersList.filter(
          id => id != beerId
        );

        fetch(`${process.env.VUE_APP_REMOTE_API}/addfavbeer`, {
          method: "POST",
          headers: new Headers({
            Authorization: "Bearer " + auth.getToken(),
            'Content-Type': 'application/json',
          }),
          credentials: "same-origin",
          body: beerId
        })
          .then(response => {
            if (response.ok) {
              this.favoriteBeersList.push(beerId);
            } 
          })
          
          .catch(err => console.error(err));

      }
      //  else {
        
      // }
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
.removePressed:focus::before {
  opacity: 0 !important;
}

#nav-bar-title {
  text-decoration: none;
  color: #e9c46a;
}

#nav-bar-name {
  text-decoration: none;
  color: #e9c46a;
  text-transform: capitalize;
}

.listitem {
  /* border-radius: 4px; */
  color: "info";
}
</style>