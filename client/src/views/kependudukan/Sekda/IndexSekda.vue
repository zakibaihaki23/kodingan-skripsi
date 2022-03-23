<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div>
            <h4>Laporan Kependudukan</h4>
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
    <v-progress-linear :active="isLoading" :indeterminate="isLoading" middle></v-progress-linear>
    <v-simple-table v-show="!firstLoad">
      <template v-slot:default>
        <thead style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
          <td rowspan="2">Periode</td>
          <td rowspan="2">Kecamatan</td>
          <td rowspan="2">Desa/Kelurahan</td>
          <td colspan="3">Jumlah Penduduk Awal Bulan Lalu</td>
          <td colspan="3">Lahir</td>
          <td colspan="3">Meninggal</td>
          <td colspan="3">Datang</td>
          <td colspan="3">Pindah</td>
          <td colspan="3">Jumlah Penduduk Bulan Ini</td>

          <tr style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
            <th>L</th>
            <th>P</th>
            <th>L + P</th>
          </tr>
        </thead>
        <tbody v-if="kependudukan == ''">
          <td colspan="20" style="font-weight: bold">No Data Available</td>
        </tbody>
        <tbody v-else>
          <tr v-for="item in kependudukan" :key="item.id">
            <td class="text-left" style="font-weight: bold" v-if="item.periode == null">NIHIL</td>
            <td class="text-left" v-else>{{ item.periode | moment("MMMM - YYYY") }}</td>
            <td class="text-left">{{ item.nama_instansi }}</td>
            <td class="text-left" style="font-weight: bold" v-if="item.kelurahan == null">NIHIL</td>
            <td class="text-left" v-else>{{ item.kelurahan }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.jmlh_penduduk_bln_lalu_l == null"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.jmlh_penduduk_bln_lalu_l }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.jmlh_penduduk_bln_lalu_p == null"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.jmlh_penduduk_bln_lalu_p }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.total_penduduk_bln_lalu == 0"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_penduduk_bln_lalu }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.lahir_l == null">NIHIL</td>
            <td class="text-center" v-else>{{ item.lahir_l }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.lahir_p == null">NIHIL</td>
            <td class="text-center" v-else>{{ item.lahir_p }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.total_lahir == 0">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_lahir }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.meninggal_l == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.meninggal_l }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.meninggal_p == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.meninggal_p }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.total_meninggal == 0">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_meninggal }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.datang_l == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.datang_l }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.datang_p == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.datang_p }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.total_datang == 0">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_datang }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.pindah_l == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.pindah_l }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.pindah_p == null">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.pindah_p }}</td>
            <td class="text-center" style="font-weight: bold" v-if="item.total_pindah == 0">
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_pindah }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.jmlh_penduduk_bln_ini_l == null"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.jmlh_penduduk_bln_ini_l }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.jmlh_penduduk_bln_ini_p == null"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.jmlh_penduduk_bln_ini_p }}</td>
            <td
              class="text-center"
              style="font-weight: bold"
              v-if="item.total_penduduk_bln_ini == 0"
            >
              NIHIL
            </td>
            <td class="text-center" v-else>{{ item.total_penduduk_bln_ini }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
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
        isMobile: false,
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
        data: [],
        pagination: {
          current_page: 1,
          total: 0,
        },
        kell: "",
        perr: "",
        idData: "",
        id: "",
        period: "",
        kependudukan: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterActive: null,
        kecamatan: [],
        kelurahan: null,
        kelurahanDisabled: true,
        downloadDisabled: true,
        status: null,
        filterStatus: null,
        filterKelurahan: null,
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
        let periode = "";
        if (this.date) {
          periode = this.date;
        } else {
          periode = null;
        }

        this.$http
          .get("/kependudukan", {
            params: {
              page: this.pagination.current_page,
              instansi_id: this.kecamatan.value,
              kelurahan: this.filterKelurahan,
              periode,
              is_verified: 2,
            },
          })
          .then((response) => {
            this.kependudukan = response.data.data.data;
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
  .v-data-table > .v-data-table__wrapper > table > tbody > tr > td {
    font-size: 17px;
    margin: auto;
    white-space: nowrap;
  }

  tbody td {
    text-align: center;
    border-style: solid;
    border-width: 2px;
    border-color: #d7d0d0;
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
  thead td {
    color: black !important;
    font-weight: bold;
    text-align: center;
    border-style: solid;
    border-width: 2px;
    border-color: #d7d0d0;
    font-weight: bold;
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
