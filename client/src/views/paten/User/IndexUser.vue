<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Kelola Laporan Rekapitulasi PATEN</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mt-3">
        <b-col lg="6">
          <v-btn
            v-show="!firstLoad"
            :to="{ path: '/paten/add' }"
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
        <!-- <v-col>
          <div>
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
                  class="search d-sm-none d-md-none d-lg-none d-xl-none"
                >
                </v-text-field>
              </template>
              <span>search by helper code, name, or phone number</span>
            </v-tooltip>
          </div>
        </v-col>-->
      </b-row>
    </v-container>
    <p class="mt-5" style="font-size: 25px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block"></v-divider>

    <b-row style="margin-top: 1px">
      <b-col cols="12" lg="2">
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
        :items="paten"
        class="elevation-1"
      >
        <template v-slot:header="props">
          <thead>
            <tr>
              <th>{{ props.props.headers.text }}</th>
              <th rowspan="2"></th>
              <th
                colspan="13"
                class="text-center text-dark"
                style="border-style: solid; border-width: 2px; border-color: black"
              >
                Jumlah Pelayanan Non Perizinan
              </th>
              <th
                colspan="5"
                class="text-center text-dark"
                style="border-style: solid; border-width: 2px; border-color: black"
              >
                Jumlah Pelayanan Perizinan
              </th>
              <th rowspan="2" colspan="2"></th>
            </tr>
          </thead>
        </template>
        <template v-slot:[`item.periode`]="{ item }">
          {{ item.periode | moment("MMMM - YYYY") }}
        </template>
        <template v-slot:[`item.keterangan`]="{ item }">
          <div v-if="item.keterangan == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.keterangan }}
          </div>
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
                    path: `/paten/update/${item.id}`,
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
      <v-overlay :value="overlay">
        <v-progress-circular indeterminate color="blue"></v-progress-circular>
      </v-overlay>
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
        overlay: false,
        kelurahans: "",
        kel: "",
        idData: "",
        id: "",
        period: "",
        table: [
          {
            text: "Desa/Kelurahan",
            value: "kelurahan",
          },
          {
            text: "Periode Laporan",
            value: "periode",
            align: "center",
          },
          {
            text: "Perekaman Data KTP-E",
            value: "perekaman_ktp",
            align: "center",
          },
          {
            text: "Pengantar Kartu Keluarga (KK)",
            value: "pengantar_kk",
            align: "center",
          },
          {
            text: "Keterangan Pindah",
            value: "ket_pindah",
            align: "center",
          },
          {
            text: "Keterangan Domisili",
            value: "ket_domisili",
            align: "center",
          },
          {
            text: "Pengantar Akte Kelahiran",
            value: "pengantar_akta_lahir",
            align: "center",
          },
          {
            text: "Pencatatan Lahir/Mati",
            value: "pengantar_akta_mati",
            align: "center",
          },
          {
            text: "Pencatatan Perkawinan",
            value: "pencatatan_perkawinan",
            align: "center",
          },
          {
            text: "Pencatatan Perceraian",
            value: "pencatatan_perceraian",
            align: "center",
          },
          {
            text: "Pengantar Catatan Kepolisian (SKCK)",
            value: "skck",
            align: "center",
          },
          {
            text: "Keterangan Tidak Mampu (SKTM)",
            value: "sktm",
            align: "center",
          },
          {
            text: "Rekomendasi",
            value: "rekomendasi",
            align: "center",
          },
          {
            text: "Legalisasi Umum",
            value: "legalisasi",
            align: "center",
          },
          {
            text: "Ket./Pengantar Lainnya",
            value: "ket_lain",
            align: "center",
          },
          {
            text: "Izin Mendirikan Bangunan (IMB), Luas <100 m2",
            value: "imb",
            align: "center",
          },
          {
            text: "Izin Usaha Perdagangan (SITU/SIUP), Modal <50.000.000",
            value: "situ_siup",
            align: "center",
          },
          {
            text: "Izin Merobohkan Bangunan, Luas <100 m2",
            value: "izin_merobohkan_bangunan",
            align: "center",
          },
          {
            text: "Izin Keramaian",
            value: "izin_keramaian",
            align: "center",
          },
          {
            text: "Izin Domisili Partai",
            value: "izin_partai",
            align: "center",
          },
          {
            text: "Keterangan",
            value: "keterangan",
            align: "center",
          },
          {
            text: "Status",
            value: "is_verified",
            align: "center",
          },
          {
            value: "actions",
            sortable: false,
          },
        ],
        status: null,
        filterActive: null,
        paten: [],
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
        // UNTUK USER

        this.$http
          .get("/paten", {
            params: {
              instansi_id: `${this.user.instansi_id}`,
              periode,
              is_verified,
            },
          })
          .then((response) => {
            this.paten = response.data.data;
            this.firstLoad = false;
            this.dialog = false;
            this.dialogOverlay = false;
            this.overlay = false;
            this.isLoading = false;
          })
          .catch((error) => {
            if (error) {
              console.log(error);
            }
          });
      },
      hapusDialog(item) {
        this.dialog = true;
        this.idData = item.id;
        this.kel = item.kelurahan;
        this.period = this.$moment(item.periode).format("MMMM - YYYY");
      },
      hapusData(idData) {
        this.overlay = true;
        this.$http.delete("/paten/" + idData).then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialog = false;
            self.overlay = false;
            self.renderData();
            self.$toast.success("Data Berhasil Dihapus");
          }, 10 * 10 * 10);
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

<style></style>
