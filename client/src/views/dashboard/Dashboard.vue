<template>
  <div>
    <AdminDashboard v-if="this.user.role == 'Admin'"> </AdminDashboard>
    <UserDashboard v-if="this.user.role == 'User'"> </UserDashboard>
    <CamatDashboard v-if="this.user.role == 'Camat'"></CamatDashboard>
    <KelurahanDashboard v-if="this.user.role == 'Kelurahan'"></KelurahanDashboard>
    <LurahDashboard v-if="this.user.role == 'Lurr'"></LurahDashboard>
    <SekdaDashboard v-if="this.user.role == 'Sekda'"></SekdaDashboard>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import AdminDashboard from "../dashboard/AdminDashboard.vue";
import SekdaDashboard from "../dashboard/SekdaDashboard.vue";
import UserDashboard from "../dashboard/UserDashboard.vue";
import CamatDashboard from "../dashboard/CamatDashboard.vue";
import KelurahanDashboard from "../dashboard/KelurahanDashboard.vue";
import LurahDashboard from "../dashboard/LurahDashboard.vue";

export default {
  components: {
    AdminDashboard,
    SekdaDashboard,
    UserDashboard,
    CamatDashboard,
    KelurahanDashboard,
    LurahDashboard,
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      authenticated: "auth/authenticated",
      user: "auth/user",
    }),
  },
};
</script>
