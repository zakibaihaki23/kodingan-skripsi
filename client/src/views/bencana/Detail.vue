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
          <div class="col-lg-2">
            <span>Kelurahan</span>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">{{ bencana.kelurahan }}</p>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-lg-2">
            <p>Periode</p>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">
              {{ this.$moment(bencana.periode).format("MMMM - YYYY") }}
            </p>
          </div>
        </div>
      </div>
    </div>
    <v-form>
      <div class="mt-5 text-center bg-primary text-light">
        <h5>Jumlah Penduduk</h5>
      </div>
      <div class="form-group row">
        <div class="col-lg-6">
          <p>KK</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.jmlh_kk"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-6">
          <p>Jiwa</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.jmlh_jiwa"
            clearable
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
            v-model="bencana.rumah_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.rumah_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.rumah_rusak_ringan"
            clearable
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
            v-model="bencana.kantor_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.kantor_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.kantor_rusak_ringan"
            clearable
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
            v-model="bencana.pendidikan_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.pendidikan_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.pendidikan_rusak_ringan"
            clearable
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
            v-model="bencana.ibadah_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.ibadah_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.ibadah_rusak_ringan"
            clearable
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
            v-model="bencana.jembatan_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.jembatan_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.jembatan_rusak_ringan"
            clearable
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
            v-model="bencana.lainnya_rusak_berat"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RS</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.lainnya_rusak_sedang"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>RR</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.lainnya_rusak_ringan"
            clearable
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
            v-model="bencana.korban_menderita"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>Luka Ringan</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.korban_luka"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
        <div class="col-lg-4">
          <p>Meninggal</p>
          <v-text-field
            outlined
            class="form"
            v-model="bencana.korban_meninggal"
            clearable
            onkeypress="return event.charCode >= 48 && event.charCode <= 57"
          ></v-text-field>
        </div>
      </div>
      <div class="form-group row">
        <div class="col-lg-12">
          <p>Perkiraan Kerugian</p>
          <vuetify-money
            v-model="bencana.kerugian"
            v-bind:placeholder="placeholder"
            v-bind:readonly="readonly"
            v-bind:disabled="disabled"
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
              :disabled="bencana.is_verified != 2"
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
        bencana: [],
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
          .get("/bencana/" + this.$route.params.id)

          .then((response) => {
            this.bencana = response.data.data;
          });
      }, // CLOSE RENDER DATA

      save() {
        this.overlay = true;
        this.$http
          .put("/bencana/" + this.$route.params.id, {
            instansi_id: this.bencana.instansi_id,
            kelurahan: this.bencana.kelurahan,
            jmlh_kk: parseInt(this.bencana.jmlh_kk),
            jmlh_jiwa: parseInt(this.bencana.jmlh_jiwa),
            rumah_rusak_berat: parseInt(this.bencana.rumah_rusak_berat),
            rumah_rusak_sedang: parseInt(this.bencana.rumah_rusak_sedang),
            rumah_rusak_ringan: parseInt(this.bencana.rumah_rusak_ringan),
            kantor_rusak_berat: parseInt(this.bencana.kantor_rusak_berat),
            kantor_rusak_sedang: parseInt(this.bencana.kantor_rusak_sedang),
            kantor_rusak_ringan: parseInt(this.bencana.kantor_rusak_ringan),
            pendidikan_rusak_berat: parseInt(this.bencana.pendidikan_rusak_berat),
            pendidikan_rusak_sedang: parseInt(this.bencana.pendidikan_rusak_sedang),
            pendidikan_rusak_ringan: parseInt(this.bencana.pendidikan_rusak_ringan),
            ibadah_rusak_berat: parseInt(this.bencana.ibadah_rusak_berat),
            ibadah_rusak_sedang: parseInt(this.bencana.ibadah_rusak_sedang),
            ibadah_rusak_ringan: parseInt(this.bencana.ibadah_rusak_ringan),
            jembatan_rusak_berat: parseInt(this.bencana.jembatan_rusak_berat),
            jembatan_rusak_sedang: parseInt(this.bencana.jembatan_rusak_sedang),
            jembatan_rusak_ringan: parseInt(this.bencana.jembatan_rusak_ringan),
            lainnya_rusak_berat: parseInt(this.bencana.lainnya_rusak_berat),
            lainnya_rusak_sedang: parseInt(this.bencana.lainnya_rusak_sedang),
            lainnya_rusak_ringan: parseInt(this.bencana.lainnya_rusak_ringan),
            korban_menderita: parseInt(this.bencana.korban_menderita),
            korban_luka: parseInt(this.bencana.korban_luka),
            korban_meninggal: parseInt(this.bencana.korban_meninggal),
            kerugian: parseInt(this.bencana.kerugian),
            periode: this.bencana.periode,
            is_verified: 0,
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.overlay = false;
              self.$router.push("/bencana");
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
