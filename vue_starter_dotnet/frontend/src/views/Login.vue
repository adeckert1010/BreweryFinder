<template>
<v-content>
      <v-container
        class="fill-height"
        fluid
      >
  <v-card-text id="login">
    <v-row
          align="center"
          justify="center"
        >
        <v-col
            cols="12"
            sm="8"
            md="4"
          >
          <v-card class="elevation-12">
            <v-toolbar
                color="primary"
                dark
                flat
              >
          <v-toolbar-title>Please Sign In</v-toolbar-title>
         </v-toolbar>
         <v-card-text>
    <v-form  @submit.prevent="login">
      
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <!-- <label for="username" class="sr-only">Username</label> -->
      <v-text-field
                    id="username"
                    label="Username"
                    name="username"
                    prepend-icon="mdi-glass-mug-variant"
                    type="text"
                    v-model="user.username"
                    required
                  />
      <!-- <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      /> -->

      <v-text-field
                    id="password"
                    label="Password"
                    name="password"
                    class="form-control"
                    prepend-icon="mdi-textbox-password"
                    type="password"
                    v-model="user.password"
        required
                  />

      <!-- <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      /> -->
      <v-card-actions>
      <!-- <router-link :to="{ name: 'register' }">Need an account?</router-link> -->
      <v-btn to="/register">Register</v-btn>
      <!-- <button type="submit">Sign in</button> -->
      <v-spacer />
      <v-btn color="primary" type="submit">Login</v-btn>
      </v-card-actions>
    </v-form>
    </v-card-text>
    </v-card>
    </v-col>
     </v-row>
  </v-card-text>
  </v-container>
  </v-content>
 
</template>

<script>
import auth from '../auth';

export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/Account/login`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            return response.text();
          } else {
            this.invalidCredentials = true;
          }
        })
        .then((token) => {
          if (token != undefined) {
            if (token.includes('"')) {
              token = token.replace(/"/g, '');
            }
            auth.saveToken(token);
            // this.$emit("authenticated", true);
            this.$router.push('/');
          }
        })
        .catch((err) => console.error(err));
    },
  }
};
</script>

<style>

</style>
