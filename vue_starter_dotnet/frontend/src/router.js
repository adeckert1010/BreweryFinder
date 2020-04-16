import Vue from 'vue'
import Router from 'vue-router'
import auth from './auth'
import Breweries from './views/Breweries.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Logout from './views/Logout.vue'
import SingleBeer from './views/SingleBeer.vue'
import SearchResults from './views/SearchResults.vue'
import Home from './views/Home.vue'
import SingleBrewery from './views/SingleBrewery.vue'
import AltLanding from './views/AltLanding.vue'
import BrewerySearchResults from './views/BrewerySearchResults.vue'
import AltLandingTwo from './views/AltLandingTwo'
import AllBeers from './views/AllBeers'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/breweries',
      name: 'breweries',
      component: Breweries,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/beer/:id",
      name: "singleBeer",
      component: SingleBeer,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewery/:id",
      name: "singleBrewery",
      component: SingleBrewery,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/searchresults/:search",
      name: "searchresults",
      component: SearchResults,
      //props: {beers: []},
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/altlanding",
      name: "altlanding",
      component: AltLanding,
      
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewerysearchresults/:search",
      name: "brewerysearchresults",
      component: BrewerySearchResults,
      
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/altlandingtwo",
      name: "altlandingtwo",
      component: AltLandingTwo,
      
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/beers",
      name: "beers",
      component: AllBeers,
      
      meta: {
        requiresAuth: false
      }
    }
    
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  const user = auth.getUser();

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && !user) {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
