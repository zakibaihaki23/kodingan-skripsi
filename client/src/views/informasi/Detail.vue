<template>
  <div class="regist" v-if="this.user.role == 'Admin'">
    <h1 class="mb-10">Edit Informasi</h1>
    <v-form v-model="isFormValid">
      <div class="row">
        <div class="col-md-10 mx-auto">
          <form>
            <div class="form-group row">
              <div>
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
                  v-model="kecamatan"
                  :items="data_kecamatan"
                  :disabled="true"
                  clearable
                ></v-autocomplete>
                <v-checkbox
                  class="mt-0"
                  v-model="seluruh_informasi"
                  true-value="1"
                  false-value="0"
                  :label="`Informasikan ke Seluruh Kecamatan`"
                  :disabled="true"
                >
                </v-checkbox>
              </div>
              <div>
                <p>
                  Tanggal
                  <span style="color: red">*</span>
                </p>
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="date"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      label="Tanggal Informasi"
                      prepend-inner-icon="mdi-calendar"
                      single-line
                      outlined
                      return-object
                      v-bind="attrs"
                      clearable
                      v-on="on"
                      @click:clear="tanggal_informasi = ''"
                      :value="format_date"
                      :rules="[rules.required]"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="tanggal_informasi"
                    no-title
                    scrollable
                    :min="format_tanggal"
                  >
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu = false"> Cancel </v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(date)"> OK </v-btn>
                  </v-date-picker>
                </v-menu>
              </div>
            </div>
            <div class="form-group row">
              <div>
                <p>
                  Informasi
                  <span style="color: red">*</span>
                </p>
                <v-textarea
                  clearable
                  clear-icon="mdi-close-circle"
                  single-line
                  label="Masukkan Informasi yang ingin disampaikan"
                  outlined
                  class="form"
                  v-model="informasi"
                  :rules="[rules.required]"
                ></v-textarea>
              </div>
            </div>
          </form>
          <v-divider></v-divider>
          <b-row no-gutters>
            <b-col class="text-right">
              <v-btn
                :to="{ path: '/informasi' }"
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
                :disabled="
                  !isFormValid ||
                  overlay == true ||
                  (!kecamatan && seluruh_informasi == 0) ||
                  (!tanggal_informasi && !informasi)
                "
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
        menu: false,
        tanggal_informasi: null,
        date: "",
        saveDisabled: true,
        dialogOverlay: false,
        loading: false,
        isFormValid: false,
        rules: {
          required: (value) => !!value || "Required",
          counter: (value) => value.length <= 12 || "Max 30 Characters",
        },
        check: "",
        kecamatan: "",
        seluruh_informasi: "",
        informasi: "",
        data_kecamatan: [],
        format_tanggal: new Date(Date.now()).toISOString().substr(0, 10),
      };
    },

    created() {
      this.renderData("");
      if (this.user.role != "Admin") {
        this.$router.push("/dashboard");
      }
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
      format_date() {
        if (this.tanggal_informasi)
          return this.$moment(this.tanggal_informasi).format("DD - MMMM - YYYY");
      },
    },
    methods: {
      renderData() {
        this.$http.get(`/kecamatan`).then((response) => {
          this.data_kecamatan = response.data.data;
          // console.log(this.kecamatan);
          //   console.log(this.$moment(this.format_tanggal).format("dddd/DD-MMMM-YYYY"));
        });
        this.$http.get(`/informasi/${this.$route.params.id}`).then((response) => {
          this.tanggal_informasi = response.data.data.waktu;
          this.informasi = response.data.data.informasi;
          if (response.data.data.instansi_id == 0) {
            this.seluruh_informasi = "1";
          } else {
            this.kecamatan = response.data.data.instansi_id;
          }
        });
      },

      //untuk menyimpan data registrasi ke dalam API
      save() {
        this.dialogOverlay = true;
        if (this.seluruh_informasi == 1) {
          this.$http
            .put(`/informasi/${this.$route.params.id}`, {
              instansi_id: 0,
              waktu: this.tanggal_informasi,
              informasi: this.informasi,
            })
            .then((response) => {
              let self = this;
              setTimeout(function () {
                self.$toast.success("Data Berhasil Disimpan");
                self.dialogOverlay = false;
                self.$router.push("/informasi");
              }, 10 * 10 * 10);
            })
            .catch((error) => {
              this.error = error.response.data;
              if (this.tanggal_informasi == null && this.informasi == "") {
                this.$toast.error("Isi tanggal dan informasi pada form");
              } else if (this.informasi && this.tanggal_informasi == null) {
                this.$toast.error("Mohon pilih tanggal terlebih dahulu");
              } else if (this.tanggal_informasi && this.informasi == "") {
                this.$toast.error("Isi informasi yang ingin disampaikan");
              }
              this.dialogOverlay = false;
            });
        }
        if (this.kecamatan) {
          this.dialogOverlay = true;
          this.$http
            .put(`/informasi/${this.$route.params.id}`, {
              instansi_id: this.kecamatan,
              waktu: this.tanggal_informasi,
              informasi: this.informasi,
            })
            .then((response) => {
              let self = this;
              setTimeout(function () {
                self.$toast.success("Data Berhasil Disimpan");
                self.dialogOverlay = false;
                self.$router.push("/informasi");
              }, 10 * 10 * 10);
            })
            .catch((error) => {
              this.error = error.response.data;
              if (this.tanggal_informasi == null && this.informasi == "") {
                this.$toast.error("Isi tanggal dan informasi pada form");
              } else if (this.informasi && this.tanggal_informasi == null) {
                this.$toast.error("Mohon pilih tanggal terlebih dahulu");
              } else if (this.tanggal_informasi && this.informasi == "") {
                this.$toast.error("Isi informasi yang ingin disampaikan");
              }
              this.dialogOverlay = false;
            });
        }
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
