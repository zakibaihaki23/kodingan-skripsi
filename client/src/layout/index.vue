<template>
  <v-app id="inspire">
    <h-navigation />

    <v-main>
      <v-container>
        <router-view :key="key" />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "h-layout",
  components: {
    "h-navigation": () => import("../components/Nav.vue"),
  },
  computed: {
    key() {
      return this.$route.path;
    },
  },
};
</script>
