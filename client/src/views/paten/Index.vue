<template>
  <div id="app">
    <div v-if="this.user.role == 'User'">
      <IndexUser></IndexUser>
    </div>
    <div v-if="this.user.role == 'Admin'">
      <IndexAdmin></IndexAdmin>
    </div>
    <div v-if="this.user.role == 'Camat'">
      <IndexCamat></IndexCamat>
    </div>
    <div v-if="this.user.role == 'Kelurahan'">
      <IndexKelurahan></IndexKelurahan>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import IndexCamat from "./Camat/IndexCamat.vue";
import IndexAdmin from "./Admin/IndexAdmin.vue";
import IndexUser from "./User/IndexUser.vue";
import IndexKelurahan from "./Kelurahan/IndexKelurahan.vue";

export default {
  components: { IndexCamat, IndexAdmin, IndexUser, IndexKelurahan },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
};
</script>

<style scoped></style>
