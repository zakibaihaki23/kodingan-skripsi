<template>
  <div class="profile">
    <h1>Ubah Profile</h1>
    <v-form ref="form">
      <v-text-field
        v-model="user.name"
        disabled
        label="Nama"
        required
      ></v-text-field>

      <v-text-field
        v-model="user.email"
        disabled
        label="E-mail"
        required
      ></v-text-field>

      <v-text-field
        v-model="user.username"
        disabled
        label="Username"
        required
      ></v-text-field>

      <v-text-field
        v-model="password_lama"
        label="Password Lama"
        required
      ></v-text-field>

      <v-text-field
        v-model="password_baru"
        label="Password Baru"
        required
      ></v-text-field>

      <v-text-field
        v-model="password_confirmation"
        label="Konfirmasi Password Baru"
        required
      ></v-text-field>

      <v-divider></v-divider>
      <div class="btn">
        <v-row>
          <v-col md="10" sm="9" cols="5" lg="10" class="text-right">
            <v-btn
              :to="{ path: '/pbb' }"
              color="#E6E9ED"
              style="
                margin: 10px;
                color: #768f9c;
                margin-top: 50px;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              class="cancel"
              >Batalkan</v-btn
            >
          </v-col>
          <v-col md="1" sm="2" cols="5" lg="1" class="text-right">
            <v-btn
              style="
                margin: 10px;
                margin-top: 50px;
                background: #4662d4;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              class="save"
              @click="save"
            >
              Simpan
            </v-btn>
          </v-col>
        </v-row>
      </div>
    </v-form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      password_lama: "",
      password_baru: "",
      password_confirmation: "",
    };
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
  methods: {
    save() {
      this.$http
        .post(`/user/update-password/${this.user.id}`, {
          current_password: this.password_lama,
          password: this.password_baru,
          password_confirmation: this.password_confirmation,
        })
        .then((response) => {
          this.$toast.success("Password Berhasil Diubah");
          this.password_lama = "";
          (this.password_baru = ""), (this.password_confirmation = "");
        })
        .catch((error) => {
          this.$toast.error("Perika Kembali Form Inputan");
        });
    },
  },
};
</script>

<style scoped>
.profile {
  padding-left: 20px;
  padding-right: 20px;
}
</style>