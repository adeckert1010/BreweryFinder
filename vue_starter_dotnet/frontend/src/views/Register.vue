<template>
<v-content>
    <v-container class="fill-height secondary" fluid>
      <v-card-text id="register">
        <v-row align="center" justify="center">
          <v-col cols="12" sm="8" md="4">
            <v-card class="elevation-12 accent">
              <v-toolbar color="primary" dark flat>
                <v-toolbar-title>Create Account</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form @submit.prevent="register">
                  
    
     
                <div class="alert alert-danger" role="alert" v-if="registrationErrors">
                  There were problems registering this user.
                </div>
      <!-- <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      /> -->
      <v-text-field
                    id="username"
                    label="Username"
                    name="username"
                    prepend-icon="mdi-glass-mug-variant"
                    type="text"
                    v-model="user.username"
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

      <!-- <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      /> -->
      <v-text-field
                    id="confirm-password"
                    label="Confirm Password"
                    name="Confirm Password"
                    class="form-control"
                    prepend-icon="mdi-textbox-password"
                    type="password"
                    v-model="user.confirmPassword"
                    required
                  />
<v-card-actions>
      <router-link :to="{ name: 'login' }">
        Have an account?
      </router-link>
      <!-- <v-btn class="primary" to="/login">Back to Login</v-btn> -->

      <!-- <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button> -->
      <v-spacer />
                    <v-btn class="primary" type="submit">Create Account</v-btn>
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
export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
    };
  },
  methods: {
    register() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/Account/register`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            this.$router.push({ path: '/login', query: { registration: 'success' } });
          } else {
            this.registrationErrors = true;
          }
        })

        .then((err) => console.error(err));
    },
  },
};
</script>

<style>
</style>
