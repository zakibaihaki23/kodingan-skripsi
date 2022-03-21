<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div>
            <h4>Laporan Imunisasi</h4>
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
          <td rowspan="2" style="width: 60px">Desa/Kelurahan</td>
          <td rowspan="2" style="width: 100px">BCG</td>
          <td colspan="3">DPT</td>
          <td colspan="4">Polio</td>
          <td rowspan="2" style="width: 100px">CMP</td>
          <td colspan="2">Ibu Hamil</td>
          <td colspan="2">Anak SD</td>
          <td colspan="2">CP</td>
          <td rowspan="2">Keterangan</td>

          <tr
            class="text-center"
            style="
              text-align: center;
              border-style: solid;
              border-width: 2px;
              border-color: #d7d0d0;
            "
          >
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>TT 1</th>
            <th>TT 2</th>
            <th>DT 1</th>
            <th>DT 2</th>
            <th>TT 1</th>
            <th>TT 2</th>
          </tr>
        </thead>
        <tbody v-if="imunisasi == ''">
          <td colspan="21" style="font-weight: bold">No Data Available</td>
        </tbody>
        <tbody>
          <tr v-for="item in imunisasi" :key="item.id">
            <td v-if="item.periode">{{ item.periode | moment("MMMM - YYYY") }}</td>
            <td v-if="item.nama_instansi">{{ item.nama_instansi }}</td>
            <template v-if="item.kelurahan == null">
              <td colspan="17" style="font-weight: bold">Nihil</td>
            </template>
            <template v-else>
              <td class="text-left">{{ item.kelurahan }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.bcg == null">0</td>
              <td class="text-center" v-else>{{ item.bcg }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.dpt_1 == null">0</td>
              <td class="text-center" v-else>{{ item.dpt_1 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.dpt_2 == null">0</td>
              <td class="text-center" v-else>{{ item.dpt_2 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.dpt_3 == null">0</td>
              <td class="text-center" v-else>{{ item.dpt_3 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.polio_1 == null">0</td>
              <td class="text-center" v-else>{{ item.polio_1 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.polio_2 == null">0</td>
              <td class="text-center" v-else>{{ item.polio_2 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.polio_3 == null">0</td>
              <td class="text-center" v-else>{{ item.polio_3 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.polio_4 == null">0</td>
              <td class="text-center" v-else>{{ item.polio_4 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.cmp == null">0</td>
              <td class="text-center" v-else>{{ item.cmp }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.ibu_hamil_1 == null">
                0
              </td>
              <td class="text-center" v-else>{{ item.ibu_hamil_1 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.ibu_hamil_2 == null">
                0
              </td>
              <td class="text-center" v-else>{{ item.ibu_hamil_2 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.anak_sd_1 == null">0</td>
              <td class="text-center" v-else>{{ item.anak_sd_1 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.anak_sd_2 == null">0</td>
              <td class="text-center" v-else>{{ item.anak_sd_2 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.cp_1 == null">0</td>
              <td class="text-center" v-else>{{ item.cp_1 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.cp_2 == null">0</td>
              <td class="text-center" v-else>{{ item.cp_2 }}</td>
              <td class="text-center" style="font-weight: bold" v-if="item.keterangan == null">
                -
              </td>
              <td class="text-center" v-else>{{ item.keterangan }}</td>
            </template>
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
        validDialog: false,
        tolakDialog: false,
        firstLoad: true,
        loadingBtn: false,
        isLoading: true,
        loading: false,
        dialogOverlay: false,
        overlay: false,
        kelurahans: "",
        data: [],
        pagination: {
          current_page: 1,
          total: 0,
        },
        kel: "",
        idData: "",
        id: "",
        period: "",
        status: null,
        filterActive: null,
        kelurahanDisabled: true,
        paten: [],
        kecamatan: [],
        kelurahan: null,
        status: null,
        filterStatus: null,
        perr: "",
        kell: "",
        filterKelurahan: null,
        imunisasi: [],
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
        // UNTUK USER
        this.$http
          .get(`/imunisasi`, {
            params: {
              page: this.pagination.current_page,
              instansi_id: this.kecamatan.value,
              kelurahan: this.filterKelurahan,
              periode,
              is_verified: 2,
            },
          })
          .then((response) => {
            this.imunisasi = response.data.data.data;
            this.firstLoad = false;
            this.isLoading = false;
            this.pagination.current_page = response.data.data.current_page;
            this.pagination.total = response.data.data.total;
            this.data = response.data.data;
          })
          .catch((error) => {
            this.firstLoad = false;
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

<style scoped>
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
    text-align: center !important;
    border-style: solid;
    border-width: 2px;
    border-color: #d7d0d0;
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
</style>
