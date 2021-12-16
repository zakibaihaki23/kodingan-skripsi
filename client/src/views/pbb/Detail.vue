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
          <div class="col-lg-2">
            <span>Kelurahan</span>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">{{ pbb.kelurahan }}</p>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-lg-2">
            <p>Periode</p>
          </div>
          <div class="col-lg-6">
            <p style="font-weight: bold">{{ this.$moment(pbb.periode).format("MMMM - YYYY") }}</p>
          </div>
        </div>
      </div>
    </div>
    <v-form style="margin-top: 50px">
      <div class="row">
        <div class="col mx-auto">
          <div class="form-group row">
            <div class="form-group row">
              <div class="col-lg-4">
                <p>
                  Target PBB
                  <span style="color: red">*</span>
                </p>
                <vuetify-money
                  v-model="form.target_pbb"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
              <div class="col-lg-4">
                <p>
                  Realisasi Bulan Lalu
                  <span style="color: red">*</span>
                </p>
                <vuetify-money
                  v-model="form.realisasi_lalu"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
              <div class="col-lg-4">
                <p>
                  Realisasi Bulan Ini
                  <span style="color: red">*</span>
                </p>
                <vuetify-money
                  v-model="form.realisasi_sekarang"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>
                  Jumlah Realisasi
                  <span style="color: red">*</span>
                </p>
                <v-text-field outlined class="form" v-model="form.jumlah_realisasi"></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>
                  Sisa Target
                  <span style="color: red">*</span>
                </p>
                <vuetify-money
                  v-model="form.sisa_target"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
            </div>
            <div class="form-group row">
              <div>
                <p>
                  Keterangan
                  <span style="color: red">*</span>
                </p>
                <v-textarea
                  clearable
                  clear-icon="mdi-close-circle"
                  single-line
                  outlined
                  class="form"
                  v-model="form.keterangan"
                ></v-textarea>
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
              :disabled="overlay == true"
              >Simpan</v-btn
            >
          </b-col>
        </b-row>
      </div>
      <v-overlay :value="overlay">
        <v-progress-circular indeterminate color="blue"></v-progress-circular>
      </v-overlay>
    </v-form>
    <br />
    <br />
  </div>
</template>

<script>
  export default {
    data() {
      return {
        pbb: [],
        overlay: false,
        form: {
          kelurahan: "",
          target_pbb: "",
          realisasi_lalu: "",
          realisasi_sekarang: "",
          jumlah_realisasi: "",
          sisa_target: "",
          keterangan: "",
        },
        options: {
          locale: "ID",
          prefix: "Rp.",
          suffix: "",
          length: 11,
          precision: 0,
        },
        kosong: "",
        placeholder: " ",
        readonly: false,
        disabled: false,
        outlined: true,
        clearable: true,
        headers: [
          {
            text: "Item",
            value: "item.item_name",
            sortable: false,
            class: "black--text title",
          },
          {
            text: "Total Order",
            value: "total_order",
            sortable: false,
            class: "black--text title",
          },
          {
            text: "Total Packing (Pack)",
            value: "total_packing",
            sortable: false,
            class: "black--text title",
          },
          {
            text: "Total Packing (KG)",
            value: "weight",
            sortable: false,
            class: "black--text title",
          },
          {
            text: "Packer",
            value: "helper.name",
            sortable: false,
            class: "black--text title",
          },
          {
            value: "actions",
            sortable: false,
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

    created() {
      this.renderData();
    },

    methods: {
      renderData() {
        this.$http
          .get("/pbb/" + this.$route.params.id)

          .then((response) => {
            this.pbb = response.data.data;
            this.form.target_pbb = response.data.data.target_pbb;
            this.form.realisasi_lalu = response.data.data.realisasi_bln_lalu;
            this.form.realisasi_sekarang = response.data.data.realisasi_bln_ini;
            this.form.jumlah_realisasi = response.data.data.jmlh_realisasi;
            this.form.sisa_target = response.data.data.sisa_target;
            this.form.keterangan = response.data.data.keterangan;
          });
      }, // CLOSE RENDER DATA

      save() {
        this.overlay = true;
        this.$http
          .put("/pbb/" + this.$route.params.id, {
            instansi_id: this.pbb.instansi_id,
            kelurahan: this.pbb.kelurahan,
            target_pbb: this.form.target_pbb,
            realisasi_bln_lalu: this.form.realisasi_lalu,
            realisasi_bln_ini: this.form.realisasi_sekarang,
            jmlh_realisasi: this.form.jumlah_realisasi,
            sisa_target: this.form.sisa_target,
            keterangan: this.form.keterangan,
            periode: this.pbb.periode,
            is_verified: 0,
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.overlay = false;
              self.$router.push("/pbb");
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
