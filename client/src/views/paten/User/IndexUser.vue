<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div style="margin: 0px; padding: 0px">
            <h4>Laporan Rekapitulasi PATEN</h4>
          </div>
        </b-col>
        <b-col class="text-right" style="margin: 0px; padding: 0px">
          <v-btn
            large
            depressed
            v-show="!firstLoad"
            :to="{ path: '/paten/add' }"
            style="
              background: #4662d4;
              color: white;
              border-radius: 30px;
              text-transform: capitalize;
              cursor: pointer;
            "
          >
            Input Data
            <v-icon right>mdi-plus-circle</v-icon>
          </v-btn>
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

    <v-progress-linear
      :active="loading"
      :indeterminate="loading"
      middle
    ></v-progress-linear>
    <v-simple-table v-show="!firstLoad">
      <template v-slot:default>
        <thead style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
          <td rowspan="2">Periode</td>
          <td rowspan="2">Desa/Kelurahan</td>
          <td colspan="13">Jumlah Pelayanan Non Perizinan</td>
          <td colspan="5">Jumlah Pelayanan Perizinan</td>
          <td rowspan="2">Keterangan</td>
          <td rowspan="2">Status</td>
          <td rowspan="2"></td>

          <tr>
            <th>Perekaman Data KTP-E</th>
            <th>Pengantar Kartu Keluraga (KK)</th>
            <th>Keterangan Pindah</th>
            <th>Keterangan Domisili</th>
            <th>Pengantar Akte Kelahiran</th>
            <th>Pencatatan Lahir/Mati</th>
            <th>Pencatatan Perkawinan</th>
            <th>Pencatatan Perceraian</th>
            <th>Pengantar Catatan Kepolisian<br />(SKCK)</th>
            <th>Keterangan Tidak Mampu<br />(SKTM)</th>
            <th>Rekomendasi</th>
            <th>Legalisasi Umum</th>
            <th>Keterangan/Pengantar Lainnya</th>
            <th>
              Izin Mendirikan Bangunan (IMB), <br />
              Luas &lt;100 m2
            </th>
            <th>Izin Usaha Perdagangan<br />(SITU/SIUP), Modal &lt;50.000.000</th>
            <th>
              Izin Merobohkan Bangunan,<br />
              Luas &lt;100 m2
            </th>
            <th>Izin Keramaian</th>
            <th>Izin Domisili Partai</th>
          </tr>
        </thead>
        <tbody v-if="paten == ''">
          <td colspan="23" style="font-weight: bold">No Data Available</td>
        </tbody>
        <tbody>
          <tr v-for="item in paten" :key="item.id">
            <template>
              <td class="text-left" v-if="item.periode == null" style="font-weight: bold">
                Nihil
              </td>
              <td class="text-left" v-else>{{ item.periode | moment("MMMM - YYYY") }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.kelurahan == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td class="text-left" v-else>{{ item.kelurahan }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.perekaman_ktp == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.perekaman_ktp }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.pengantar_kk == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.pengantar_kk }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.ket_pindah == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.ket_pindah }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.ket_domisili == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.ket_domisili }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.pengantar_akta_lahir == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.pengantar_akta_lahir }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.pengantar_akta_mati == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.pengantar_akta_mati }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.pencatatan_perkawinan == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.pencatatan_perkawinan }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.pencatatan_perceraian == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.pencatatan_perceraian }}</td>
            </template>
            <template>
              <td class="text-left" v-if="item.skck == null" style="font-weight: bold">
                Nihil
              </td>
              <td v-else>{{ item.skck }}</td>
            </template>
            <template>
              <td class="text-left" v-if="item.sktm == null" style="font-weight: bold">
                Nihil
              </td>
              <td v-else>{{ item.sktm }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.rekomendasi == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.rekomendasi }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.legalisasi == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.legalisasi }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.ket_lain == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.ket_lain }}</td>
            </template>
            <template>
              <td class="text-left" v-if="item.imb == null" style="font-weight: bold">
                Nihil
              </td>
              <td v-else>{{ item.imb }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.situ_siup == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.situ_siup }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.izin_merobohkan_bangunan == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.izin_merobohkan_bangunan }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.izin_keramaian == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.izin_keramaian }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.izin_partai == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td v-else>{{ item.izin_partai }}</td>
            </template>
            <template>
              <td
                class="text-left"
                v-if="item.keterangan == null"
                style="font-weight: bold"
              >
                Nihil
              </td>
              <td
                v-else
                style="
                  width: 100%;
                  white-space: normal;
                  vertical-align: center !important;
                "
              >
                {{ item.keterangan }}
              </td>
            </template>
            <td v-if="item.is_verified == 1">Menunggu Validasi</td>
            <td v-if="item.is_verified == 2">Sudah Divalidasi</td>

            <td>
              <div v-if="item.is_verified == 1" class="text-right">
                <v-tooltip bottom>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on" icon link @click="dialogValid(item)">
                      <v-icon small>mdi-checkbox-marked-circle</v-icon>
                    </v-btn>
                  </template>
                  <span>Validasi Data</span>
                </v-tooltip>
                <v-tooltip bottom>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on" icon link @click="dialogTolak(item)">
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
      data: [],
      pagination: {
        current_page: 1,
        total: 0,
      },
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
      kelurahan: [],
      status: null,
      filterActive: null,
      paten: [],
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
  watch: {
    clearable: {
      handler: function (val) {
        this.renderData("");
      },
      deep: true,
    },
    loading(val) {
      if (!val) return;

      setTimeout(() => (this.loading = false), 3000);
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
      this.loading = true;

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
        .get("/camat-view/paten", {
          params: {
            page: this.pagination.current_page,
            instansi_id: `${this.user.instansi_id}`,
            kelurahan,
            periode,
            is_verified,
          },
        })
        .then((response) => {
          this.paten = response.data.data.data;
          this.firstLoad = false;
          this.dialog = false;
          this.dialogOverlay = false;
          this.overlay = false;
          this.isLoading = false;
          this.loading = false;
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
        .put(`/valid/paten/${id}`, {
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
        .put(`/valid/paten/${id}`, {
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
    KelurahanSelected(kelurahan) {
      this.filterKelurahan = null;
      if (kelurahan) {
        this.filterKelurahan = kelurahan.name;
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
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
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
