<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div style="margin: 0px; padding: 0px">
            <h4>Laporan Realisasi PBB</h4>
          </div>
        </b-col>
      </b-row>
    </v-container>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>

    <b-row style="margin-top: 1px" cols-lg="5" cols-md="1">
      <b-col>
        <StatusSelected v-show="!firstLoad" v-model="status" @selected="statusSelected">
        </StatusSelected>
      </b-col>
      <b-col>
        <KelurahanSelected
          v-show="!firstLoad"
          v-model="kelurahan"
          @selected="KelurahanSelected"
        >
        </KelurahanSelected>
      </b-col>
      <b-col lg="3">
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
                    style="border-radius: 10px; font-size: 13px; width: 250px"
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
            @input="(date_filter = false), renderData(search)"
          >
          </v-date-picker>
        </v-menu>
      </b-col>
      <b-col lg="1"></b-col>
      <b-col></b-col>
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
    <v-data-table
      loading-text="Memuat Data"
      v-show="!firstLoad"
      :loading="isLoading"
      :headers="table"
      :search="search"
      :items="pbb"
      :hide-header="isMobile"
      :class="{ mobile: isMobile }"
      hide-default-footer
      class="elevation-1"
    >
      <template v-slot:[`item.periode`]="{ item }">
        <div v-if="item.periode == '0000-00-00'">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.periode | moment("MMMM - YYYY") }}
        </div>
      </template>
      <template v-slot:[`item.kelurahan`]="{ item }">
        <div class="text-left" v-if="item.kelurahan == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.kelurahan }}
        </div>
      </template>
      <template v-slot:[`item.target_pbb`]="{ item }">
        <div v-if="item.target_pbb == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>Rp. {{ formatPrice(item.target_pbb) }}</div>
      </template>
      <template v-slot:[`item.realisasi_bln_lalu`]="{ item }">
        <div v-if="item.realisasi_bln_lalu == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.realisasi_bln_lalu }}
        </div>
      </template>
      <template v-slot:[`item.realisasi_bln_ini`]="{ item }">
        <div v-if="item.realisasi_bln_ini == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.realisasi_bln_ini }}
        </div>
      </template>
      <template v-slot:[`item.jmlh_realisasi`]="{ item }">
        <div v-if="item.jmlh_realisasi == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.jmlh_realisasi }}
        </div>
      </template>
      <template v-slot:[`item.sisa_target`]="{ item }">
        <div v-if="item.sisa_target == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.sisa_target }}
        </div>
      </template>
      <template v-slot:[`item.keterangan`]="{ item }">
        <div v-if="item.keterangan == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.keterangan }}
        </div>
      </template>
      <template v-slot:[`item.is_verified`]="{ item }">
        <span v-if="item.is_verified == 1">Menunggu Validasi</span>
        <span v-if="item.is_verified == 2">Sudah Divalidasi</span>
      </template>
      <template v-slot:[`item.actions`]="{ item }">
        <v-menu offset-y v-if="item.is_verified == 1">
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" v-on="on" icon>
              <v-icon dark>mdi-dots-horizontal</v-icon>
            </v-btn>
          </template>
          <v-list>
            <v-list-item link @click="dialogValid(item)">
              <v-list-item-title class="text-center">Validasi</v-list-item-title>
            </v-list-item>
            <v-list-item link @click="dialogTolak(item)">
              <v-list-item-title style="text-align: center"> Tolak </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </template>
    </v-data-table>
    <div class="mt-5">
      <b-pagination
        align="center"
        v-model="pagination.current_page"
        :total-rows="pagination.total"
        @input="onPageChange"
        :per-page="data.per_page"
        first-number
        last-number
      ></b-pagination>
    </div>
    <v-dialog v-model="dialogOverlay" persistent max-width="300">
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
    <b-modal v-model="validDialog" centered no-close-on-backdrop @ok="validasi(idData)">
      <p v-if="this.kell != null">
        Apakah anda ingin <b>Validasi</b> data dari <b>{{ this.kell }}</b
        >?
      </p>
      <p v-else>Apakah Anda ingin <b>Validasi</b> Data ini?</p>
      Pada Periode Laporan <b>{{ this.perr }}</b>
    </b-modal>
    <b-modal v-model="tolakDialog" centered no-close-on-backdrop @ok="tolak(idData)">
      <p v-if="this.kell != null">
        Apakah anda ingin <b>Menolak</b> data dari <b>{{ this.kell }}</b
        >?
      </p>
      <p v-else>Apakah Anda ingin Menolak Data ini?</p>
      Pada Periode Laporan <b>{{ this.perr }}</b>
    </b-modal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import StatusSelected from "../../../components/StatusSelected.vue";
