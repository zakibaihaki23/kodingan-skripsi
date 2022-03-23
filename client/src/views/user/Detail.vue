<template>
  <div class="profile">
    <h1>Edit User</h1>
    <v-form>
      <div class="row">
        <div class="col-md-10 mx-auto">
          <form>
            <div class="form-group row">
              <div class="col-sm-6">
                <p>
                  Nama
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="data_user.name"
                  single-line
                  label="Nama"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
              <div class="col-sm-6">
                <p>
                  Email
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="data_user.email"
                  single-line
                  label="Email"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-4">
                <p>
                  Username
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="data_user.username"
                  single-line
                  label="Username"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
              <div class="col-md-4">
                <p>
                  Password Baru
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="password_baru"
                  single-line
                  label="Password Baru"
                  :type="val_pwd ? 'password' : 'text'"
                  :append-icon="val_pwd ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="() => (val_pwd = !val_pwd)"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
              <div class="col-md-4">
                <p>
                  Konfirmasi Password
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="password_confirmation"
                  single-line
                  label="Konfirmasi Password"
                  :type="val_cpwd ? 'password' : 'text'"
                  :append-icon="val_cpwd ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="() => (val_cpwd = !val_cpwd)"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
            </div>
          </form>
          <v-divider></v-divider>
          <b-row no-gutters>
            <b-col class="text-right">
              <v-btn
                :to="{ path: '/user' }"
                color="#4FC3F7"
                class="button"
                outlined
                style="
                  box-sizing: content-box;
                  border-radius: 25px;
                  width: 100px;
                  height: 45px;
                  padding: 4px;
                "
                >Batalkan</v-btn
              >&nbsp;
              <v-btn
                style="
                  background: #007bff;
                  color: white;
                  box-sizing: content-box;
                  border-radius: 25px;
                  width: 100px;
                  height: 45px;
                  padding: 4px;
                "
                class="save"
                @click="save()"
                >Simpan</v-btn
              >
            </b-col>
          </b-row>
          <v-dialog v-model="dialogOverlay" persistent max-width="300">
            <div>
              <v-card color="primary" dark class="text-center">
                <v-card-text>
                  Mohon tunggu sebentar......
                  <v-progress-linear
                    indeterminate
                    color="white"
                    class="mb-0"
                  ></v-progress-linear>
                </v-card-text>
              </v-card>
            </div>
          </v-dialog>
        </div>
      </div>
    </v-form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      overlay: false,
      password_baru: null,
      password_confirmation: null,
      dialogOverlay: false,
      data_user: {},
      val_pwd: String,
      val_cpwd: String,
    };
  },
  created() {
    this.renderData();
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
  methods: {
    renderData() {
      this.$http.get(`/user/${this.$route.params.id}`).then((response) => {
        this.data_user = response.data.data;
      });
    },
    save() {
      this.dialogOverlay = true;
      this.$http
        .put(`/user/update/${this.$route.params.id}`, {
          instansi_id: this.user.instansi_id,
          name: this.data_user.name,
          email: this.data_user.email,
          username: this.data_user.username,
          password: this.password_baru,
          password_confirmation: this.password_confirmation,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/user");
            self.$toast.success("Data Berhasil Diubah");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          this.dialogOverlay = false;
          if (
            !error.response.data.errors.password &&
            error.response.data.errors.username
          ) {
            this.$toast.error("Username telah digunakan");
          } else if (
            error.response.data.errors.password &&
            !error.response.data.errors.username
          ) {
            this.$toast.error("Konfirmasi password tidak sesuai");
          } else if (
            error.response.data.errors.password &&
            error.response.data.errors.username
          ) {
            this.$toast.error(
              "Username sudah digunakan dan konfirmasi password tidak sesuai"
            );
          }
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
