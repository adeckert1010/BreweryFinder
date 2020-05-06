<template>
  <v-content class="about secondary">
    <v-container fluid>
      <v-row>
        <author v-for="author in authors" :key="author.id" :author="author" />
      </v-row>
    </v-container>
  </v-content>
</template>

<script>
import Author from "@/components/Author.vue";
export default {
  components: {
    Author
  },
  data() {
    return {
      authors: [
        {
          id: 1,
          name: "Allen Deckert",
          src:
            "https://media-exp1.licdn.com/dms/image/C4E03AQEdgkrK0yz0cw/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=TmDE6OAF1AnRsPaM8MLDQsvoQ25q8udm-el3y2V1UDU",
          link: "https://www.linkedin.com/in/allendeckert/",
          about: "I am someone who constantly is learning new things. I love to find interesting solutions to problems. My experience in a manufacturing setting allowed me to show my analytical and problem solving skills by catching problems and solving them before they began. In my transportation experience I saw a need for software solutions to common problems and decided to pursue education in software development, which led me to Tech Elevator. Having completed Tech Elevator, I am looking for a junior developer role where I can be a part of a team whose results have a positive impact on others."
        },
        {
          id: 2,
          name: "Joe Zugelter",
          src:
            "https://media-exp1.licdn.com/dms/image/C4D03AQE_cPuk0esWSA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=82OTKBoqSFReTPood8-PpTrlqTlN1a50JBLyCbNd0Hw",
          link: "https://www.linkedin.com/in/joe-zugelter/",
          about: "I recently graduated from Tech Elevator, a full stack developer boot camp. I have a Master's degree in Electrical and Computer Engineering from the University of Texas. I started my own pedicab business, and recently I've been doing work in IT. I am currently enrolled in Tech Elevator, a full stack C#/.Net boot camp. I am looking for new opportunities as a software developer or engineer."
        },
        {
          id: 3,
          name: "Kris Lane",
          src:
            "https://media-exp1.licdn.com/dms/image/C4E03AQH-5HfpNE5PeA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=EgwvkLH91gsy_RaVZqgSzogKRewbST7fmQ3ULVxh1aI",
          link: "https://www.linkedin.com/in/kristofer-kris-lane-211548141/",
          about: "Comes from a Print Press Operations background with a voracious appetite for learning new things. Detail-oriented, analytical, great communicator and, of course, always a team player! Recently graduated Tech Elevator .NET C# coding boot camp. Learned to use Test Driven Development, ASP.NET MVC architecture, MySQL Server as well as Vuejs, HTML, CSS and Javascript."
        },
        {
          id: 4,
          name: "Travis Hyde",
          src:
            "https://media-exp1.licdn.com/dms/image/C4E03AQGMPmo4bO_rcA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=L3pCUKMK8p4Dky2x5n6z8Yp6ul3gbObA3P3xdX_kPws",
          link: "https://www.linkedin.com/in/travishyde/",
          about: "Seeking junior software developer, business analyst, or SQL development position upon graduation from Tech Elevator. Open to other opportunities in related fields. Skilled technical writer (two courses at the University of North Texas). Strong communications and team leadership skills"
        }
      ]
    };
  }
};
</script>

<style>
</style>