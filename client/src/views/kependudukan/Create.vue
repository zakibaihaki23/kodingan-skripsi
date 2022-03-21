<template>
  <div class="regist">
    <h1 class="mb-10">Input Data Kependudukan</h1>
    <v-row></v-row>
    <v-form v-model="isFormValid">
      <v-row>
        <div class="row">
          <div class="col mx-auto">
            <div class="form-group row">
              <div class="col-md">
                <p>Periode <span style="color: red">*</span></p>
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
                      readonly
                      class="form"
                      v-bind="attrs"
                      label="Periode"
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
                    form.jmlh_penduduk_bln_lalu_l != null ||
                    form.jmlh_penduduk_bln_lalu_p != null ||
                    form.lahir_l != null ||
                    form.lahir_p != null ||
                    form.meninggal_l != null ||
                    form.meninggal_p != null ||
                    form.datang_l != null ||
                    form.datang_p != null ||
                    form.pindah_l != null ||
                    form.pindah_p != null ||
                    form.jmlh_penduduk_bln_ini_l != null ||
                    form.jmlh_penduduk_bln_ini_p != null
                  "
                >
                </v-checkbox>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Jumlah Penduduk Awal Bulan Lalu</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Jumlah Penduduk Awal Bulan Lalu Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.jmlh_penduduk_bln_lalu_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Jumlah Penduduk Awal Bulan Lalu Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.jmlh_penduduk_bln_lalu_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Lahir</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Lahir Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.lahir_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Lahir Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.lahir_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Meninggal</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Meninggal Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.meninggal_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Meninggal Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.meninggal_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Datang</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Datang Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.datang_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Datang Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.datang_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Pindah</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Pindah Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.pindah_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Pindah Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.pindah_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
            </div>
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Jumlah Penduduk Bulan Ini</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Laki-Laki</p>
                <v-text-field
                  label="Jumlah Penduduk Bulan Ini Laki-Laki"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.jmlh_penduduk_bln_ini_l"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Perempuan</p>
                <v-text-field
                  label="Jumlah Penduduk Bulan Ini Perempuan"
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.jmlh_penduduk_bln_ini_p"
                  maxlength="15"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                  :rules="[rules.required]"
                ></v-text-field>
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
              :to="{ path: '/kependudukan' }"
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
      date: "",
      menu: false,
      search: null,
      nihil: null,
      saveDisabled: true,
      isFormValid: false,
      loading: false,
      rules: {
        required: (value) => !!value || "Required",
        counter: (value) => value.length <= 12 || "Max 30 Characters",
      },
      form: {
        kelurahan: null,
        jmlh_penduduk_bln_lalu_l: null,
        jmlh_penduduk_bln_lalu_p: null,
        lahir_l: null,
        lahir_p: null,
        meninggal_l: null,
        meninggal_p: null,
        datang_l: null,
        datang_p: null,
        pindah_l: null,
        pindah_p: null,
        jmlh_penduduk_bln_ini_l: null,
        jmlh_penduduk_bln_ini_p: null,
      },
      kelurahan_id: "",
      kelurahan: [],
      kecamatan: [],
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
        .post("/kependudukan", {
          instansi_id: this.user.instansi_id,
          kelurahan: this.user.kelurahan.nama_kelurahan,
          jmlh_penduduk_bln_lalu_l: parseInt(this.form.jmlh_penduduk_bln_lalu_l),
          jmlh_penduduk_bln_lalu_p: parseInt(this.form.jmlh_penduduk_bln_lalu_p),
          lahir_l: parseInt(this.form.lahir_l),
          lahir_p: parseInt(this.form.lahir_p),
          meninggal_l: parseInt(this.form.meninggal_l),
          meninggal_p: parseInt(this.form.meninggal_p),
          datang_l: parseInt(this.form.datang_l),
          datang_p: parseInt(this.form.datang_p),
          pindah_l: parseInt(this.form.pindah_l),
          pindah_p: parseInt(this.form.pindah_p),
          jmlh_penduduk_bln_ini_l: parseInt(this.form.jmlh_penduduk_bln_ini_l),
          jmlh_penduduk_bln_ini_p: parseInt(this.form.jmlh_penduduk_bln_ini_p),
          periode: this.date + "-01",
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Disimpan");
            self.$router.push("/kependudukan");
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
