<template>
  <div id="app">
    <div v-if="this.user.role == 'User'">
      <CreateUser></CreateUser>
    </div>
    <div v-if="this.user.role == 'Admin'">
      <CreateAdmin></CreateAdmin>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import CreateAdmin from "./Admin/CreateAdmin.vue";
import CreateUser from "./User/CreateUser.vue";

export default {
  components: { CreateAdmin, CreateUser },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
};
</script>

<style scoped>
.regist {
  padding-left: 40px;
  padding-right: 50px;
}
.form-right {
  padding-right: 90px;
  font-size: 20px;
}
.form-right-1 {
  margin-top: 60px;
  padding-right: 90px;
  font-size: 20px;
}
.form-credential {
  margin-top: 20px;
  padding-right: 90px;
}

.name {
  border-radius: 15px;
}
.btn {
  margin-top: 30px;
}
.form {
  border-style: none;
  text-decoration: none;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

input[type="number"] {
  -moz-appearance: textfield;
}
</style>
