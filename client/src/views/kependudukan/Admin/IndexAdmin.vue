<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Laporan Kependudukan</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mt-3">
        <b-col> </b-col>
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
      </b-row>
    </v-container>
    <p class="mt-5" style="font-size: 25px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>

    <b-row style="margin-top: 1px">
      <b-col cols="12" lg="3">
        <KecamatanSelected
          v-show="!firstLoad"
          v-model="kecamatan"
          @selected="kecamatanSelected"
          :disabled="kelurahanDisabled"
        ></KecamatanSelected>
      </b-col>
      <b-col cols="12" lg="4">
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
                    readonly
                    single-line
                    clearable
                    dense
                    @click:clear="(date = ''), renderData(search)"
                    :value="format_date"
                    @input="dateSelected"
                  >
                    <template v-slot:label>Periode</template>
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
    </b-row>
    <br />
    <v-skeleton-loader
      v-if="firstLoad"
      :loading="isLoading"
      type="table-tbody"
      :types="{ 'table-row': 'table-cell@8' }"
    ></v-skeleton-loader>
    <div id="app">
      <v-data-table
        loading-text="Memuat Data"
        v-show="!firstLoad"
        :loading="isLoading"
        :headers="table"
        :search="search"
        :items="kependudukan"
        :hide-header="isMobile"
        :class="{ mobile: isMobile }"
        class="elevation-1"
      >
        <template v-slot:header="props">
          <thead>
            <td>{{ props.props.headers.text }}</td>
            <td></td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Jumlah Penduduk Awal Bulan Lalu
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Lahir
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Meninggal
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Datang
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Pindah
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card-1"
            >
              Jumlah Penduduk Bulan Ini
            </td>
          </thead>
        </template>
        <template v-slot:[`item.periode`]="{ item }">
          {{ item.periode | moment("MMMM - YYYY") }}
        </template>
        <template v-slot:[`item.total_penduduk_bln_lalu`]="{ item }">
          <span style="font-weight: bold">{{ item.total_penduduk_bln_lalu }}</span>
        </template>
        <template v-slot:[`item.total_lahir`]="{ item }">
          <span style="font-weight: bold">{{ item.total_lahir }}</span>
        </template>
        <template v-slot:[`item.total_meninggal`]="{ item }">
          <span style="font-weight: bold">{{ item.total_meninggal }}</span>
        </template>
        <template v-slot:[`item.total_datang`]="{ item }">
          <span style="font-weight: bold">{{ item.total_datang }}</span>
        </template>
        <template v-slot:[`item.total_pindah`]="{ item }">
          <span style="font-weight: bold">{{ item.total_pindah }}</span>
        </template>
        <template v-slot:[`item.total_penduduk_bln_ini`]="{ item }">
          <span style="font-weight: bold">{{ item.total_penduduk_bln_ini }}</span>
        </template>
        <template v-slot:[`item.is_verified`]="{ item }">
          <span v-if="item.is_verified == 0">Menunggu Validasi</span>
          <span v-if="item.is_verified == 1">Sudah Divalidasi</span>
        </template>
        <template v-slot:[`item.actions`]="{ item }">
          <v-menu offset-y v-if="item.is_verified == 0">
            <template v-slot:activator="{ on, attrs }">
              <v-btn v-bind="attrs" v-on="on" icon>
                <v-icon dark>mdi-dots-horizontal</v-icon>
              </v-btn>
            </template>
            <v-list>
              <template class="menu">
                <v-list-item link>
                  <div>
                    <v-list-item-title @click="dialogValid(item)">Validasi</v-list-item-title>
                  </div>
                </v-list-item>
              </template>
              <v-divider style="margin-left: 10px; margin-right: 10px"></v-divider>

              <v-list-item @click="dialogTolak(item)">Tolak</v-list-item>
            </v-list>
          </v-menu>
        </template>
      </v-data-table>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import KecamatanSelected from "../../../components/SelectKecamatan.vue";
  import KelurahanSelected from "../../../components/SelectKelurahan.vue";

  export default {
    components: { KecamatanSelected, KelurahanSelected },
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
        validDialog: false,
        tolakDialog: false,
        overlay: false,
        kelurahans: "",
        kell: "",
        perr: "",
        idData: "",
        id: "",
        period: "",
        table: [
          {
            text: "Desa/Kelurahan",
            align: "center",
            value: "kelurahan",
            width: "190px",
          },
          {
            text: "Periode",
            align: "center",
            value: "periode",
            width: "190px",
          },
          {
            text: "L",
            align: "center",
            value: "jmlh_penduduk_bln_lalu_l",
            sortable: false,
          },
          {
            text: "P",
            align: "center",
            value: "jmlh_penduduk_bln_lalu_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_penduduk_bln_lalu",
            sortable: false,
            class: "black--text",
          },

          {
            text: "L",
            align: "center",
            value: "lahir_l",
            sortable: false,
          },
          {
            text: "P",
            align: "center",
            value: "lahir_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_lahir",
            sortable: false,
            class: "black--text",
          },
          {
            text: "L",
            align: "center",
            value: "meninggal_l",
            sortable: false,
          },
          {
            text: "P",
            align: "center",
            value: "meninggal_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_meninggal",
            sortable: false,
            class: "black--text",
          },
          {
            text: "L",
            align: "center",
            value: "datang_l",
            sortable: false,
          },

          {
            text: "P",
            align: "center",
            value: "datang_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_datang",
            sortable: false,
            class: "black--text",
          },
          {
            text: "L",
            align: "center",
            value: "pindah_l",
            sortable: false,
          },
          {
            text: "P",
            align: "center",
            value: "pindah_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_pindah",
            sortable: false,
            class: "black--text",
          },

          {
            text: "L",
            align: "center",
            value: "jmlh_penduduk_bln_ini_l",
            sortable: false,
          },
          {
            text: "P",
            align: "center",
            value: "jmlh_penduduk_bln_ini_p",
            sortable: false,
          },
          {
            text: "L+P",
            align: "center",
            value: "total_penduduk_bln_ini",
            sortable: false,
            class: "black--text",
          },
          {
            text: "Status",
            value: "is_verified",
            align: "center",
          },
          {
            align: "center",
            value: "actions",
            sortable: false,
            sortable: false,
          },
        ],
        kependudukan: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterActive: null,
        kecamatan: [],
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
      renderData(search) {
        this.isLoading = true;
        let periode = "";
        if (this.date) {
          periode = this.date;
        } else {
          periode = null;
        }

        this.$http
          .get("/kependudukan", {
            params: {
              instansi_id: this.kecamatan.value,
              periode,
              is_verified: 1,
            },
          })
          .then((response) => {
            this.kependudukan = response.data.data;
            this.firstLoad = false;
            this.isLoading = false;
          })
          .catch((error) => {
            if (error) {
              console.log(error);
            }
            this.isLoading = false;
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
      kelurahanSelected(kelurahan) {
        this.kecamatanDisabled = true;
        this.kelurahan = null;
        this.filterKelurahan = null;
        if (kelurahan) {
          this.kecamatanDisabled = true;
          this.kelurahan = kelurahan;
          this.filterKelurahan = kelurahan.value;
        } else {
          this.kecamatanDisabled = true;
        }
        this.renderData("");
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
        }
      },
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
