<template>
  <div class="regist">
    <h1 class="mb-10">Input Data PATEN</h1>
    <v-row></v-row>
    <v-form v-model="isFormValid">
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
                    class="form"
                    readonly
                    v-bind="attrs"
                    v-on="on"
                    @click:clear="date = ''"
                    label="Periode"
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
                  form.perekaman_ktp != '' ||
                  form.pengantar_kk != '' ||
                  form.ket_pindah != '' ||
                  form.ket_domisili != '' ||
                  form.pengantar_akta_lahir != '' ||
                  form.pengantar_akta_mati != '' ||
                  form.pencatatan_perkawinan != '' ||
                  form.pencatatan_perceraian != '' ||
                  form.skck != '' ||
                  form.sktm != '' ||
                  form.rekomendasi != '' ||
                  form.legalisasi != '' ||
                  form.ket_lain != '' ||
                  form.imb != '' ||
                  form.situ_siup != '' ||
                  form.izin_merobohkan_bangunan != '' ||
                  form.izin_keramaian != '' ||
                  form.izin_partai != ''
                "
              >
              </v-checkbox>
            </div>
          </div>
          <div class="mt-5 text-center bg-primary text-light">
            <h5>Form Pelayanan Non Perizinan</h5>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Perekaman Data KTP-E</p>
              <v-text-field
                label="Perekaman Data KTP-E"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.perekaman_ktp"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Pengantar Kartu Keluarga (KK)</p>
              <v-text-field
                label="Pengantar Kartu Keluarga (KK)"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.pengantar_kk"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Keterangan Pindah</p>
              <v-text-field
                label="Keterangan Pindah"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.ket_pindah"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Keterangan Domisili</p>
              <v-text-field
                label="Keterangan Domisili"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.ket_domisili"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Pengantar Akte Kelahiran</p>
              <v-text-field
                label="Pengantar Akte Kelahiran"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.pengantar_akta_lahir"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Pencatatan Lahir/Mati</p>
              <v-text-field
                label="Pencatatan Lahir/Mati"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.pengantar_akta_mati"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Pencatatan Perkawinan</p>
              <v-text-field
                label="Pencatatan Perkawinan"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.pencatatan_perkawinan"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Pencatatan Perceraian</p>
              <v-text-field
                label="Pencatatan Perceraian"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.pencatatan_perceraian"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Pengantar Catatan Kepolisian (SKCK)</p>
              <v-text-field
                label="Pengantar Catatan Kepolisian (SKCK)"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.skck"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Keterangan Tidak Mampu (SKTM)</p>
              <v-text-field
                label="Keterangan Tidak Mampu (SKTM)"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.sktm"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Rekomendasi</p>
              <v-text-field
                label="Rekomendasi"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.rekomendasi"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Legalisasi Umum</p>
              <v-text-field
                label="Legalisasi Umum"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.legalisasi"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div>
              <p>Keterangan/Pengantar Lainnya</p>
              <v-text-field
                label="Keterangan/Pengantar Lainnya"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.ket_lain"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="mt-5 text-center bg-primary text-light">
            <h5>Form Pelayanan Perizinan</h5>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Izin Mendirikan Bangunan (IMB)</p>
              <v-text-field
                label="Izin Mendirikan Bangunan (IMB)"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.imb"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Izin Usaha Perdagangan (SITU/SIUP)</p>
              <v-text-field
                label="Izin Usaha Perdagangan (SITU/SIUP)"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.situ_siup"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Izin Merobohkan Bangunan</p>
              <v-text-field
                label="Izin Merobohkan Bangunan"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.izin_merobohkan_bangunan"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-lg-4">
              <p>Izin Keramaian</p>
              <v-text-field
                label="Izin Keramaian"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.izin_keramaian"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
            <div class="col-lg-4">
              <p>Izin Domisili Partai</p>
              <v-text-field
                label="Izin Domisili Partai"
                outlined
                clearable
                single-line
                class="form"
                v-model="form.izin_partai"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-text-field>
            </div>
          </div>
          <div class="mt-5 text-center bg-primary text-light">
            <p>&nbsp;</p>
          </div>
          <div class="form-group row">
            <div class="col-md-12">
              <p>Keterangan</p>
              <v-textarea
                clearable
                label="Keterangan"
                clear-icon="mdi-close-circle"
                single-line
                outlined
                class="form"
                v-model="form.keterangan"
                :disabled="nihil == 'null'"
                :rules="[rules.required]"
              ></v-textarea>
            </div>
          </div>
        </div>
      </div>

      <br />
      <br />
      <br />

      <v-divider></v-divider>
      <div>
        <b-row>
          <b-col class="text-right">
            <v-btn
              :to="{ path: '/paten' }"
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
      nihil: null,
      isFormValid: false,
      search: null,
      saveDisabled: true,
      loading: false,
      rules: {
        required: (value) => !!value || "Required",
        counter: (value) => value.length <= 12 || "Max 30 Characters",
      },
      form: {
        kelurahan: "",
        perekaman_ktp: "",
        pengantar_kk: "",
        ket_pindah: "",
        ket_domisili: "",
        pengantar_akta_lahir: "",
        pengantar_akta_mati: "",
        pencatatan_perkawinan: "",
        pencatatan_perceraian: "",
        skck: "",
        sktm: "",
        rekomendasi: "",
        legalisasi: "",
        ket_lain: "",
        imb: "",
        situ_siup: "",
        izin_merobohkan_bangunan: "",
        izin_keramaian: "",
        izin_partai: "",
        keterangan: "",
      },
      value: String,
      val_confirm: String,
      kelurahan: [],
      kelurahan_id: "",
      kecamatan: [],
      error: {},
      placeholder: " ",
      readonly: false,
      disabled: false,
      outlined: true,
      clearable: true,
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
        .post("/paten", {
          instansi_id: this.user.instansi_id,
          kelurahan: this.user.kelurahan.nama_kelurahan,
          perekaman_ktp: parseInt(this.form.perekaman_ktp),
          pengantar_kk: parseInt(this.form.pengantar_kk),
          ket_pindah: parseInt(this.form.ket_pindah),
          ket_domisili: parseInt(this.form.ket_domisili),
          pengantar_akta_lahir: parseInt(this.form.pengantar_akta_lahir),
          pengantar_akta_mati: parseInt(this.form.pengantar_akta_mati),
          pencatatan_perkawinan: parseInt(this.form.pencatatan_perkawinan),
          pencatatan_perceraian: parseInt(this.form.pencatatan_perceraian),
          skck: parseInt(this.form.skck),
          sktm: parseInt(this.form.sktm),
          rekomendasi: parseInt(this.form.rekomendasi),
          legalisasi: parseInt(this.form.legalisasi),
          ket_lain: parseInt(this.form.ket_lain),
          imb: parseInt(this.form.imb),
          situ_siup: parseInt(this.form.situ_siup),
          izin_merobohkan_bangunan: parseInt(this.form.izin_merobohkan_bangunan),
          izin_keramaian: parseInt(this.form.izin_keramaian),
          izin_partai: parseInt(this.form.izin_partai),
          keterangan: this.form.keterangan,
          periode: this.date + "-01",
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/paten");
            self.$toast.success("Data Berhasil Disimpan");
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
