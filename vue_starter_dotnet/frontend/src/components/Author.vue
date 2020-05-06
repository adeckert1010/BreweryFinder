<template>
  <v-col cols="12" md="6">
    <v-card class="primary" dark hover>
      <v-row dense align="center">
        <v-col cols="6">
          <v-img :src="author.src" max-width="200px" class="ma-3"></v-img>
        </v-col>
        <v-col cols="6">
          <v-card-text class="headline">{{author.name}}</v-card-text>
          <div>
            <span v-if="!readMoreActivated">{{author.about.slice(0, 150)}}...</span>
            <a v-if="!readMoreActivated" @click="activateReadMore" href="#" style="color:#264653">
                <br>
                Read more...
                </a>
            <span v-if="readMoreActivated" v-html="author.about"></span>
          </div>
        </v-col>
      </v-row>
      <v-row align="center" justify="end">
          <v-btn class="mr-5 mb-2 secondary linkedin" :href=author.link>
            <v-icon>mdi-linkedin</v-icon>
          </v-btn>
      </v-row>
    </v-card>
  </v-col>
</template>

<script>
export default {
  name: "author",
  props: {
    author: {}
  },
  data() {
      return {
          readMoreActivated: false
      }
  },
  methods: {
      activateReadMore() {
          this.readMoreActivated = true;
      }
  }
};
</script>

<style>
.linkedin:hover {
  color: #0077b5;
}
</style>