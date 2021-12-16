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
          <div class="col-lg-2">
            <span>Kelurahan</span>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">{{ paten.kelurahan }}</p>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-lg-2">
            <p>Periode</p>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">
              {{ this.$moment(paten.periode).format("MMMM - YYYY") }}
            </p>
          </div>
        </div>
      </div>
    </div>
    <v-form>
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
                v-model="paten.perekaman_ktp"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.pengantar_kk"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.ket_pindah"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.ket_domisili"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.pengantar_akta_lahir"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.pengantar_akta_mati"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.pencatatan_perkawinan"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.pencatatan_perceraian"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.skck"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.sktm"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.rekomendasi"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.legalisasi"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.ket_lain"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.imb"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.situ_siup"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.izin_merobohkan_bangunan"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.izin_keramaian"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.izin_partai"
                maxlength="15"
                onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
                v-model="paten.keterangan"
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
              >Simpan</v-btn
            >
          </b-col>
        </b-row>
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
  export default {
    data() {
      return {
        paten: [],
        overlay: false,
        form: {
          kelurahan: "",
          perekaman_ktp: 0,
          pengantar_kk: 0,
          ket_pindah: 0,
          ket_domisili: 0,
          pengantar_akta_lahir: 0,
          pengantar_akta_mati: 0,
          pencatatan_perkawinan: 0,
          pencatatan_perceraian: 0,
          skck: 0,
          sktm: 0,
          rekomendasi: 0,
          legalisasi: 0,
          ket_lain: 0,
          imb: 0,
          situ_siup: 0,
          izin_merobohkan_bangunan: 0,
          izin_keramaian: 0,
          izin_partai: 0,
          keterangan: "",
        },

        kosong: "",
        placeholder: " ",
        readonly: false,
        disabled: false,
        outlined: true,
        clearable: true,
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

    created() {
      this.renderData();
    },

    methods: {
      renderData() {
        this.$http
          .get("/paten/" + this.$route.params.id)

          .then((response) => {
            this.paten = response.data.data;
          });
      }, // CLOSE RENDER DATA

      save() {
        this.overlay = true;
        this.$http
          .put("/paten/" + this.$route.params.id, {
            instansi_id: this.paten.instansi_id,
            kelurahan: this.paten.kelurahan,
            perekaman_ktp: parseInt(this.paten.perekaman_ktp),
            pengantar_kk: parseInt(this.paten.pengantar_kk),
            ket_pindah: parseInt(this.paten.ket_pindah),
            ket_domisili: parseInt(this.paten.ket_domisili),
            pengantar_akta_lahir: parseInt(this.paten.pengantar_akta_lahir),
            pengantar_akta_mati: parseInt(this.paten.pengantar_akta_mati),
            pencatatan_perkawinan: parseInt(this.paten.pencatatan_perkawinan),
            pencatatan_perceraian: parseInt(this.paten.pencatatan_perceraian),
            skck: parseInt(this.paten.skck),
            sktm: parseInt(this.paten.sktm),
            rekomendasi: parseInt(this.paten.rekomendasi),
            legalisasi: parseInt(this.paten.legalisasi),
            ket_lain: parseInt(this.paten.ket_lain),
            imb: parseInt(this.paten.imb),
            situ_siup: parseInt(this.paten.situ_siup),
            izin_merobohkan_bangunan: parseInt(this.paten.izin_merobohkan_bangunan),
            izin_keramaian: parseInt(this.paten.izin_keramaian),
            izin_partai: parseInt(this.paten.izin_partai),
            keterangan: this.paten.keterangan,
            periode: this.paten.periode,
            is_verified: 0,
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.overlay = false;
              self.$router.push("/paten");
              self.$toast.success("Data Berhasil Diupdate");
            }, 10 * 10 * 10);
          });
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
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
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
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    font-weight: bold;
    vertical-align: middle;
    align-content: center;
    text-align: center;
  }
</style>
