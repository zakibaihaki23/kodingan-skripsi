<template>
  <div class="helper">
    <v-row>
      <v-col md="12">
        <h1>Edit Laporan Keadaan Bencana Alam</h1>
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
                {{ this.$moment(bencana.periode).format("MMMM - YYYY") }}
              </p>
            </div>
            <div class="col-lg-3">
              <p>Kelurahan/Desa</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.bencana.kelurahan }}
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
            :disabled="nihil == 'null'"
            v-bind:outlined="outlined"
            v-bind:clearable="clearable"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
            v-bind:options="options"
            class="form"
          />
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
              :to="{ path: '/bencana' }"
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
              :disabled="bencana.is_verified != 3"
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
      bencana: [],
      overlay: false,
      nihil: null,
      dialogOverlay: false,
      kelurahan_id: "",
      loading: false,
      kelurahan: [],
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
        .get("/bencana/" + this.$route.params.id)

        .then((response) => {
          this.bencana = response.data.data;
          this.kelurahan_id = response.data.data.kelurahan;
          this.form.jmlh_kk = response.data.data.jmlh_kk;
          this.form.jmlh_jiwa = response.data.data.jmlh_jiwa;
          this.form.rumah_rusak_berat = response.data.data.rumah_rusak_berat;
          this.form.rumah_rusak_sedang = response.data.data.rumah_rusak_sedang;
          this.form.rumah_rusak_ringan = response.data.data.rumah_rusak_ringan;
          this.form.kantor_rusak_berat = response.data.data.kantor_rusak_berat;
          this.form.kantor_rusak_sedang = response.data.data.kantor_rusak_sedang;
          this.form.kantor_rusak_ringan = response.data.data.kantor_rusak_ringan;
          this.form.pendidikan_rusak_berat = response.data.data.pendidikan_rusak_berat;
          this.form.pendidikan_rusak_sedang = response.data.data.pendidikan_rusak_sedang;
          this.form.pendidikan_rusak_ringan = response.data.data.pendidikan_rusak_ringan;
          this.form.ibadah_rusak_berat = response.data.data.ibadah_rusak_berat;
          this.form.ibadah_rusak_sedang = response.data.data.ibadah_rusak_sedang;
          this.form.ibadah_rusak_ringan = response.data.data.ibadah_rusak_ringan;
          this.form.jembatan_rusak_berat = response.data.data.jembatan_rusak_berat;
          this.form.jembatan_rusak_sedang = response.data.data.jembatan_rusak_sedang;
          this.form.jembatan_rusak_ringan = response.data.data.jembatan_rusak_ringan;
          this.form.lainnya_rusak_berat = response.data.data.lainnya_rusak_berat;
          this.form.lainnya_rusak_sedang = response.data.data.lainnya_rusak_sedang;
          this.form.lainnya_rusak_ringan = response.data.data.lainnya_rusak_ringan;
          this.form.korban_menderita = response.data.data.korban_menderita;
          this.form.korban_luka = response.data.data.korban_luka;
          this.form.korban_meninggal = response.data.data.korban_meninggal;
          this.form.kerugian = response.data.data.kerugian;
          this.loading = false;
        });
      this.$http
        .get(`/kecamatan`, {
          params: {
            id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.kelurahan = response.data.data[0].kelurahan;
        });
    }, // CLOSE RENDER DATA

    save() {
      this.dialogOverlay = true;
      this.$http
        .put("/bencana/" + this.$route.params.id, {
          instansi_id: this.bencana.instansi_id,
          kelurahan: this.bencana.kelurahan,
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
          periode: this.bencana.periode,
          is_verified: 1,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/bencana");
            self.$toast.success("Data Berhasil Diupdate");
          }, 10 * 10 * 10);
        });
    },
    checkBox(val) {
      if (val == "null") {
        this.kelurahan_id = "";
        this.form.jmlh_kk = null;
        this.form.jmlh_jiwa = null;
        this.form.rumah_rusak_berat = null;
        this.form.rumah_rusak_sedang = null;
        this.form.rumah_rusak_ringan = null;
        this.form.kantor_rusak_berat = null;
        this.form.kantor_rusak_sedang = null;
        this.form.kantor_rusak_ringan = null;
        this.form.pendidikan_rusak_berat = null;
        this.form.pendidikan_rusak_sedang = null;
        this.form.pendidikan_rusak_ringan = null;
        this.form.ibadah_rusak_berat = null;
        this.form.ibadah_rusak_sedang = null;
        this.form.ibadah_rusak_ringan = null;
        this.form.jembatan_rusak_berat = null;
        this.form.jembatan_rusak_sedang = null;
        this.form.jembatan_rusak_ringan = null;
        this.form.lainnya_rusak_berat = null;
        this.form.lainnya_rusak_sedang = null;
        this.form.lainnya_rusak_ringan = null;
        this.form.korban_menderita = null;
        this.form.korban_luka = null;
        this.form.korban_meninggal = null;
        this.form.kerugian = null;
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
