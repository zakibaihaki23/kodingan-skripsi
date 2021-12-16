<template>
  <div class="helper">
    <h1>Laporan Kependudukan</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mt-3">
        <b-col lg="6">
          <v-btn
            v-show="!firstLoad"
            :to="{ path: '/kependudukan/add' }"
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

      <v-data-table
        loading-text="Memuat Data"
        v-show="!firstLoad"
        :items="kependudukan"
        :headers="headers"
        :search="search"
        :loading="isLoading"
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
                    path: `/kependudukan/update/${item.id}`,
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
        idData: "",
        status: null,
        filterStatus: null,
        headers: [
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

        dataTable: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterActive: null,
        kependudukan: [],
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
      hapusDialog(item) {
        this.dialog = true;
        this.idData = item.id;
        this.kel = item.kelurahan;
        this.period = this.$moment(item.periode).format("MMMM - YYYY");
      },
      hapusData(idData) {
        this.overlay = true;
        this.$http.delete("/kependudukan/" + idData).then((response) => {
          let self = this;
          setTimeout(function () {
            self.overlay = false;
            self.renderData();
            self.$toast.success("Data Berhasil Dihapus");
          }, 10 * 10 * 10);
        });
      },
      renderData() {
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

        this.$http
          .get(`/kependudukan`, {
            params: {
              instansi_id: this.user.instansi_id,
              periode,
              is_verified,
            },
          })
          .then((response) => {
            this.kependudukan = response.data.data;
            this.firstLoad = false;
            this.isLoading = false;
          });
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
  }
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    padding-left: 30px;
    padding-right: 20px;
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
