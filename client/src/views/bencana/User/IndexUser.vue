<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div>
            <h4>Laporan Keadaan Bencana Alam</h4>
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
            <td rowspan="3">Periode</td>
            <td rowspan="3">Desa/Kelurahan</td>
            <td colspan="2">Jumlah Penduduk</td>
            <td colspan="3">Rumah Tinggal</td>
            <td colspan="15">Jenis Bangunan</td>
            <td colspan="3">Korban Manusia</td>
            <td rowspan="3">Perkiraan Kerugian (Rp)</td>
            <td rowspan="3">Status</td>
            <td rowspan="3"></td>
            <tr>
              <th rowspan="2" class="text-center">KK</th>
              <th rowspan="2" class="text-center">Jiwa</th>
              <th rowspan="2" class="text-center">RB</th>
              <th rowspan="2" class="text-center">RS</th>
              <th rowspan="2" class="text-center">RR</th>
              <td colspan="3">Kantor</td>
              <td colspan="3">Sarana Pendidikan</td>
              <td colspan="3">Tempat Ibadah</td>
              <td colspan="3">Jembatan</td>
              <td colspan="3">Lainnya</td>
              <th rowspan="2">Menderita</th>
              <th rowspan="2">Luka Ringan</th>
              <th rowspan="2">Meninggal</th>
            </tr>
            <tr class="text-center">
              <th>RB</th>
              <th>RS</th>
              <th>RR</th>
              <th>RB</th>
              <th>RS</th>
              <th>RR</th>
              <th>RB</th>
              <th>RS</th>
              <th>RR</th>
              <th>RB</th>
              <th>RS</th>
              <th>RR</th>
              <th>RB</th>
              <th>RS</th>
              <th>RR</th>
            </tr>
          </thead>
          <tbody v-if="bencana == ''">
            <td colspan="23" style="font-weight: bold">No Data Available</td>
          </tbody>
          <tbody v-else>
            <tr v-for="item in bencana" :key="item.id">
              <td
                v-if="item.periode == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-left" v-else>{{ item.periode | moment("MMMM - YYYY") }}</td>

              <td
                v-if="item.kelurahan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-left" v-else>{{ item.kelurahan }}</td>

              <td
                v-if="item.jmlh_kk == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.jmlh_kk }}</td>

              <td
                v-if="item.jmlh_jiwa == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.jmlh_jiwa }}</td>

              <td
                v-if="item.rumah_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.rumah_rusak_berat }}</td>

              <td
                v-if="item.rumah_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.rumah_rusak_sedang }}</td>

              <td
                v-if="item.rumah_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.rumah_rusak_ringan }}</td>

              <td
                v-if="item.kantor_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.kantor_rusak_berat }}</td>

              <td
                v-if="item.kantor_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.kantor_rusak_sedang }}</td>

              <td
                v-if="item.kantor_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.kantor_rusak_ringan }}</td>

              <td
                v-if="item.pendidikan_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.pendidikan_rusak_berat }}</td>

              <td
                v-if="item.pendidikan_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.pendidikan_rusak_sedang }}</td>

              <td
                v-if="item.pendidikan_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.pendidikan_rusak_ringan }}</td>

              <td
                v-if="item.ibadah_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.ibadah_rusak_berat }}</td>

              <td
                v-if="item.ibadah_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.ibadah_rusak_sedang }}</td>

              <td
                v-if="item.ibadah_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.ibadah_rusak_ringan }}</td>

              <td
                v-if="item.jembatan_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.jembatan_rusak_berat }}</td>

              <td
                v-if="item.jembatan_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.jembatan_rusak_sedang }}</td>

              <td
                v-if="item.jembatan_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.jembatan_rusak_ringan }}</td>

              <td
                v-if="item.lainnya_rusak_berat == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.lainnya_rusak_berat }}</td>

              <td
                v-if="item.lainnya_rusak_sedang == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.lainnya_rusak_sedang }}</td>

              <td
                v-if="item.lainnya_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.lainnya_rusak_ringan }}</td>

              <td
                v-if="item.korban_menderita == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.korban_menderita }}</td>

              <td
                v-if="item.korban_luka == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.korban_luka }}</td>

              <td
                v-if="item.korban_meninggal == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-center" v-else>{{ item.korban_meninggal }}</td>

              <td
                v-if="item.lainnya_rusak_ringan == null"
                style="font-weight: bold"
                class="text-center"
              >
                NIHIL
              </td>
              <td class="text-left" v-else>Rp. {{ formatPrice(item.kerugian) }}</td>

              <td v-if="item.is_verified == 1">Menunggu Validasi</td>
              <td v-if="item.is_verified == 2">Sudah Divalidasi</td>
              <td>
                <div v-if="item.is_verified == 1" class="text-right">
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        v-bind="attrs"
                        v-on="on"
                        icon
                        link
                        @click="dialogValid(item)"
                      >
                        <v-icon small>mdi-checkbox-marked-circle</v-icon>
                      </v-btn>
                    </template>
                    <span>Validasi Data</span>
                  </v-tooltip>
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        v-bind="attrs"
                        v-on="on"
                        icon
                        link
                        @click="dialogTolak(item)"
                      >
                        <v-icon small>mdi-close-circle</v-icon>
                      </v-btn>
                    </template>
                    <span>Tolak Data</span>
                  </v-tooltip>
                </div>
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
      page: 1,
      dialog: false,
      firstLoad: true,
      search: "",
      date_filter: "",
      date: "",
      loadingBtn: false,
      isLoading: true,
      loading: false,
      dialogOverlay: false,
      kel: "",
      period: "",
      data: [],
      pagination: {
        current_page: 1,
        total: 0,
      },
      idData: "",
      status: null,
      filterStatus: null,
      dataTable: [],
      kelurahan: [],
      warehouse: null,
      warehouse_id: "",
      type: "",
      status: null,
      filterStatus: null,
      bencana: [],
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
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    hapusDialog(item) {
      this.dialog = true;
      this.idData = item.id;
      this.kel = item.kelurahan;
      this.period = this.$moment(item.periode).format("MMMM - YYYY");
    },
    hapusData(idData) {
      this.dialogOverlay = true;
      this.$http
        .delete("/bencana/" + idData)
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.renderData();
            self.$toast.success("Data Berhasil Dihapus");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          this.dialogOverlay = false;
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
        .get(`/camat-view/bencana`, {
          params: {
            page: this.pagination.current_page,
            instansi_id: this.user.instansi_id,
            kelurahan,
            periode,
            is_verified,
          },
        })
        .then((response) => {
          this.bencana = response.data.data.data;
          this.firstLoad = false;
          this.isLoading = false;
          this.pagination.current_page = response.data.data.current_page;
          this.pagination.total = response.data.data.total;
          this.data = response.data.data;
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
        .put(`/valid/bencana/${id}`, {
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
        .put(`/valid/bencana/${id}`, {
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
  },
};
</script>

<style scoped lang="scss">
.mytable table tr {
  border: none;
}

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
  vertical-align: middle;
  text-align: center;
  border-style: solid;
  border-width: 2px;
  border-color: #d7d0d0;
}
thead td {
  color: black !important;
  font-weight: bold;
  border-style: solid;
  border-width: 2px;
  border-color: #d7d0d0;
  text-align: center;
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
.card {
  background: #fff;
}

.card-1 {
  border: solid 1px #ddeeee;
  border-collapse: collapse;
  border-spacing: 0;
  width: 80%;
  text-align: center;
  vertical-align: middle;
  font-weight: bold;
}

// .card-1:hover {
//   box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
// }
</style>
