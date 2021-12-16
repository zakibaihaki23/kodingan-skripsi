<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <h1>Laporan Realisasi PBB</h1>
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
        :items="pbb"
        :hide-header="isMobile"
        :class="{ mobile: isMobile }"
        class="elevation-1"
      >
        <template v-slot:[`item.periode`]="{ item }">
          {{ item.periode | moment("MMMM - YYYY") }}
        </template>
        <template v-slot:[`item.target_pbb`]="{ item }">
          Rp. {{ formatPrice(item.target_pbb) }}
        </template>
        <template v-slot:[`item.realisasi_bln_lalu`]="{ item }">
          <div v-if="item.realisasi_bln_lalu == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.realisasi_bln_lalu }}
          </div>
        </template>
        <template v-slot:[`item.realisasi_bln_ini`]="{ item }">
          <div v-if="item.realisasi_bln_ini == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.realisasi_bln_ini }}
          </div>
        </template>
        <template v-slot:[`item.jmlh_realisasi`]="{ item }">
          <div v-if="item.jmlh_realisasi == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.jmlh_realisasi }}
          </div>
        </template>
        <template v-slot:[`item.sisa_target`]="{ item }">
          <div v-if="item.sisa_target == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.sisa_target }}
          </div>
        </template>
        <template v-slot:[`item.keterangan`]="{ item }">
          <div v-if="item.keterangan == null">
            {{ "-" }}
          </div>
          <div v-else>
            {{ item.keterangan }}
          </div>
        </template>
        <!-- <template v-slot:item="props">
          <tr v-if="!isMobile">
            <td>{{ props.item.kelurahan }}</td>
            <td>{{ props.item.periode | moment("MMM - YYYY") }}</td>
            <td>Rp. {{ formatPrice(props.item.target_pbb) }}</td>
            <td>Rp. {{ formatPrice(props.item.realisasi_bln_lalu) }}</td>
            <td>Rp. {{ formatPrice(props.item.realisasi_bln_ini) }}</td>
            <td>{{ props.item.jmlh_realisasi }}</td>
            <td>Rp. {{ formatPrice(props.item.sisa_target) }}</td>
            <td>{{ props.item.keterangan }}</td>
            <td>
              <v-menu offset-y>
                <template v-slot:activator="{ on, attrs }">
                  <v-btn v-bind="attrs" v-on="on" icon>
                    <v-icon dark>mdi-dots-horizontal</v-icon>
                  </v-btn>
                </template>
                <v-list>
                  <template class="menu">
                    <v-list-item :to="{ path: `/pbb/${props.item.id}` }" link>
                      <div>
                        <v-list-item-title>Edit</v-list-item-title>
                      </div>
                    </v-list-item>
                  </template>
                  <v-divider style="margin-left: 10px; margin-right: 10px"></v-divider>

                  <v-list-item
                    link
                    @click="openDialog(props.item.id, props.item.kelurahan, props.item.periode)"
                    >Delete</v-list-item
                  >
                </v-list>
              </v-menu>
            </td>
          </tr>
        </template> -->
      </v-data-table>
      <!-- <v-dialog v-model="dialog" persistent max-width="360px">
        <v-card style="height: 200px">
          <v-card-title class="headline"> </v-card-title>
          <v-card-text style="font-size: 16px; margin-top: 10px" class="text-center"
            >Apa ada yakin ingin menghapus data dari <b>{{ kelurahan }}</b> ?
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-row>
              <v-col xl="5" cols="6" md="6" sm="6" lg="6">
                <v-btn
                  @click="dialog = false"
                  style="
                    margin-bottom: 20px;
                    margin-top: 5px;
                    background: #4662d4;
                    color: white;
                    border-radius: 100px;
                    width: 96px;
                    font-weight: bold;
                    height: 50px;
                    padding: 4px;
                    font-size: 16px;
                    text-transform: capitalize;
                  "
                >
                  No
                </v-btn>
              </v-col>
              <v-col xl="5" cols="6" md="6" sm="6" lg="6">
                <v-btn
                  text
                  @click="deletePBB(id)"
                  style="
                    margin-bottom: 10px;
                    margin-top: 5px;
                    background: white;
                    color: #4662d4;
                    border-style: solid;
                    border-color: #4662d4;
                    border-radius: 100px;
                    width: 96px;
                    font-weight: bold;
                    height: 50px;
                    padding: 4px;
                    font-size: 16px;
                    text-transform: capitalize;
                  "
                >
                  Yes
                </v-btn>
              </v-col>
            </v-row>
          </v-card-actions>
        </v-card>
      </v-dialog>-->
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
          },
          {
            text: "Target PBB (Rp.)",
            value: "target_pbb",
          },
          {
            text: "Realisasi Bulan yang Lalu",
            value: "realisasi_bln_lalu",
          },
          {
            text: "Realisasi Bulan Ini",
            value: "realisasi_bln_ini",
          },

          {
            text: "Jumlah Realisasi S/D Bulan Ini",
            value: "jmlh_realisasi",
          },
          {
            text: "Sisa Target",
            value: "sisa_target",
          },
          {
            text: "Keterangan (%)",
            value: "keterangan",
          },
        ],

        dataTable: [],
        warehouse: null,
        warehouse_id: "",
        type: "",
        status: null,
        filterActive: null,
        warehouseList: [],
        kecamatan: [],
        pbb: [],
        kelurahan: [],
        kelurahanDisabled: true,
        downloadDisabled: true,
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
          .get("/pbb", {
            params: {
              instansi_id: this.kecamatan.value,
              periode,
              is_verified: 1,
            },
          })
          .then((response) => {
            this.pbb = response.data.data;
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
      // kelurahanSelected(kelurahan) {
      //   this.kecamatanDisabled = true;
      //   this.kelurahan = null;
      //   this.filterKelurahan = null;
      //   if (kelurahan) {
      //     this.kecamatanDisabled = true;
      //     this.kelurahan = kelurahan;
      //     this.filterKelurahan = kelurahan.value;
      //   } else {
      //     this.kecamatanDisabled = true;
      //   }
      //   this.renderData("");
      // },
      dateSelected() {
        if (this.date) {
          this.downloadDisabled = false;
        } else {
          this.downloadDisabled = true;
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
