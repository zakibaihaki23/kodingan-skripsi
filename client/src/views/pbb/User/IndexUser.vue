<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Kelola Laporan Realisasi PBB</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mt-3">
        <b-col lg="6">
          <v-btn
            v-show="!firstLoad"
            :to="{ path: '/pbb/add' }"
            style="
              width: 200px;
              height: 50px;
              background: #4662d4;
              color: white;
              border-radius: 30px;
              font-size: 16px;
              font-weight: bold;
              text-transform: capitalize;
              cursor: pointer;
              padding: 5px;
            "
            v-if="user.role == 'User'"
            >Input Data</v-btn
          >
        </b-col>
        <b-col lg="6">
          <v-tooltip bottom>
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-bind="attrs"
                v-on="on"
                v-model="search"
                append-icon="mdi-magnify"
                rounded
                label="Search...."
                solo
                hide-details
              ></v-text-field>
            </template>
            <span>Cari Berdasarkan Kelurahan</span>
          </v-tooltip>
        </b-col>
        <!-- <v-col>
          <div>
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-text-field
                  v-bind="attrs"
                  v-on="on"
                  v-model="search"
                  append-icon="mdi-magnify"
                  rounded
                  label="Search...."
                  solo
                  hide-details
                  class="search d-sm-none d-md-none d-lg-none d-xl-none"
                >
                </v-text-field>
              </template>
              <span>search by helper code, name, or phone number</span>
            </v-tooltip>
          </div>
        </v-col>-->
      </b-row>
    </v-container>
    <p class="mt-5" style="font-size: 25px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>

    <b-row style="margin-top: 1px">
      <b-col cols="12" lg="3">
        <StatusSelected v-show="!firstLoad" v-model="status" @selected="statusSelected">
        </StatusSelected>
      </b-col>
      <b-col cols="12" lg="3">
        <v-menu
          ref="menu"
          v-model="date_filter"
          :close-on-content-click="false"
          transition="scale-transition"
          offset-y
          min-width="290px"
        >
          <template v-slot:activator="{ on }">
            <div v-on="on">
              <v-tooltip top>
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    v-show="!firstLoad"
                    v-bind="attrs"
                    v-on="on"
                    style="border-radius: 10px; font-size: 13px"
                    prepend-inner-icon="mdi-calendar"
                    outlined
                    single-line
                    clearable
                    readonly
                    dense
                    @click:clear="(date = ''), renderData(search)"
                    :value="format_date"
                    @input="dateSelected"
                  >
                    <template v-slot:label>Filter Periode</template>
                  </v-text-field>
                </template>
                <span>Cari Berdasarkan Periode</span>
              </v-tooltip>
            </div>
          </template>
          <v-date-picker
            @change="dateSelected"
            locale="id"
            v-model="date"
            type="month"
            no-title
            scrollable
          >
            <v-spacer></v-spacer>
            <v-btn text color="primary" @click="date_filter = false">Cancel</v-btn>
            <v-btn text color="primary" @click="(date_filter = false), renderData(search)"
              >OK</v-btn
            >
          </v-date-picker>
        </v-menu>
      </b-col>
      <!-- <v-col cols="12" md="3" xl="2" lg="2" sm="10">
          <div>
            <v-dialog v-model="dialogOverlay" persistent max-width="1px">
              <div class="text-center">
                <v-overlay :value="overlay">
                  <v-progress-circular
                    color="primary"
                    indeterminate
                    :size="20"
                  ></v-progress-circular>
                </v-overlay>
              </div>
            </v-dialog>
          </div>
          <v-btn
            style="
              margin-top: 2px;
              bottom: 5px;
              background: #4662d4;
              color: white;
              border-radius: 30px;
              width: 200px;
              font-weight: bold;
              height: 45px;
              padding: 2px;
              font-size: 16px;
              text-transform: capitalize;
            "
            :disabled="downloadDisabled"
            @click="downloadReport"
            >Download</v-btn
          >
        </v-col> -->
    </b-row>
    <br />
    <v-skeleton-loader
      v-if="firstLoad"
      :loading="isLoading"
      type="table-tbody"
      :types="{ 'table-row': 'table-cell@8' }"
    ></v-skeleton-loader>
    <v-overlay :value="overlay">
      <v-progress-circular indeterminate color="blue"></v-progress-circular>
    </v-overlay>
    <div id="app">
      <v-data-table
        loading-text="Memuat Data"
        v-show="!firstLoad"
        :loading="isLoading"
        :headers="table"
        :search="search"
        :items="pbb"
        :hide-header="isMobile"
        :class="{ mobile: isMobile }"
        class="elevation-1"
      >
        <template v-slot:[`item.periode`]="{ item }">
          {{ item.periode | moment("MMMM - YYYY") }}
        </template>
        <template v-slot:[`item.target_pbb`]="{ item }">
          Rp. {{ formatPrice(item.target_pbb) }}
        </template>
        <template v-slot:[`item.realisasi_bln_lalu`]="{ item }">
          <div v-if="item.realisasi_bln_lalu == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.realisasi_bln_lalu }}
          </div>
        </template>
        <template v-slot:[`item.realisasi_bln_ini`]="{ item }">
          <div v-if="item.realisasi_bln_ini == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.realisasi_bln_ini }}
          </div>
        </template>
        <template v-slot:[`item.jmlh_realisasi`]="{ item }">
          <div v-if="item.jmlh_realisasi == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.jmlh_realisasi }}
          </div>
        </template>
        <template v-slot:[`item.sisa_target`]="{ item }">
          <div v-if="item.sisa_target == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.sisa_target }}
          </div>
        </template>
        <template v-slot:[`item.keterangan`]="{ item }">
          <div v-if="item.keterangan == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.keterangan }}
          </div>
        </template>
        <template v-slot:[`item.is_verified`]="{ item }">
          <span v-if="item.is_verified == 0">Menunggu Validasi</span>
          <span v-if="item.is_verified == 1">Sudah Divalidasi</span>
          <span v-if="item.is_verified == 2">Ditolak</span>
        </template>
        <template v-slot:[`item.actions`]="{ item }">
          <v-menu offset-y v-if="item.is_verified == 2">
            <template v-slot:activator="{ on, attrs }">
              <v-btn v-bind="attrs" v-on="on" icon>
                <v-icon dark>mdi-dots-horizontal</v-icon>
              </v-btn>
            </template>
            <v-list>
              <template class="menu">
                <v-list-item
                  :to="{
                    path: `/pbb/update/${item.id}`,
                  }"
                  link
                >
                  Edit
                </v-list-item>
                <v-list-item @click="hapusDialog(item)" link> Hapus </v-list-item>
              </template>
            </v-list>
          </v-menu>
        </template>
      </v-data-table>
      <b-modal v-model="dialog" centered no-close-on-backdrop @ok="hapusData(idData)">
        Apakah anda ingin menghapus data dari
        <b>{{ this.kel }}</b>
        <br />Pada Periode Laporan <b>{{ this.period }}</b
        >?
      </b-modal>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import StatusSelected from "../../../components/StatusSelected.vue";

  export default {
    components: { StatusSelected },
    data() {
      return {
        search: "",
        searchBox: "",
        date_filter: "",
        date: "",
        isMobile: false,
        page: 1,
        dialog: false,
        firstLoad: true,
        loadingBtn: false,
        isLoading: true,
        loading: false,
        dialogOverlay: false,
        overlay: false,
        kelurahans: "",
        kel: "",
        idData: "",
        id: "",
        period: "",
        table: [
          {
            text: "Desa/Kelurahan",
            value: "kelurahan",
          },
          {
            text: "Periode Laporan",
            value: "periode",
          },
          {
            text: "Target PBB (Rp.)",
            value: "target_pbb",
          },
          {
            text: "Realisasi Bulan yang Lalu",
            value: "realisasi_bln_lalu",
          },
          {
            text: "Realisasi Bulan Ini",
            value: "realisasi_bln_ini",
          },

          {
            text: "Jumlah Realisasi S/D Bulan Ini",
            value: "jmlh_realisasi",
          },
          {
            text: "Sisa Target",
            value: "sisa_target",
          },
          {
            text: "Keterangan (%)",
            value: "keterangan",
          },
          {
            text: "Status",
            value: "is_verified",
          },
          {
            value: "actions",
            sortable: false,
          },
        ],

        dataTable: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterActive: null,
        warehouseList: [],
        kecamatan: [],
        pbb: [],
        kelurahan: [],
        kelurahanDisabled: true,
        downloadDisabled: true,
        status: null,
        filterStatus: null,
      };
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
          }, 1000);
      },
    },
    created() {
      this.renderData();
    },
    // mounted() {
    //   this.renderData('', this.status)
    // },
    watch: {
      clearable: {
        handler: function (val) {
          this.renderData("");
        },
        deep: true,
      },
    },
    computed: {
      ...mapGetters({
        user: "auth/user",
      }),
      format_date() {
        if (this.date) return this.$moment(this.date).format("MMMM - YYYY");
      },
    },
    methods: {
      formatPrice(value) {
        let val = (value / 1).toFixed(0).replace(".", ",");
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      },
      downloadReport() {
        this.dialogOverlay = true;

        let periode = "";
        if (this.date) {
          periode = this.date + "-01";
        } else {
          periode = null;
        }
        // axios({
        //   method: "GET",
        //   url: `http://localhost:8000/api/report/pbb?id_instansi=${this.user.id_instansi}&periode=${periode}`,
        //   config: { headers: { "Content-Type": "multipart/form-data" } },
        // })

        //DOWNLOAD USER
        if (this.user.role == "User") {
          this.$http
            .get(`/report/pbb?id_instansi=${this.user.instansi_id}&periode=${periode}`, {
              config: {
                headers: {
                  "Content-Type": "multipart/form-data",
                  "Access-Control-Allow-Origin": "*",
                },
              },
            })
            .then((response) => {
              this.dialogOverlay = false;
              if (response.data == "") {
                this.dialogOverlay = false;
                this.$toast.error("Mohon pilih periode yang memiliki data");
              } else {
                this.dialogOverlay = false;
                // console.log(response.config.baseURL + response.config.url);
                // window.location.href = response.config.baseURL + response.config.url;
              }
              this.dialogOverlay = false;
            })
            .catch((error) => {
              this.dialogOverlay = false;
            });
        }
        //DOWNLOAD ADMIN
        else {
          this.$http
            .get(`/report/pbb?id_instansi=${this.kecamatan.value}&periode=${periode}`, {
              config: {
                headers: {
                  "Content-Type": "multipart/form-data",
                  "Access-Control-Allow-Origin": "*",
                },
              },
            })
            .then((response) => {
              this.dialogOverlay = false;
              if (response.data == "") {
                this.dialogOverlay = false;
                this.$toast.error("Mohon pilih periode yang memiliki data");
              } else {
                this.dialogOverlay = false;
                // console.log(response.config.baseURL + response.config.url);
                // window.location.href = response.config.baseURL + response.config.url;
              }
              this.dialogOverlay = false;
            })
            .catch((error) => {
              this.dialogOverlay = false;
            });
        }
      },
      renderData(search) {
        this.firstLoad = true;

        let is_verified = "";
        if (this.filterStatus || this.filterStatus == 0) {
          is_verified = this.filterStatus;
        } else {
          is_verified = null;
        }

        let periode = "";
        if (this.date) {
          periode = this.date;
        } else {
          periode = null;
        }
        // UNTUK USER
        this.$http
          .get("/pbb", {
            params: {
              instansi_id: `${this.user.instansi_id}`,
              periode,
              is_verified,
            },
          })
          .then((response) => {
            this.pbb = response.data.data;
            this.firstLoad = false;
            this.dialog = false;
            this.dialogOverlay = false;
            this.overlay = false;
            this.isLoading = false;
          })
          .catch((error) => {
            if (error) {
              console.log(error);
            }
          });
      },
      hapusDialog(item) {
        this.dialog = true;
        this.idData = item.id;
        this.kel = item.kelurahan;
        this.period = this.$moment(item.periode).format("MMMM - YYYY");
      },
      hapusData(idData) {
        this.overlay = true;
        this.$http.delete("/pbb/" + idData).then((response) => {
          let self = this;
          setTimeout(function () {
            self.overlay = false;
            self.renderData();
            self.$toast.success("Data Berhasil Dihapus");
          }, 10 * 10 * 10);
        });
      },
      kecamatanSelected(kecamatan) {
        this.downloadDisabled = true;
        this.kelurahanDisabled = false;
        this.kecamatan = "";
        this.filterKecamatan = null;
        this.date_filter = false;
        if (kecamatan) {
          this.kecamatan = kecamatan;
          this.filterKecamatan = kecamatan.id;
        } else {
          this.downloadDisabled = true;
          this.kelurahanDisabled = true;
        }
        if (this.date && this.kecamatan) {
          this.downloadDisabled = false;
        } else {
          this.downloadDisabled = true;
        }
        this.renderData();
      },
      statusSelected(status) {
        this.status = "";
        this.filterStatus = null;
        if (status) {
          this.status = status;
          this.filterStatus = status.value;
        }
        this.renderData();
      },
      dateSelected() {
        if (this.user.role == "User") {
          if (this.date) {
            this.downloadDisabled = false;
          } else {
            this.downloadDisabled = true;
          }
        } else {
          if (this.kecamatan.value) {
            this.downloadDisabled = false;
          }
          if (this.date == "") {
            this.downloadDisabled = true;
          }
          // if (this.kecamatanSelected) {
          //   console.log("Masuk guyss");
          // }
        }
        // if (this.date == "") {
        //   this.downloadDisabled = true;
        // }
        // if (date) {
        //   this.date_filter = false;
        //   this.downloadDisabled = false;
        // }
        // if (date == null) {
        //   this.downloadDisabled = true;
        // }
        // this.renderData("");
      },
      // kelurahanSelected(kelurahan) {
      //   this.kelurahan = "";
      //   this.filterKelurahan = null;
      //   if (kelurahan) {
      //     this.kelurahan = kelurahan;
      //     this.filterKelurahan = kelurahan.id;
      //   }
      //   this.renderData();
      // },
    },
  };
