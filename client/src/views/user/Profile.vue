<template>
  <div class="profile">
    <h1>Ubah Profile</h1>
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
                :to="{ path: '/dashboard' }"
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
          <v-overlay :value="overlay">
            <v-progress-circular indeterminate color="blue"></v-progress-circular>
          </v-overlay>
        </div>
      </div>
      <!-- <v-text-field v-model="data_user.name" label="Nama" required></v-text-field>

      <v-text-field v-model="data_user.email" label="E-mail" required></v-text-field>

      <v-text-field v-model="data_user.username" label="Username" required></v-text-field>

      <v-text-field v-model="password_baru" label="Password Baru" required></v-text-field>

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
              :to="{ path: '/dashboard' }"
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
      </div> -->
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
        this.$http.get(`/user/${this.user.id}`).then((response) => {
          this.data_user = response.data.data;
        });
      },
      save() {
        this.overlay = true;
        this.$http
          .put(`/user/update/${this.user.id}`, {
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
              self.overlay = false;
              self.$toast.success("Profil Berhasil Diubah");
              window.localStorage.clear();
              window.location.reload();
            }, 10 * 10 * 10);
          })
          .catch((error) => {
            if (!error.response.data.errors.password && error.response.data.errors.username) {
              this.$toast.error("Username telah digunakan");
            } else if (
              error.response.data.errors.password &&
              !error.response.data.errors.username
            ) {
              this.$toast.error("Konfirmasi password tidak sesuai");
            } else if (error.response.data.errors.password && error.response.data.errors.username) {
              this.$toast.error("Username sudah digunakan dan konfirmasi password tidak sesuai");
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
