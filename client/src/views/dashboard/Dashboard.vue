<template>
  <div>
    <AdminDashboard v-if="this.user.role == 'Admin'"> </AdminDashboard>
    <UserDashboard v-else> </UserDashboard>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import AdminDashboard from "../dashboard/AdminDashboard.vue";
import UserDashboard from "../dashboard/UserDashboard.vue";
export default {
  components: { AdminDashboard, UserDashboard },
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