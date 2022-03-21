<template>
  <div class="helper">
    <v-row>
      <v-col md="12">
        <h1>Edit Laporan kependudukan</h1>
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
                {{ this.$moment(kependudukan.periode).format("MMMM - YYYY") }}
              </p>
            </div>
            <div class="col-lg-3">
              <p>Desa/Kelurahan</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.kependudukan.kelurahan }}
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
          ></v-text-field>
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
              :to="{ path: '/kependudukan' }"
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
              :disabled="kependudukan.is_verified != 3"
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
      kependudukan: [],
      overlay: false,
      kosong: "",
      loading: false,
      nihil: null,
      placeholder: " ",
      kelurahan_id: "",
      kelurahan: [],
      dialogOverlay: false,
      readonly: false,
      disabled: false,
      outlined: true,
      clearable: true,
      status: [],
      options: {
        locale: "ID",
        prefix: "Rp.",
        suffix: "",
        length: 11,
        precision: 0,
      },
      form: {
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
        .get("/kependudukan/" + this.$route.params.id)

        .then((response) => {
          this.kependudukan = response.data.data;
          this.kelurahan_id = response.data.data.kelurahan;
          this.form.jmlh_penduduk_bln_lalu_l =
            response.data.data.jmlh_penduduk_bln_lalu_l;
          this.form.jmlh_penduduk_bln_lalu_p =
            response.data.data.jmlh_penduduk_bln_lalu_p;
          this.form.lahir_l = response.data.data.lahir_l;
          this.form.lahir_p = response.data.data.lahir_p;
          this.form.meninggal_l = response.data.data.meninggal_l;
          this.form.meninggal_p = response.data.data.meninggal_p;
          this.form.datang_l = response.data.data.datang_l;
          this.form.datang_p = response.data.data.datang_p;
          this.form.pindah_l = response.data.data.pindah_l;
          this.form.pindah_p = response.data.data.pindah_p;
          this.form.jmlh_penduduk_bln_ini_l = response.data.data.jmlh_penduduk_bln_ini_l;
          this.form.jmlh_penduduk_bln_ini_p = response.data.data.jmlh_penduduk_bln_ini_p;
          this.loading = false;
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
          // console.log(array);
          // for (let i = 0; i < array.length; i++) {
          //   this.kelurahan.push({
          //     name: array[i].nama_kelurahan,
          //   });
          // }
        });
    }, // CLOSE RENDER DATA

    save() {
      this.dialogOverlay = true;
      this.$http
        .put("/kependudukan/" + this.$route.params.id, {
          instansi_id: this.kependudukan.instansi_id,
          kelurahan: this.kependudukan.kelurahan,
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
          periode: this.kependudukan.periode,
          is_verified: 1,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/kependudukan");
            self.$toast.success("Data Berhasil Diupdate");
          }, 10 * 10 * 10);
        });
    },
    checkBox(val) {
      if (val == "null") {
        this.kelurahan_id = "";
        this.form.kependudukan = null;
        this.form.kelurahan_id = null;
        this.form.jmlh_penduduk_bln_lalu_l = null;
        this.form.jmlh_penduduk_bln_lalu_p = null;
        this.form.lahir_l = null;
        this.form.lahir_p = null;
        this.form.meninggal_l = null;
        this.form.meninggal_p = null;
        this.form.datang_l = null;
        this.form.datang_p = null;
        this.form.pindah_l = null;
        this.form.pindah_p = null;
        this.form.jmlh_penduduk_bln_ini_l = null;
        this.form.jmlh_penduduk_bln_ini_p = null;
      }
      if (val == "0") {
        this.renderData();
      }
    },
  },
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
