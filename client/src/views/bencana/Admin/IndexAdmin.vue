<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Laporan Keadaan Bencana Alam</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mt-3">
        <b-col lg="6">
          <v-btn
            v-show="!firstLoad"
            :to="{ path: '/bencana/add' }"
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
      </b-row>
    </v-container>
    <p class="d-flex d-none d-sm-block" style="font-size: 25px; margin-top: 40px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>
    <b-row style="margin-top: 1px">
      <b-col cols="12" lg="3">
        <KecamatanSelected
          v-show="!firstLoad"
          v-model="kecamatan"
          @selected="kecamatanSelected"
        ></KecamatanSelected>
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
                  >
                    <template v-slot:label>Filter Periode</template>
                  </v-text-field>
                </template>
                <span>Cari Berdasarkan Periode</span>
              </v-tooltip>
            </div>
          </template>
          <v-date-picker locale="id" v-model="date" type="month" no-title scrollable>
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
    <div>
      <v-skeleton-loader
        v-if="firstLoad"
        :loading="isLoading"
        type="table-tbody"
        :types="{ 'table-row': 'table-cell@8' }"
      ></v-skeleton-loader>
      <v-simple-table v-show="!firstLoad">
        <template v-slot:default>
          <thead style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
            <tr style="border-style: solid; border-width: 2px; border-color: #d7d0d0">
              <th
                rowspan="3"
                style="
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Desa/Kelurahan
              </th>
              <th
                rowspan="3"
                style="
                  text-align: center;
                  white-space: nowrap;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Periode
              </th>
              <th
                colspan="2"
                style="
                  white-space: nowrap;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Jumlah Penduduk
              </th>
              <th
                colspan="3"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Rumah Tinggal
              </th>
              <th
                colspan="15"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Jenis Bangunan
              </th>
              <th
                colspan="3"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Korban Manusia
              </th>
              <th
                rowspan="3"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Perkiraan Kerugian (Rp)
              </th>
              <th
                rowspan="3"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              >
                Status
              </th>
              <th
                rowspan="3"
                style="
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                  text-align: center;
                "
              ></th>
            </tr>
            <tr>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                KK
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Jiwa
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
              <th
                colspan="3"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Kantor
              </th>
              <th
                colspan="3"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Sarana Pendidikan
              </th>
              <th
                colspan="3"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Tempat Ibadah
              </th>
              <th
                colspan="3"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Jembatan
              </th>
              <th
                colspan="3"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Lainnya
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Menderita
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Luka Ringan
              </th>
              <th
                rowspan="2"
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                Meninggal
              </th>
            </tr>
            <tr>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RB
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RS
              </th>
              <th
                style="
                  vertical-align: middle;
                  text-align: center;
                  border-style: solid;
                  border-width: 2px;
                  border-color: #d7d0d0;
                "
              >
                RR
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in bencana" :key="item.kelurahan">
              <td class="text-left">{{ item.kelurahan }}</td>
              <td class="text-left">{{ item.periode | moment("MMMM - YYYY") }}</td>
              <td>{{ item.jmlh_kk }}</td>
              <td>{{ item.jmlh_jiwa }}</td>
              <td>{{ item.rumah_rusak_berat }}</td>
              <td>{{ item.rumah_rusak_sedang }}</td>
              <td>{{ item.rumah_rusak_ringan }}</td>
              <td>{{ item.kantor_rusak_berat }}</td>
              <td>{{ item.kantor_rusak_sedang }}</td>
              <td>{{ item.kantor_rusak_ringan }}</td>
              <td>{{ item.pendidikan_rusak_berat }}</td>
              <td>{{ item.pendidikan_rusak_sedang }}</td>
              <td>{{ item.pendidikan_rusak_ringan }}</td>
              <td>{{ item.ibadah_rusak_berat }}</td>
              <td>{{ item.ibadah_rusak_sedang }}</td>
              <td>{{ item.ibadah_rusak_ringan }}</td>
              <td>{{ item.jembatan_rusak_berat }}</td>
              <td>{{ item.jembatan_rusak_sedang }}</td>
              <td>{{ item.jembatan_rusak_ringan }}</td>
              <td>{{ item.lainnya_rusak_berat }}</td>
              <td>{{ item.lainnya_rusak_sedang }}</td>
              <td>{{ item.lainnya_rusak_ringan }}</td>
              <td>{{ item.korban_menderita }}</td>
              <td>{{ item.korban_luka }}</td>
              <td>{{ item.korban_meninggal }}</td>
              <td>Rp. {{ formatPrice(item.kerugian) }}</td>
              <td v-if="item.is_verified == 0">Menunggu Validasi</td>
              <td v-if="item.is_verified == 1">Sudah Divalidasi</td>
              <td>
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
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <b-modal v-model="validDialog" centered no-close-on-backdrop @ok="validasi(idData)">
        Apakah anda ingin melakukan <b>Validasi</b> data dari
        <b>{{ this.kell }}</b>
        <br />Pada Periode Laporan <b>{{ this.perr }}</b
        >?
      </b-modal>
      <b-modal v-model="tolakDialog" centered no-close-on-backdrop @ok="tolak(idData)">
        Apakah anda ingin <b>Menolak</b> data dari
        <b>{{ this.kell }}</b>
        <br />Pada Periode Laporan <b>{{ this.perr }}</b
        >?
      </b-modal>
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
        validDialog: false,
        tolakDialog: false,
        kell: "",
        perr: "",
        idData: "",
        status: null,
        filterStatus: null,
        kecamatan: [],
        headers: [
          {
            text: "Desa/Kelurahan",
            align: "start",
            value: "kelurahan",
          },
          {
            text: "",
            value: "periode",
          },
          {
            text: "",
            align: "center",
            value: "jmlh_penduduk_bln_lalu_l",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "jmlh_penduduk_bln_lalu_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_penduduk_bln_lalu",
            sortable: false,
            class: "black--text",
          },

          {
            text: "",
            align: "center",
            value: "lahir_l",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "lahir_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_lahir",
            sortable: false,
            class: "black--text",
          },
          {
            text: "",
            align: "center",
            value: "meninggal_l",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "meninggal_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_meninggal",
            sortable: false,
            class: "black--text",
          },
          {
            text: "",
            align: "center",
            value: "datang_l",
            sortable: false,
          },

          {
            text: "",
            align: "center",
            value: "datang_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_datang",
            sortable: false,
            class: "black--text",
          },
          {
            text: "",
            align: "center",
            value: "pindah_l",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "pindah_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_pindah",
            sortable: false,
            class: "black--text",
          },

          {
            text: "",
            align: "center",
            value: "jmlh_penduduk_bln_ini_l",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "jmlh_penduduk_bln_ini_p",
            sortable: false,
          },
          {
            text: "",
            align: "center",
            value: "total_penduduk_bln_ini",
            sortable: false,
            class: "black--text",
          },

          {
            align: "center",
            value: "actions",
            sortable: false,
            sortable: false,
          },
        ],

        dataTable: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterStatus: null,
        bencana: [],
      };
    },
    created() {
      this.renderData();
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
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    padding-left: 30px;
    padding-right: 20px;
  }
  tbody td {
    text-align: center;
    border-style: solid;
    border-width: 2px;
    border-color: #d7d0d0;
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