</script>

<style scoped lang="scss">
  // .mytable table tr {
  //   border: none;
  // }
  // .v-data-table > .v-data-table__wrapper > table > tbody > tr > td {
  //   font-size: 17px;
  // }
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    padding-left: 80px;
    padding-right: 50px;
  }

  // .v-btn:not(.v-btn--round).v-size--default {
  //   position: absolute;
  //   width: 200px;
  //   height: 50px;
  //   background: #4662d4;
  //   color: white;
  //   border-radius: 30px;
  //   font-size: 16px;
  //   margin-top: 50px;
  //   font-weight: bold;
  //   text-transform: capitalize;
  //   cursor: pointer;
  //   padding: 5px;
  // }
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
  .v-menu__content {
    border-radius: 8px;
    border: 1px solid #c4c4c4;
    outline-style: inherit;
    outline-color: white;
    box-shadow: none;

    outline-color: #e8eff2;
  }
  .v-sheet.v-list {
    background: #e8eff2;
  }
  .mobile {
    color: #333;
  }

  @media screen and (max-width: 768px) {
    .mobile table.v-table tr {
      max-width: 100%;
      position: relative;
      display: block;
    }

    .mobile table.v-table tr:nth-child(odd) {
      border-left: 6px solid deeppink;
    }

    .mobile table.v-table tr:nth-child(even) {
      border-left: 6px solid cyan;
    }

    .mobile table.v-table tr td {
      display: flex;
      width: 100%;
      border-bottom: 1px solid #f5f5f5;
      height: auto;
      padding: 10px;
    }

    .mobile table.v-table tr td ul li:before {
      content: attr(data-label);
      padding-right: 0.5em;
      text-align: left;
      display: block;
      color: #999;
    }
    .v-datatable__actions__select {
      width: 50%;
      margin: 0px;
      justify-content: flex-start;
    }
    .mobile .theme--light.v-table tbody tr:hover:not(.v-datatable__expand-row) {
      background: transparent;
    }
  }
  .flex-content {
    padding: 0;
    margin: 0;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    width: 100%;
  }

  .flex-item {
    padding: 5px;
    width: 50%;
    height: 60px;
  }
</style>
