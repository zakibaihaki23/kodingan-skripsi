<template>
  <div class="helper">
    <v-row>
      <v-col md="12">
        <h1>Edit Laporan Rekapitulasi PATEN</h1>
      </v-col>
    </v-row>
    <div class="row">
      <div class="col mx-auto" style="font-size: 17pt">
        <div class="form-group row">
          <b-skeleton-wrapper :loading="loading">
            <template #loading>
              <b-skeleton></b-skeleton>
            </template>
            <div class="col-lg-3">
              <p>Periode</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.$moment(paten.periode).format("MMMM - YYYY") }}
              </p>
            </div>
            <div class="col-lg-3">
              <p>Kelurahan/Desa</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.paten.kelurahan }}
              </p>
            </div>
          </b-skeleton-wrapper>
        </div>
      </div>
    </div>
    <v-form>
      <div class="row">
        <div class="col mx-auto">
          <div class="form-group row">
            <div class="form-group row">
              <v-checkbox
                class="mt-0"
                v-model="nihil"
                true-value="null"
                false-value="0"
                :label="`Tidak ada laporan (NIHIL)`"
                @change="checkBox"
              >
              </v-checkbox>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col mx-auto">
          <div class="mt-5 text-center bg-primary text-light">
            <h5>Form Pelayanan Non Perizinan</h5>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
          </div>
          <div class="mt-5 text-center bg-primary text-light">
            <h5>Form Pelayanan Perizinan</h5>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-4">
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
              ></v-text-field>
            </div>
            <div class="col-md-4">
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
                clear-icon="mdi-close-circle"
                single-line
                outlined
                class="form"
                v-model="form.keterangan"
                :disabled="nihil == 'null'"
              ></v-textarea>
            </div>
          </div>
        </div>
      </div>

      <br />
      <br /><br />

      <v-divider></v-divider>
      <div>
        <b-row>
          <b-col class="text-right">
            <!-- <v-btn
              :to="{ path: '/pbb' }"
              color="#007bff"
              outlined
              style="
                text-decoration: #007bff;
                margin: 10px;
                margin-top: 50px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              >Cancel</v-btn
            > -->
            <v-btn
              :to="{ path: '/paten' }"
              color="#4FC3F7"
              class="button"
              outlined
              style="
                margin-top: 50px;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              >Batalkan</v-btn
            >
            <v-btn
              style="
                margin-top: 50px;
                background: #007bff;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
                margin-left: 10px;
              "
              class="save"
              @click="save"
              :disabled="paten.is_verified != 3"
              >Simpan</v-btn
            >
          </b-col>
        </b-row>
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
      </div>
    </v-form>
    <br />
    <br />
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      loading: false,
      paten: [],
      overlay: false,
      nihil: null,
      dialogOverlay: false,
      form: {
        kelurahan: "",
        perekaman_ktp: null,
        pengantar_kk: null,
        ket_pindah: null,
        ket_domisili: null,
        pengantar_akta_lahir: null,
        pengantar_akta_mati: null,
        pencatatan_perkawinan: null,
        pencatatan_perceraian: null,
        skck: null,
        sktm: null,
        rekomendasi: null,
        legalisasi: null,
        ket_lain: null,
        imb: null,
        situ_siup: null,
        izin_merobohkan_bangunan: null,
        izin_keramaian: null,
        izin_partai: null,
        keterangan: null,
      },
      kelurahan_id: "",
      kelurahan: [],
      status: [],
    };
  },
  watch: {
    search: {
      handler: function (val) {
        this.renderData(val);
      },
      deep: true,
    },
  },

  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },

  created() {
    this.renderData();
  },

  methods: {
    renderData() {
      this.loading = true;
      this.$http
        .get("/paten/" + this.$route.params.id)

        .then((response) => {
          this.paten = response.data.data;
          this.kelurahan_id = response.data.data.kelurahan;
          this.loading = false;
          this.form.perekaman_ktp = response.data.data.perekaman_ktp;
          this.form.pengantar_kk = response.data.data.pengantar_kk;
          this.form.ket_pindah = response.data.data.ket_pindah;
          this.form.ket_domisili = response.data.data.ket_domisili;
          this.form.pengantar_akta_lahir = response.data.data.pengantar_akta_lahir;
          this.form.pengantar_akta_mati = response.data.data.pengantar_akta_mati;
          this.form.pencatatan_perkawinan = response.data.data.pencatatan_perkawinan;
          this.form.pencatatan_perceraian = response.data.data.pencatatan_perceraian;
          this.form.skck = response.data.data.skck;
          this.form.sktm = response.data.data.sktm;
          this.form.rekomendasi = response.data.data.rekomendasi;
          this.form.legalisasi = response.data.data.legalisasi;
          this.form.ket_lain = response.data.data.ket_lain;
          this.form.imb = response.data.data.imb;
          this.form.situ_siup = response.data.data.situ_siup;
          this.form.izin_merobohkan_bangunan =
            response.data.data.izin_merobohkan_bangunan;
          this.form.izin_keramaian = response.data.data.izin_keramaian;
          this.form.izin_partai = response.data.data.izin_partai;
          this.form.keterangan = response.data.data.keterangan;
        });

      this.$http
        .get(`/kecamatan`, {
          params: {
            id: this.user.instansi_id,
          },
        })
        .then((response) => {
          // this.kelurahan = [];
          this.kelurahan = response.data.data[0].kelurahan;
          // for (let i = 0; i < array.length; i++) {
          //   this.kelurahan.push({
          //     name: array[i].nama_kelurahan,
          //     id: array[i].id,
          //   });
          // }
        });
    },

    save() {
      this.dialogOverlay = true;
      this.$http
        .put("/paten/" + this.$route.params.id, {
          instansi_id: this.paten.instansi_id,
          kelurahan: this.paten.kelurahan,
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
          periode: this.paten.periode,
          is_verified: 1,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/paten");
            self.$toast.success("Data Berhasil Diupdate");
          }, 10 * 10 * 10);
        });
    },
    checkBox(val) {
      if (val == "null") {
        this.kelurahan_id = "";
        this.form.perekaman_ktp = null;
        this.form.pengantar_kk = null;
        this.form.ket_pindah = null;
        this.form.ket_domisili = null;
        this.form.pengantar_akta_lahir = null;
        this.form.pengantar_akta_mati = null;
        this.form.pencatatan_perkawinan = null;
        this.form.pencatatan_perceraian = null;
        this.form.skck = null;
        this.form.sktm = null;
        this.form.rekomendasi = null;
        this.form.legalisasi = null;
        this.form.ket_lain = null;
        this.form.imb = null;
        this.form.situ_siup = null;
        this.form.izin_merobohkan_bangunan = null;
        this.form.izin_keramaian = null;
        this.form.izin_partai = null;
        this.form.keterangan = null;
      }
      if (val == "0") {
        this.renderData();
      }
    },
  }, // CLOSE METHODS
};
</script>

