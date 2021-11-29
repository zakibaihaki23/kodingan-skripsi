<template>
  <div class="regist">
    <h1>Input Data User</h1>
    <v-form>
      <div class="row">
        <div class="col-md-10 mx-auto">
          <form>
            <div class="form-group row">
              <div class="col-sm-6">
                <p>
                  Kecamatan
                  <span style="color: red">*</span>
                </p>
                <v-select
                  single-line
                  outlined
                  return-object
                  label="Kecamatan"
                  item-text="nama_instansi"
                  item-value="id"
                  v-model="form.kecamatan"
                  :items="kecamatan"
                  clearable
                ></v-select>
              </div>
              <div class="col-sm-6">
                <p>
                  Nama
                  <span style="color: red">*</span>
                </p>
                <v-text-field single-line label="Nama" outlined class="form"></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-4">
                <p>
                  Username
                  <span style="color: red">*</span>
                </p>
                <v-text-field single-line label="Username" outlined class="form"></v-text-field>
              </div>
              <div class="col-sm-4">
                <p>
                  Password
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  single-line
                  label="Password"
                  type="password"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
              <div class="col-sm-4">
                <p>
                  Konfirmasi Password
                  <span style="color: red">*</span>
                </p>
                <v-text-field
                  single-line
                  label="Konfirmasi Password"
                  type="password"
                  outlined
                  class="form"
                ></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-sm-6">
                <p>
                  Email
                  <span style="color: red">*</span>
                </p>
                <v-text-field single-line label="Email" outlined class="form"></v-text-field>
              </div>
              <div class="col-sm-6">
                <p>
                  Role
                  <span style="color: red">*</span>
                </p>
                <v-select
                  single-line
                  outlined
                  return-object
                  label="Role"
                  item-text="name"
                  item-value="name"
                  :items="role"
                  v-model="form.role"
                ></v-select>
              </div>
            </div>
          </form>
          <v-divider></v-divider>
          <b-row no-gutters>
            <b-col class="text-right">
              <v-btn
                :to="{ path: '/pbb' }"
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

          <!-- <b-modal
            v-model="dialog"
            centered
            no-close-on-backdrop
            @ok="save()"
            title="Konfirmasi Form Data"
          >
            <b-container fluid>
              <b-row class="mb-1">
                <b-col class="text-left" v-if="form.kecamatan == 1">
                  Informasi Ke seluruh Kecamatan
                </b-col>
                <b-col class="text-left" v-else>
                  Kecamatan : &nbsp;
                  <b>{{}}</b>
                </b-col>
              </b-row>
            </b-container>
          </b-modal> -->
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
        loading: false,
        check: "",
        rules: {
          required: (value) => !!value || "Required",
          counter: (value) => value.length <= 12 || "Max 30 Characters",
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
            name: "User",
          },
          {
            name: "Camat",
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
      save() {},
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
