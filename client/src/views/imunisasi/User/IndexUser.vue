<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div style="margin: 0px; padding: 0px">
            <h4>Laporan Imunisasi</h4>
          </div>
        </b-col>
        <b-col class="text-right" style="margin: 0px; padding: 0px"> </b-col>
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
                  >
                    <template v-slot:label>Filter Periode</template>
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
    <div>
      <v-skeleton-loader
        v-if="firstLoad"
        :loading="isLoading"
        type="table-tbody"
        :types="{ 'table-row': 'table-cell@8' }"
      ></v-skeleton-loader>
      <v-progress-linear
        :active="isLoading"
        :indeterminate="isLoading"
        middle
      ></v-progress-linear>
      <v-simple-table v-show="!firstLoad">
        <template v-slot:default>
          <thead style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
            <td rowspan="2">Periode</td>
            <td rowspan="2" style="width: 60px">Desa/Kelurahan</td>
            <td rowspan="2" style="width: 100px">BCG</td>
            <td colspan="3">DPT</td>
            <td colspan="4">Polio</td>
            <td rowspan="2" style="width: 100px">CMP</td>
            <td colspan="2">Ibu Hamil</td>
            <td colspan="2">Anak SD</td>
            <td colspan="2">CP</td>
            <td rowspan="2">Keterangan</td>
            <td rowspan="2">Status</td>
            <td rowspan="2"></td>

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
            <td colspan="20" style="font-weight: bold">No Data Available</td>
          </tbody>
          <tbody>
            <tr v-for="item in imunisasi" :key="item.id">
              <td v-if="item.periode">{{ item.periode | moment("MMMM - YYYY") }}</td>
              <template v-if="item.kelurahan == null">
                <td colspan="17" style="font-weight: bold">Nihil</td>
              </template>
              <template v-else>
                <td class="text-left">{{ item.kelurahan }}</td>
                <td class="text-center" style="font-weight: bold" v-if="item.bcg == null">
                  0
                </td>
                <td class="text-center" v-else>{{ item.bcg }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.dpt_1 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.dpt_1 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.dpt_2 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.dpt_2 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.dpt_3 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.dpt_3 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.polio_1 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.polio_1 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.polio_2 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.polio_2 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.polio_3 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.polio_3 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.polio_4 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.polio_4 }}</td>
                <td class="text-center" style="font-weight: bold" v-if="item.cmp == null">
                  0
                </td>
                <td class="text-center" v-else>{{ item.cmp }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.ibu_hamil_1 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.ibu_hamil_1 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.ibu_hamil_2 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.ibu_hamil_2 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.anak_sd_1 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.anak_sd_1 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.anak_sd_2 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.anak_sd_2 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.cp_1 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.cp_1 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.cp_2 == null"
                >
                  0
                </td>
                <td class="text-center" v-else>{{ item.cp_2 }}</td>
                <td
                  class="text-center"
                  style="font-weight: bold"
                  v-if="item.keterangan == null"
                >
                  -
                </td>
                <td class="text-center" v-else>{{ item.keterangan }}</td>
              </template>
              <td v-if="item.is_verified == 1">Perlu Divalidasi</td>
              <td v-if="item.is_verified == 2">Sudah Divalidasi</td>
              <td>
                <v-menu offset-y v-if="item.is_verified == 1">
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on" icon>
                      <v-icon dark>mdi-dots-horizontal</v-icon>
                    </v-btn>
                  </template>
                  <v-list>
                    <template class="menu">
                      <v-list-item link @click="dialogValid(item)">
                        <v-list-item-title class="text-center"
                          >Validasi</v-list-item-title
                        >
                      </v-list-item>
                      <v-list-item link @click="dialogTolak(item)">
                        <v-list-item-title style="text-align: center">
                          Tolak
                        </v-list-item-title>
                      </v-list-item>
                    </template>
                  </v-list>
                </v-menu>
              </td>
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
      dialog: false,
      firstLoad: true,
      search: "",
      date_filter: "",
      date: "",
      loadingBtn: false,
      isLoading: true,
      loading: false,
      dialogOverlay: false,
      kell: "",
      perr: "",
      kel: "",
      period: "",
      idData: "",
      data: [],
      pagination: {
        current_page: 1,
        total: 0,
      },
      status: null,
      filterStatus: null,
      dataTable: [],
      kelurahan: [],
      warehouse: null,
      warehouse_id: "",
      type: "",
      status: null,
      filterActive: null,
      imunisasi: [],
      perr: "",
      kell: "",
      validDialog: false,
      tolakDialog: false,
    };
  },
  created() {
    this.renderData();
  },
  // mounted() {
  //   this.renderData('', this.status)
  // },
  // watch: {
  //   status: {
  //     handler: function(val) {
  //       this.renderData(this.search, val)
  //     },
  //     deep: true,
  //   },
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
      this.firstLoad = true;
      this.dialogOverlay = true;
      this.$http
        .put(`/valid/imunisasi/${id}`, {
          is_verified: 2,
        })
        .then((response) => {
          this.renderData();
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.firstLoad = false;
            self.$toast.success("Data Berhasil Divalidasi");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          if (error) {
            this.dialogOverlay = false;
            this.firstLoad = false;
            this.renderData();
          }
        });
    },
    tolak(id) {
      this.dialogOverlay = true;
      this.$http
        .put(`/valid/imunisasi/${id}`, {
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

    onPageChange() {
      this.renderData();
    },
    renderData() {
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

      this.$http
        .get(`/camat-view/imunisasi`, {
          params: {
            page: this.pagination.current_page,
            instansi_id: this.user.instansi_id,
            kelurahan,
            periode,
            is_verified,
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
  },
};
</script>

<style scoped lang="scss">
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
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  font-weight: bold;
  color: black !important;
  font-size: 10pt !important;
  vertical-align: middle !important;
  white-space: nowrap;
  border-style: solid !important;
  border-width: 2px !important;
  border-color: #d7d0d0 !important;
  text-align: center !important;
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
</style>
