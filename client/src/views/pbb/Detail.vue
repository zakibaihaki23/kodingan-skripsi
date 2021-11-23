<template>
  <div class="helper">
    <v-row>
      <v-col md="12">
        <h1>Edit Laporan Realisasi PBB</h1>
      </v-col>
    </v-row>

    <br />
    <div>
      <v-row>
        <v-col md="2" style="margin-top: 1px">
          <h2>Kecamatan</h2>
        </v-col>
        <v-col>
          <h2>: {{ pbb.instansi }}</h2>
        </v-col>
      </v-row>

      <v-row style="margin-top: -20px">
        <v-col md="2">
          <h3>Kelurahan</h3>
        </v-col>
        <v-col>
          <b>: {{ pbb.kelurahan }}</b>
        </v-col>
      </v-row>

      <v-row style="margin-top: -20px">
        <v-col md="2">
          <h3>Periode</h3>
        </v-col>
        <v-col>
          <b> : {{ pbb.waktu | moment("MMMM - YYYY") }}</b>
        </v-col>
      </v-row>
    </div>
    <v-form style="margin-top: 50px">
      <v-row>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Target PBB <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Target PBB"
              outlined
              class="form"
              v-model="form.target_pbb"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Realisasi Bulan Lalu <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Realisasi Bulan Lalu"
              outlined
              class="form"
              v-model="form.realisasi_lalu"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Realisasi Bulan Ini <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Realisasi Bulan Ini"
              outlined
              class="form"
              v-model="form.realisasi_sekarang"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Jumlah Realisasi <span style="color: red">*</span></p>
            <v-text-field outlined class="form" v-model="form.jumlah_realisasi"> </v-text-field>
            <!-- <vuetify-money
              label="Jumlah Realisasi"
              v-model="form.jumlah_realisasi"
              v-bind:placeholder="placeholder"
              v-bind:readonly="readonly"
              v-bind:disabled="disabled"
              v-bind:outlined="outlined"
              v-bind:clearable="clearable"
              v-bind:valueWhenIsEmpty="kosong"
              v-bind:options="options"
              class="form"
            /> -->
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Sisa Target <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Sisa Target"
              outlined
              class="form"
              v-model="form.sisa_target"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Keterangan <span style="color: red">*</span></p>
            <v-textarea
              clearable
              clear-icon="mdi-close-circle"
              single-line
              label="Keterangan"
              outlined
              class="form"
              v-model="form.keterangan"
            >
            </v-textarea>
          </div>
        </v-col>
      </v-row>

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
              >Simpan</v-btn
            >
          </b-col>
        </b-row>
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
        pbb: [],
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
        this.$http
          .put("/pbb/" + this.$route.params.id, {
            id_instansi: this.pbb.id_instansi,
            id_kelurahan: this.pbb.id_kelurahan,
            instansi: this.pbb.instansi,
            kelurahan: this.pbb.kelurahan,
            target_pbb: this.form.target_pbb,
            realisasi_bln_lalu: this.form.realisasi_lalu,
            realisasi_bln_ini: this.form.realisasi_sekarang,
            jmlh_realisasi: this.form.jumlah_realisasi,
            sisa_target: this.form.sisa_target,
            keterangan: this.form.keterangan,
            waktu: this.pbb.waktu,
          })
          .then((response) => {
            this.$router.push("/pbb");
            this.$toast.success("Data Berhasil Diupdate");
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
