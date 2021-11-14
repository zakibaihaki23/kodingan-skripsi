<template>
  <div class="helper">
    <h1>Laporan PBB</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <v-row>
        <v-col></v-col>
        <v-col>
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
                  class="search d-none d-sm-none d-sm-flex"
                >
                </v-text-field>
              </template>
              <span>search by helper code, name, or phone number</span>
            </v-tooltip>
          </div>
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
                  class="search2 d-sm-none d-md-none d-lg-none d-xl-none"
                >
                </v-text-field>
              </template>
              <span>search by helper code, name, or phone number</span>
            </v-tooltip>
          </div>
        </v-col>
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
        </v-col> -->
      </v-row>
    </v-container>
    <p
      class="d-flex d-none d-sm-block"
      style="font-size: 25px; margin-top: 40px"
    >
      Filter
    </p>
    <v-divider
      class="d-flex d-none d-sm-block"
      style="margin-right: 40px"
    ></v-divider>
    <v-col md="12"> </v-col>
    <v-row class="mb-6" style="margin-top: 1px">
      <v-col cols="10" md="4" lg="3" xl="2" sm="6">
        <KecamatanSelected v-model="kecamatan" @selected="kecamatanSelected">
        </KecamatanSelected>
      </v-col>
      <v-col cols="2">
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
                    v-bind="attrs"
                    v-on="on"
                    style="border-radius: 10px; font-size: 13px"
                    prepend-inner-icon="mdi-calendar"
                    outlined
                    single-line
                    clearable
                    dense
                    @click:clear="(date = ''), renderData(search)"
                    :value="format_date"
                  >
                    <template v-slot:label> Filter Periode</template>
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
            <v-spacer></v-spacer>
          </v-date-picker>
        </v-menu>
      </v-col>
      <v-col cols="12" sm="1" md="6" lg="7" xl="2">
        <div>
          <v-dialog v-model="dialog" persistent max-width="1px">
            <div class="text-center"></div>
          </v-dialog>
          <v-btn
            style="
              bottom: 5px;
              background: #4662d4;
              color: white;
              border-radius: 30px;
              width: 250px;
              font-weight: bold;
              height: 50px;
              padding: 4px;
              font-size: 16px;
              text-transform: capitalize;
            "
            @click="openDialog"
            >Download</v-btn
          >
        </div>
      </v-col>
    </v-row>
    <br />
    <div>
      <v-skeleton-loader
        v-if="firstLoad"
        :loading="isLoading"
        type="table-tbody"
        :types="{ 'table-row': 'table-cell@8' }"
      ></v-skeleton-loader>

      <v-data-table
        loading-text="Please Wait...."
        v-show="!firstLoad"
        :headers="table"
        :items="pbb"
        :page.sync="page"
        :items-per-page="10"
        :search="search"
        @page-count="pageCount = $event"
        :loading="isLoading"
        mobile-breakpoint="0"
      >
        <template v-slot:item="props">
          <tr>
            <td>{{ props.item.kelurahan }}</td>
            <td>{{ props.item.waktu | moment("MMM - YYYY") }}</td>
            <td>{{ props.item.target_pbb }}</td>
            <td>{{ props.item.realisasi_bln_lalu }}</td>
            <td>{{ props.item.realisasi_bln_ini }}</td>
            <td>{{ props.item.jmlh_realisasi }}</td>
            <td>{{ props.item.sisa_target }}</td>
            <td>{{ props.item.keterangan }}</td>
          </tr>
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
      page: 1,
      dialog: false,
      firstLoad: true,
      search: "",
      loadingBtn: false,
      isLoading: true,
      loading: false,
      dialogOverlay: false,
      table: [
        {
          text: "Desa/Kelurahan",
          value: "kelurahan",
        },
        {
          text: "Periode Laporan",
          value: "waktu",
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
        {
          value: "actions",
          sortable: false,
        },
      ],
      type: "",
      pbb: [],
      kecamatan: "",
      date_filter: "",
      date: null,
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
      if (this.date) return this.$moment(this.date).format("DD/MM/YYYY");
    },
  },
  methods: {
    openDialog() {
      if (this.kecamatan_data.id == undefined) {
        this.downloadFileAll();
      } else {
        this.downloadFile();
      }
      //   this.dialog = true;
      //   this.overlay = true;
    },
    renderData() {
      let waktu = null;
      if (this.date) {
        waktu = this.date + "-01";
      } else {
        waktu = null;
      }
      this.$http
        .get("/pbb", {
          params: {
            id_instansi: this.kecamatan.value,
            waktu,
          },
        })
        .then((response) => {
          this.pbb = response.data.data;
          this.firstLoad = false;
          this.dialog = false;
          this.dialogOverlay = false;
          this.overlay = true;
          this.isLoading = false;
        })
        .catch((error) => {
          if (error) {
            window.localStorage.clear();
            window.location.reload();
          }
        });
    },
    downloadFile() {
      this.$http
        .get("/pbb/report")
        .then((response) => {
          window.location.href = `https://api.simak.pandeglangkab.go.id/api/pbb/report?id_instansi=${this.kecamatan.id}`;

          //   console.log(response.request.responseURL);
        })
        .catch((error) => {
          this.dialog = false;
        });
    },
    downloadFileAll() {
      this.$http
        .get("/pbb/report")
        .then((response) => {
          window.location.href = `https://api.simak.pandeglangkab.go.id/api/pbb/report`;

          //   console.log(response.request.responseURL);
        })
        .catch((error) => {
          this.dialog = false;
        });
    },
    kecamatanSelected(kecamatan) {
      this.kecamatan = "";
      this.filterKecamatan = null;
      if (kecamatan) {
        this.kecamatan = kecamatan;
        this.filterKecamatan = kecamatan.id;
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
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  padding-left: 80px;
  padding-right: 50px;
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
  padding-left: 10px;
  padding-right: 10px;
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
</style>
