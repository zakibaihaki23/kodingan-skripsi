<template>
  <div class="regist">
    <h1 class="mb-10">Input Data Keadaan Bencana Alam</h1>
    <v-row></v-row>
    <v-form v-model="isFormValid">
      <v-row>
        <div class="row">
          <div class="col mx-auto">
            <div class="form-group row">
              <div class="col-md">
                <p>
                  Periode
                  <span style="color: red">*</span>
                </p>
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="date"
                  transition="scale-transition"
                  offset-y
                  max-width="290px"
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      :value="date_picker"
                      prepend-inner-icon="mdi-calendar"
                      single-line
                      clearable
                      outlined
                      label="Periode"
                      class="form"
                      v-bind="attrs"
                      v-on="on"
                      @click:clear="date = ''"
                      :rules="[rules.required]"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    locale="id"
                    v-model="date"
                    type="month"
                    no-title
                    scrollable
                    @input="$refs.menu.save(date)"
                  >
                  </v-date-picker>
                </v-menu>
                <v-checkbox
                  class="mt-0"
                  v-model="nihil"
                  true-value="null"
                  false-value="0"
                  :label="`Tidak ada laporan (NIHIL)`"
                  :disabled="
                    form.jmlh_kk != null ||
                    form.jmlh_jiwa != null ||
                    form.rumah_rusak_berat != null ||
                    form.rumah_rusak_sedang != null ||
                    form.rumah_rusak_ringan != null ||
                    form.kantor_rusak_berat != null ||
                    form.kantor_rusak_sedang != null ||
                    form.kantor_rusak_ringan != null ||
                    form.pendidikan_rusak_berat != null ||
                    form.pendidikan_rusak_sedang != null ||
                    form.pendidikan_rusak_ringan != null ||
                    form.ibadah_rusak_berat != null ||
                    form.ibadah_rusak_sedang != null ||
                    form.ibadah_rusak_ringan != null ||
                    form.jembatan_rusak_berat != null ||
                    form.jembatan_rusak_sedang != null ||
                    form.jembatan_rusak_ringan != null ||
                    form.lainnya_rusak_berat != null ||
                    form.lainnya_rusak_sedang != null ||
                    form.lainnya_rusak_ringan != null ||
                    form.korban_menderita != null ||
                    form.korban_luka != null ||
                    form.korban_meninggal != null ||
                    form.kerugian != null
                  "
                >
                </v-checkbox>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Jumlah Penduduk</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>KK</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.jmlh_kk"
                  label="Jumlah Penduduk (KK)"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Jiwa</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.jmlh_jiwa"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Jumlah Penduduk (Jiwa)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Rumah Tinggal</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  label="Rumah Tinggal (Rusak Berat)"
                  v-model="form.rumah_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.rumah_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Rumah Tinggal (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.rumah_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Rumah Tinggal (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Kantor</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.kantor_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Kantor (Rusak Berat)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.kantor_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Kantor (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.kantor_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Kantor (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Sarana Pendidikan</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.pendidikan_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Sarana Pendidikan (Rusak Berat)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.pendidikan_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Sarana Pendidikan (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.pendidikan_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Sarana Pendidikan (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Tempat Ibadah</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.ibadah_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Tempat Ibadah (Rusak Berat)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.ibadah_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Tempat Ibadah (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.ibadah_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Tempat Ibadah (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Jembatan</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.jembatan_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Jembatan (Rusak Berat)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.jembatan_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Jembatan (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.jembatan_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Jembatan (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Lainnya</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>RB</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.lainnya_rusak_berat"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Lainnya (Rusak Berat)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RS</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.lainnya_rusak_sedang"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Lainnya (Rusak Sedang)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>RR</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.lainnya_rusak_ringan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Lainnya (Rusak Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>

            <div class="mt-5 text-center bg-primary text-light">
              <h5>Korban Manusia</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>Menderita</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.korban_menderita"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Korban Manusia (Menderita)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>Luka Ringan</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.korban_luka"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Korban Manusia (Luka Ringan)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>Meninggal</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.korban_meninggal"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Korban Manusia (Meninggal)"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-lg-12">
                <p>Perkiraan Kerugian</p>
                <vuetify-money
                  v-model="form.kerugian"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :rules="[rules.required]"
                  v-bind:options="options"
                  class="form"
                />
              </div>
            </div>
          </div>
        </div>
      </v-row>

      <br />
      <br />
      <br />

      <v-divider></v-divider>
      <div>
        <b-row>
          <b-col class="text-right">
            <v-btn
              :to="{ path: '/bencana' }"
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
              v-if="nihil == 'null'"
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
              :disabled="date_picker == null"
              >Simpan</v-btn
            >
            <v-btn
              v-else
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
              :disabled="!isFormValid"
              >Simpan</v-btn
            >
          </b-col>
          <v-dialog v-model="dialogOverlay" max-width="300" persistent>
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
          <v-overlay :value="overlay">
            <v-progress-circular indeterminate color="blue"></v-progress-circular>
          </v-overlay>
        </b-row>
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
      confirmDialog: false,
      dialogOverlay: false,
      isFormValid: false,
      date: "",
      menu: false,
      search: null,
      nihil: null,
      saveDisabled: true,
      isFormValid: false,
      loading: false,
      rules: {
        required: (value) => !!value || "Required",
        isi: (value) => !!value || value == "" || "KOSONG",
        counter: (value) => value.length <= 12 || "Max 30 Characters",
      },
      form: {
        kelurahan: "",
        jmlh_kk: null,
        jmlh_jiwa: null,
        rumah_rusak_berat: null,
        rumah_rusak_sedang: null,
        rumah_rusak_ringan: null,
        kantor_rusak_berat: null,
        kantor_rusak_sedang: null,
        kantor_rusak_ringan: null,
        pendidikan_rusak_berat: null,
        pendidikan_rusak_sedang: null,
        pendidikan_rusak_ringan: null,
        ibadah_rusak_berat: null,
        ibadah_rusak_sedang: null,
        ibadah_rusak_ringan: null,
        jembatan_rusak_berat: null,
        jembatan_rusak_sedang: null,
        jembatan_rusak_ringan: null,
        lainnya_rusak_berat: null,
        lainnya_rusak_sedang: null,
        lainnya_rusak_ringan: null,
        korban_menderita: null,
        korban_luka: null,
        korban_meninggal: null,
        kerugian: null,
      },
      value: String,
      val_confirm: String,
      warehouse: "",
      warehouse_id: "",
      kelurahan_id: "",
      kelurahan: [],
      kecamatan: [],
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
    computedDateFormatted() {
      return this.formatDate(this.date);
    },
    date_picker() {
      if (this.date) return this.$moment(this.date).format("MMMM - YYYY");
    },
  },
  methods: {
    formatDate(date) {
      if (!date) return null;

      const [year, month, day] = date.split("-");
      return `${day}/${month}/${year}`;
    },
    renderData() {
      this.$http
        .get(`/kecamatan`, {
          params: {
            id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.kelurahan = [];
          let array = response.data.data[0].kelurahan;
          // console.log(array);
          for (let i = 0; i < array.length; i++) {
            this.kelurahan.push({
              name: array[i].nama_kelurahan,
              id: array[i].id,
            });
            // console.log(this.kelurahan);
            // this.itemSelected(response.data.data)
          }
        });
    },
    //untuk menyimpan data registrasi ke dalam API
    save() {
      this.dialogOverlay = true;
      this.$http
        .post("/bencana", {
          instansi_id: this.user.instansi_id,
          kelurahan: this.user.kelurahan.nama_kelurahan,
          jmlh_kk: parseInt(this.form.jmlh_kk),
          jmlh_jiwa: parseInt(this.form.jmlh_jiwa),
          rumah_rusak_berat: parseInt(this.form.rumah_rusak_berat),
          rumah_rusak_sedang: parseInt(this.form.rumah_rusak_sedang),
          rumah_rusak_ringan: parseInt(this.form.rumah_rusak_ringan),
          kantor_rusak_berat: parseInt(this.form.kantor_rusak_berat),
          kantor_rusak_sedang: parseInt(this.form.kantor_rusak_sedang),
          kantor_rusak_ringan: parseInt(this.form.kantor_rusak_ringan),
          pendidikan_rusak_berat: parseInt(this.form.pendidikan_rusak_berat),
          pendidikan_rusak_sedang: parseInt(this.form.pendidikan_rusak_sedang),
          pendidikan_rusak_ringan: parseInt(this.form.pendidikan_rusak_ringan),
          ibadah_rusak_berat: parseInt(this.form.ibadah_rusak_berat),
          ibadah_rusak_sedang: parseInt(this.form.ibadah_rusak_sedang),
          ibadah_rusak_ringan: parseInt(this.form.ibadah_rusak_ringan),
          jembatan_rusak_berat: parseInt(this.form.jembatan_rusak_berat),
          jembatan_rusak_sedang: parseInt(this.form.jembatan_rusak_sedang),
          jembatan_rusak_ringan: parseInt(this.form.jembatan_rusak_ringan),
          lainnya_rusak_berat: parseInt(this.form.lainnya_rusak_berat),
          lainnya_rusak_sedang: parseInt(this.form.lainnya_rusak_sedang),
          lainnya_rusak_ringan: parseInt(this.form.lainnya_rusak_ringan),
          korban_menderita: parseInt(this.form.korban_menderita),
          korban_luka: parseInt(this.form.korban_luka),
          korban_meninggal: parseInt(this.form.korban_meninggal),
          kerugian: parseInt(this.form.kerugian),
          periode: this.date + "-01",
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Disimpan");
            self.$router.push("/bencana");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          this.dialogOverlay = false;
          if (error.response.status == 422) {
            this.$toast.error("Periksa Form Kembali");
          } else {
            this.$toast.error("Periode sudah diinputkan");
          }
        });
    },
  },
};
</script>

<style scoped>
.regist {
  padding-left: 80px;
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
/* .v-btn:not(.v-btn--round).v-size--default {
  margin-top: 50px;
  background: #4662d4;
  color: white;
  box-sizing: content-box;
  border-radius: 25px;
  width: 111px;
  height: 45px;
  padding: 4px;
} */
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
