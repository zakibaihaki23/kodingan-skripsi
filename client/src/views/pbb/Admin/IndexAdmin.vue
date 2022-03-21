<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div>
            <h4>Laporan Realisasi PBB</h4>
          </div>
        </b-col>
        <b-col> </b-col>
      </b-row>
    </v-container>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>

    <b-row style="margin-top: 1px" cols-lg="5" cols-md="1">
      <b-col>
        <KecamatanSelected
          v-show="!firstLoad"
          v-model="kecamatan"
          @selected="kecamatanSelected"
        ></KecamatanSelected>
      </b-col>
      <b-col>
        <KelurahanSelected
          v-show="!firstLoad"
          v-model="kelurahan"
          @selected="kelurahanSelected"
          :kecamatanId="kecamatan.value"
          :disabled="kelurahanDisabled"
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
                  >
                    <template v-slot:label>Periode</template>
                  </v-text-field>
                </template>
                <span>Cari Berdasarkan Periode</span>
              </v-tooltip>
            </div>
          </template>
          <v-date-picker
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

    <v-data-table
      id="my-table"
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
      <template v-slot:[`item.kelurahan`]="{ item }">
        <div class="text-left" v-if="item.kelurahan == null">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.kelurahan }}
        </div>
      </template>
      <template v-slot:[`item.periode`]="{ item }">
        <div v-if="item.periode == '0000-00-00'">
          {{ "NIHIL" }}
        </div>
        <div v-else>
          {{ item.periode | moment("MMMM - YYYY") }}
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
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import KecamatanSelected from "../../../components/SelectKecamatan.vue";
  import KelurahanSelected from "../../../components/SelectKelurahanAdmin.vue";

  export default {
    components: { KecamatanSelected, KelurahanSelected },
    data() {
      return {
        search: "",
        searchBox: "",
        date_filter: "",
        date: "",
        pagination: {
          current_page: 1,
          total: 0,
        },
        isMobile: false,
        validDialog: false,
        tolakDialog: false,
        firstLoad: true,
        loadingBtn: false,
        isLoading: true,
        loading: false,
        dialogOverlay: false,
        overlay: false,
        kelurahans: "",
        kel: "",
        idData: "",
        data: [],
        clear: "",
        clearItem: "",
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
            text: "Kecamatan",
            value: "nama_instansi",
            class: "black--text subheading",
            width: "150px",
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
            align: "center",
            class: "black--text subheading",
          },
          {
            text: "Realisasi Bulan yang Lalu",
            value: "realisasi_bln_lalu",
            align: "center",
            class: "black--text subheading",
          },
          {
            text: "Realisasi Bulan Ini",
            value: "realisasi_bln_ini",
            align: "center",
            class: "black--text subheading",
          },

          {
            text: "Jumlah Realisasi S/D Bulan Ini",
            value: "jmlh_realisasi",
            align: "center",
            class: "black--text subheading",
          },
          {
            text: "Sisa Target",
            value: "sisa_target",
            align: "center",
            class: "black--text subheading",
          },
          {
            text: "Keterangan (%)",
            value: "keterangan",
            align: "center",
            class: "black--text subheading",
          },
        ],

        dataTable: [],
        type: "",
        status: null,
        filterActive: null,
        kecamatan: "",
        pbb: [],
        kelurahan: null,
        kelurahanDisabled: true,
        downloadDisabled: true,
        perr: "",
        kell: "",
        filterKelurahan: null,
      };
    },
    watch: {
      clearable: {
        handler: function (val) {
          this.renderData("");
        },
        deep: true,
      },
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
        let periode = "";
        if (this.date) {
          periode = this.date;
        } else {
          periode = null;
        }

        this.$http
          .get("/pbb", {
            params: {
              page: this.pagination.current_page,
              instansi_id: this.kecamatan.value,
              kelurahan: this.filterKelurahan,
              periode,
              is_verified: 2,
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
            this.isLoading = false;
          });
      },
      kecamatanSelected(kecamatan) {
        this.kecamatan = "";
        this.filterKecamatan = null;
        this.date_filter = false;
        if (kecamatan) {
          this.kelurahanDisabled = false;
          this.kecamatan = kecamatan;
          this.filterKecamatan = kecamatan.id;
        } else {
          this.kelurahanDisabled = true;
        }
        this.renderData();
      },
      kelurahanSelected(val) {
        this.val = null;
        this.filterKelurahan = "";
        if (val) {
          this.val = val;
          this.filterKelurahan = val.name;
        } else {
          this.val = null;
          this.filterKelurahan = "";
        }
        this.renderData();
      },
      dateSelected() {
        if (this.date) {
          this.downloadDisabled = false;
        } else {
          this.downloadDisabled = true;
        }
      },
    },
  };
</script>

<style scoped>
  /* .mytable table tr {
   border: none;
  } */
  .v-data-table > .v-data-table__wrapper > table > tbody > tr > td {
    font-size: 20px !important;
  }
  .theme--light.v-data-table > .v-data-table__wrapper > table > thead > tr:last-child > th {
    pointer-events: auto !important;
    cursor: pointer !important;
    outline: 0 !important;
    border-style: solid !important;
    border-width: 2px !important;
    border-color: #d7d0d0 !important;
    font-size: 12pt !important;
  }
  element.style {
    color: blue !important;
  }
  thead tr th {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    font-weight: bold;
    color: black !important;
    font-size: 10pt !important;
    vertical-align: middle !important;
    white-space: nowrap;
    border-style: solid !important;
    border-width: 2px !important;
    border-color: #d7d0d0 !important;
  }
  thead,
  tbody,
  tfoot,
  tr,
  td,
  th {
    color: black !important;
    font-weight: bold !important;
    text-align: center !important;
    border-style: solid !important;
    border-width: 2px !important;
    border-color: #d7d0d0 !important;
    font-weight: bold !important;
  }
  .v-menu__content {
    border-radius: 8px;
    border: 1px solid #c4c4c4;
    outline-style: inherit;
    outline-color: white;
    box-shadow: none;

    outline-color: #e8eff2;
  }
  /* .v-sheet.v-list {
    background: #e8eff2;
  } */
  .mobile {
    color: #333;
  }
</style>
