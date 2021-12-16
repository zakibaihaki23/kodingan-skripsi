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
          <div class="col-lg-2">
            <span>Kelurahan</span>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">{{ kependudukan.kelurahan }}</p>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-lg-2">
            <p>Periode</p>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">
              {{ this.$moment(kependudukan.periode).format("MMMM - YYYY") }}
            </p>
          </div>
        </div>
      </div>
    </div>
    <v-form>
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
            v-model="kependudukan.jmlh_penduduk_bln_lalu_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.jmlh_penduduk_bln_lalu_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.lahir_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.lahir_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.meninggal_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.meninggal_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.datang_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.datang_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.pindah_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.pindah_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.jmlh_penduduk_bln_ini_l"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
            v-model="kependudukan.jmlh_penduduk_bln_ini_p"
            maxlength="15"
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
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
              :disabled="kependudukan.is_verified != 2"
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
        kependudukan: [],
        overlay: false,
        kosong: "",
        placeholder: " ",
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
          .get("/kependudukan/" + this.$route.params.id)

          .then((response) => {
            this.kependudukan = response.data.data;
          });
      }, // CLOSE RENDER DATA

      save() {
        this.overlay = true;
        this.$http
          .put("/kependudukan/" + this.$route.params.id, {
            instansi_id: this.kependudukan.instansi_id,
            kelurahan: this.kependudukan.kelurahan,
            jmlh_penduduk_bln_lalu_l: parseInt(this.kependudukan.jmlh_penduduk_bln_lalu_l),
            jmlh_penduduk_bln_lalu_p: parseInt(this.kependudukan.jmlh_penduduk_bln_lalu_p),
            lahir_l: parseInt(this.kependudukan.lahir_l),
            lahir_p: parseInt(this.kependudukan.lahir_p),
            meninggal_l: parseInt(this.kependudukan.meninggal_l),
            meninggal_p: parseInt(this.kependudukan.meninggal_p),
            datang_l: parseInt(this.kependudukan.datang_l),
            datang_p: parseInt(this.kependudukan.datang_p),
            pindah_l: parseInt(this.kependudukan.pindah_l),
            pindah_p: parseInt(this.kependudukan.pindah_p),
            jmlh_penduduk_bln_ini_l: parseInt(this.kependudukan.jmlh_penduduk_bln_ini_l),
            jmlh_penduduk_bln_ini_p: parseInt(this.kependudukan.jmlh_penduduk_bln_ini_p),
            periode: this.kependudukan.periode,
            is_verified: 0,
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.overlay = false;
              self.$router.push("/kependudukan");
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
