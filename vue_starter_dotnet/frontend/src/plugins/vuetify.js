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
          info: "#E9C46A",
          secondary: '#264653',
          accent: '#F4A261'
          
        },
        dark: {
          primary: "#2A9D8F",
          error: "#ff8888",
          success: "#45a5ae",
          info: "#E9C46A",
          secondary: '#264653',
          accent: '#F4A261'
          

        },
      },
    },
  });