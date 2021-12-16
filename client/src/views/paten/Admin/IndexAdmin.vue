<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Laporan Rekapitulasi PATEN</h1>
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
        :hide-header="isMobile"
        :class="{ mobile: isMobile }"
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
      </v-data-table>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import KecamatanSelected from "../../../components/SelectKecamatan.vue";

  export default {
    components: { KecamatanSelected },
    data() {
      return {
        search: "",
        searchBox: "",
        date_filter: "",
        date: "",
        isMobile: false,
        page: 1,
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
            value: "actions",
            sortable: false,
          },
        ],
        status: null,
        filterActive: null,
        paten: [],
        kecamatan: [],
        status: null,
        filterStatus: null,
        perr: "",
        kell: "",
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
              instansi_id: this.kecamatan.value,
              periode,
              is_verified: 1,
            },
          })
          .then((response) => {
            this.paten = response.data.data;
            this.firstLoad = false;
            this.dialog = false;
            this.dialogOverlay = false;
            this.overlay = true;
            this.isLoading = false;
          })
          .catch((error) => {
            if (error) {
              console.log(error);
            }
          });
      },
      kecamatanSelected(kecamatan) {
        this.downloadDisabled = true;
        this.kecamatan = "";
        this.filterKecamatan = null;
        this.date_filter = false;
        if (kecamatan) {
          this.kecamatan = kecamatan;
          this.filterKecamatan = kecamatan.id;
        } else {
          this.downloadDisabled = true;
        }
        if (this.date && this.kecamatan) {
          this.downloadDisabled = false;
        } else {
          this.downloadDisabled = true;
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
