import Vue from 'vue';
import Vuetify from 'vuetify/lib';

Vue.use(Vuetify, {
    theme: {
        themes: {
            dark: {
        primary: '#264653',
        secondary: '#2A9D8F',
        accent: '#E9C46A',
        error: '#FF5252',//not our choice
        info: '#F4A261',
        success: '#E76F51',
        warning: '#FFC107',//not our choice
    }}}
});



// Vue.use(Vuetify);

export default new Vuetify({
    theme: {
        dark: true
    }
});