<style scoped>
.xlsx-button {
  border-radius: 30%;
  width: 200px;
}
.helper {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  padding-left: 80px;
  padding-right: 50px;
}
.v-data-table > .v-data-table__wrapper > table > tbody > tr > td {
  font-size: 17px;
}

thead {
  border-radius: 60px;
}
.form {
  border-style: none;
  text-decoration: none;
}
.search {
  padding-left: 100px;
  padding-right: 50px;
  margin-top: 50px;
}
.search2 {
  margin-top: 150px;
  margin-right: 150px;
  box-sizing: content-box;
  width: 150px;
}
thead[data-v-8056b2e8] {
  background: #f0f2f7;
  border: 1px solid #dee2e6;
  box-sizing: border-box;
  border-radius: 20px;
}
/* .v-btn:not(.v-btn--round).v-size--default {
  position: absolute;
  width: 200px;
  font-size: 16px;
  height: 50px;
  background: #4662d4;
  font-weight: bold;
  color: white;
  border-radius: 25px;
  margin-top: 50px;
  text-transform: capitalize;
  cursor: pointer;
  padding: 5px;
} */

/* .cancel {
    margin-top: 50px;
    background: #4662d4;
    color: white;
    box-sizing: content-box;
    border-radius: 25px;
    width: 111px;
    height: 45px;
  } */
.button {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  font-weight: bold;
  vertical-align: middle;
  align-content: center;
  text-align: center;
}
</style>
