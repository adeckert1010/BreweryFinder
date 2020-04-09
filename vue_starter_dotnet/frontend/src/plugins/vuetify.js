import Vue from 'vue';
import Vuetify from 'vuetify/lib';



 Vue.use(Vuetify);

export default new Vuetify({
    icons: {
      iconfont: 'mdi',
    },
    theme: {
      themes: {
        light: {
          primary: "#2A9D8F",
          error: "#ff8888",
          success: "#45a5ae",

          secondary: '#264653',
          accent: '#8c9eff',
        },
        dark: {
          primary: "#ffcc50",
          error: "#ff8888",
          success: "#45a5ae",

          secondary: '#b0bec5',
          accent: '#F4A261',

        },
      },
    },

  });