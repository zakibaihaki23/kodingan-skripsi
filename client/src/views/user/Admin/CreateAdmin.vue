<template>
  <div class="regist">
    <h1>Input Data User</h1>
    <v-form v-model="isFormValid">
      <div class="row">
        <div class="col-md-10 mx-auto">
          <form>
            <div class="form-group row">
              <div class="col-sm-6">
                <p>
                  Kecamatan
                  <span style="color: red">*</span>
                </p>
                <v-autocomplete
                  single-line
                  outlined
                  return-object
                  label="Kecamatan"
                  item-text="nama_instansi"
                  item-value="id"
                  v-model="form.kecamatan"
                  :items="kecamatan"
                  clearable
                  :rules="[rules.required]"
                ></v-autocomplete>
              </div>
              <div class="col-sm-6">
                <p>
                  Nama
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="form.name"
                  single-line
                  label="Nama"
                  outlined
                  class="form"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>
                  Username
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="form.username"
                  single-line
                  label="Username"
                  outlined
                  class="form"
                  :rules="[rules.required, rules.username]"
                  @keydown.space.prevent
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>
                  Password
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="form.password"
                  :rules="[rules.required, rules.password]"
                  single-line
                  label="Password"
                  :type="value ? 'password' : 'text'"
                  :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="() => (value = !value)"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>
                  Konfirmasi Password
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="form.konfirmasi_password"
                  single-line
                  label="Konfirmasi Password"
                  :type="val_confirm ? 'password' : 'text'"
                  :append-icon="val_confirm ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="() => (val_confirm = !val_confirm)"
                  outlined
                  class="form"
                  :rules="[
                    rules.required,
                    rules.password,
                    form.password === form.konfirmasi_password ||
                      'Konfirmasi Password tidak sesuai',
                  ]"
                ></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-6">
                <p>
                  Email
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  v-model="form.email"
                  single-line
                  label="Email"
                  outlined
                  class="form"
                  :rules="[rules.required, rules.email]"
                ></v-text-field>
              </div>
              <div class="col-sm-6">
                <p>
                  Role
                  <span style="color: red">*</span>
                </p>
                <v-autocomplete
                  single-line
                  outlined
                  return-object
                  label="Role"
                  item-text="name"
                  item-value="name"
                  :items="role"
                  v-model="form.role"
                  :rules="[rules.required]"
                ></v-autocomplete>
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
                :disabled="!isFormValid || overlay == true"
                >Simpan</v-btn
              >
            </b-col>
          </b-row>
          <v-dialog v-model="dialogOverlay" persistent max-width="300">
            <div>
              <v-card color="primary" dark class="text-center">
                <v-card-text>
                  Mohon tunggu sebentar......
                  <v-progress-linear indeterminate color="white" class="mb-0"></v-progress-linear>
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
        kosong: "",
        dialog: false,
        date: "",
        menu: false,
        search: null,
        saveDisabled: true,
        dialogOverlay: false,
        isFormValid: false,
        loading: false,
        check: "",
        rules: {
          required: (value) => !!value || "Required.",
          password: (v) => (v && v.length >= 8) || "Minimal 8 karakter",
          username: (v) => (v && v.length >= 5) || "Minimal 5 karakter",
          email: (v) =>
            !v ||
            /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
            "E-Mail tidak valid" ||
            true,
        },
        form: {
          kecamatan: "",
          nama: "",
          username: "",
          password: "",
          konfirmasi_password: "",
          email: "",
          role: "",
        },
        role: [
          {
            name: "Admin Kecamatan",
            value: "User",
          },
          {
            name: "Camat",
            value: "Camat",
          },
        ],
        kecamatan: [],
        value: String,
        val_confirm: String,
        error: {},
        placeholder: " ",
        readonly: false,
        disabled: false,
        outlined: true,
        clearable: true,
        options: {
          locale: "ID",
          prefix: "Rp.",
          suffix: "",
          length: 11,
          precision: 0,
        },
      };
    },

    created() {
      this.renderData("");
    },
    watch: {
      clear: {
        handler: function (val) {
          this.renderData("");
          if (val == true) {
            this.kecamatan = "";
          }
        },
        deep: true,
      },
      search: {
        handler: function (val) {
          this.renderData(val);
        },
        deep: true,
      },
      overlay(val) {
        val &&
          setTimeout(() => {
            this.overlay = false;
          }, 3000);
      },
    },
    computed: {
      ...mapGetters({
        user: "auth/user",
      }),
    },
    methods: {
      checkPassword(invalid) {
        // correct: false
        if (true == invalid) {
          this.validPassword = false;
        } else {
          this.validPassword = true;
        }
      },
      openDialog() {
        this.dialog = true;
      },
      renderData() {
        this.$http.get(`/kecamatan`).then((response) => {
          this.kecamatan = response.data.data;

          // console.log(this.kecamatan);
        });
      },
      //untuk menyimpan data registrasi ke dalam API
      save() {
        this.dialogOverlay = true;
        this.$http
          .post("/register", {
            instansi_id: this.form.kecamatan.id,
            name: this.form.name,
            username: this.form.username,
            email: this.form.email,
            password: this.form.password,
            password_confirmation: this.form.konfirmasi_password,
            role: this.form.role.value,
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.dialogOverlay = false;
              self.$router.push("/user");
              self.$toast.success("Data Berhasil Disimpan");
            }, 10 * 10 * 10);
          })
          .catch((error) => {
            this.dialogOverlay = false;
            if (error.response.status == 422) {
              this.$toast.error("Periksa Form Kembali");
            } else {
              this.$toast.error("Role Sudah Tersedia di Kecamatan Tersebut");
            }
          });
        // console.log(Number(this.form.username) + Number(this.form.password));
      },
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