import KelurahanSelected from "../../../components/SelectKelurahan.vue";

export default {
  components: { StatusSelected, KelurahanSelected },
  data() {
    return {
      search: "",
      searchBox: "",
      date_filter: "",
      date: "",
      isMobile: false,
      dialog: false,
      firstLoad: true,
      loadingBtn: false,
      isLoading: true,
      loading: false,
      dialogOverlay: false,
      overlay: false,
      data: [],
      pagination: {
        current_page: 1,
        total: 0,
      },
      kelurahans: "",
      kel: "",
      idData: "",
      id: "",
      period: "",
      table: [
        {
          text: "Periode Laporan",
          value: "periode",
          class: "black--text subheading",
          width: "140px",
        },
        {
          text: "Desa/Kelurahan",
          value: "kelurahan",
          class: "black--text subheading",
          width: "150px",
        },
        {
          text: "Target PBB (Rp.)",
          value: "target_pbb",
          class: "black--text subheading",
          align: "center",
        },
        {
          text: "Realisasi Bulan yang Lalu",
          value: "realisasi_bln_lalu",
          class: "black--text subheading",
          align: "center",
        },
        {
          text: "Realisasi Bulan Ini",
          value: "realisasi_bln_ini",
          class: "black--text subheading",
          align: "center",
        },

        {
          text: "Jumlah Realisasi S/D Bulan Ini",
          value: "jmlh_realisasi",
          class: "black--text subheading",
          align: "center",
        },
        {
          text: "Sisa Target",
          value: "sisa_target",
          class: "black--text subheading",
          align: "center",
        },
        {
          text: "Keterangan (%)",
          value: "keterangan",
          class: "black--text subheading",
          align: "center",
        },
        {
          text: "Status",
          value: "is_verified",
          class: "black--text subheading",
          align: "center",
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
      perr: "",
      kell: "",
      validDialog: false,
      tolakDialog: false,
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
    onPageChange() {
      this.renderData();
    },
    renderData(search) {
      this.isLoading = true;
      let kelurahan = "";
      if (this.filterKelurahan || this.filterKelurahan == 0) {
        kelurahan = this.filterKelurahan;
      } else {
        kelurahan = null;
      }

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
        .get("/camat-view/pbb", {
          params: {
            page: this.pagination.current_page,
            instansi_id: `${this.user.instansi_id}`,
            kelurahan,
            periode,
            is_verified,
          },
        })
        .then((response) => {
          this.pbb = response.data.data.data;
          this.firstLoad = false;
          this.isLoading = false;
          this.pagination.current_page = response.data.data.current_page;
          this.pagination.total = response.data.data.total;
          this.data = response.data.data;
        })
        .catch((error) => {
          if (error) {
            console.log(error);
          }
        });
    },
    dialogValid(item) {
      this.validDialog = true;
      this.kell = item.kelurahan;
      this.perr = this.$moment(item.periode).format("MMMM - YYYY");
      this.verif = item.is_verified;
      this.idData = item.id;
    },
    dialogTolak(item) {
      this.tolakDialog = true;
      this.kell = item.kelurahan;
      this.perr = this.$moment(item.periode).format("MMMM - YYYY");
      this.verif = item.is_verified;
      this.idData = item.id;
    },
    validasi(id) {
      this.dialogOverlay = true;
      this.$http
        .put(`/valid/pbb/${id}`, {
          is_verified: 2,
        })
        .then((response) => {
          this.renderData();
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Divalidasi");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          if (error) {
            this.dialogOverlay = false;
            this.renderData();
          }
        });
    },
    tolak(id) {
      this.dialogOverlay = true;
      this.$http
        .put(`/valid/pbb/${id}`, {
          is_verified: 3,
        })
        .then((response) => {
          this.renderData();
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Ditolak");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          if (error) {
            this.dialogOverlay = false;
            this.renderData();
          }
        });
    },
    KelurahanSelected(kelurahan) {
      this.filterKelurahan = null;
      if (kelurahan) {
        this.filterKelurahan = kelurahan.name;
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
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
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
</style>
