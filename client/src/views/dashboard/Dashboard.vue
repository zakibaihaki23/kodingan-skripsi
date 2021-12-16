<template>
  <div>
    <AdminDashboard v-if="this.user.role == 'Admin'"> </AdminDashboard>
    <UserDashboard v-if="this.user.role == 'User'"> </UserDashboard>
    <CamatDashboard v-if="this.user.role == 'Camat'"></CamatDashboard>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import AdminDashboard from "../dashboard/AdminDashboard.vue";
  import UserDashboard from "../dashboard/UserDashboard.vue";
  import CamatDashboard from "../dashboard/CamatDashboard.vue";
  export default {
    components: { AdminDashboard, UserDashboard, CamatDashboard },
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
