<template>
  <div class="helper">
    <v-row>
      <v-col md="12">
        <h1>Edit Laporan Realisasi PBB</h1>
      </v-col>
    </v-row>

    <br />
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
                {{ this.$moment(pbb.periode).format("MMMM - YYYY") }}
              </p>
            </div>
            <div class="col-lg-3">
              <p>Kelurahan/Desa</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.pbb.kelurahan }}
              </p>
            </div>
          </b-skeleton-wrapper>
        </div>
      </div>
    </div>
    <v-form style="margin-top: 50px">
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
          <div class="form-group row">
            <div class="form-group row">
              <div class="col-lg-4">
                <p>Target PBB</p>
                <vuetify-money
                  single-line
                  v-model="form.target_pbb"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  :disabled="nihil == 'null'"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:options="options"
                  class="form"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                />
              </div>
              <div class="col-lg-4">
                <p>Realisasi Bulan Lalu</p>
                <v-text-field
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.realisasi_lalu"
                  label="Realisasi Bulan Lalu"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>Realisasi Bulan Ini</p>
                <v-text-field
                  outlined
                  clearable
                  single-line
                  class="form"
                  v-model="form.realisasi_sekarang"
                  label="Realisasi Bulan Ini"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                  :disabled="nihil == 'null'"
                ></v-text-field>
              </div>
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
              :to="{ path: '/pbb' }"
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
              :disabled="overlay == true || pbb.is_verified != 3"
              >Simpan</v-btn
            >
          </b-col>
        </b-row>
      </div>
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
      pbb: [],
      overlay: false,
      loading: false,
      dialogOverlay: false,
      nihil: null,
      form: {
        kelurahan: "",
        target_pbb: null,
        realisasi_lalu: null,
        realisasi_sekarang: null,
        jumlah_realisasi: null,
        sisa_target: null,
        keterangan: null,
      },
      options: {
        locale: "ID",
        prefix: "Rp.",
        suffix: "",
        length: 15,
        precision: 0,
      },
      placeholder: " ",
      readonly: false,
      disabled: false,
      outlined: true,
      clearable: true,
      kelurahan_id: "",
      kelurahan: [
        {
          nama_kelurahan: null,
        },
      ],
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
        .get("/pbb/" + this.$route.params.id)

        .then((response) => {
          this.pbb = response.data.data;
          this.form.realisasi_lalu = response.data.data.realisasi_bln_lalu;
          this.form.realisasi_sekarang = response.data.data.realisasi_bln_ini;
          this.form.jumlah_realisasi = response.data.data.jmlh_realisasi;
          this.form.sisa_target = response.data.data.sisa_target;
          this.form.keterangan = response.data.data.keterangan;
          this.kelurahan_id = response.data.data.kelurahan;

          if (response.data.data.target_pbb == null) {
            this.form.target_pbb = "";
          } else {
            this.form.target_pbb = response.data.data.target_pbb;
          }
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
    },

    save() {
      this.dialogOverlay = true;

      this.$http
        .put("/pbb/" + this.$route.params.id, {
          instansi_id: this.pbb.instansi_id,
          kelurahan: this.pbb.kelurahan,
          target_pbb: this.form.target_pbb,
          realisasi_bln_lalu: this.form.realisasi_lalu,
          realisasi_bln_ini: this.form.realisasi_sekarang,
          periode: this.pbb.periode,
          is_verified: 1,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/pbb");
            self.$toast.success("Data Berhasil Diupdate");
          }, 10 * 10 * 10);
        });
    },
    checkBox(val) {
      if (val == "null") {
        this.kelurahan_id = "";
        this.form.target_pbb = "";
        this.form.realisasi_lalu = null;
        this.form.realisasi_sekarang = null;
        this.form.jumlah_realisasi = null;
        this.form.sisa_target = null;
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
