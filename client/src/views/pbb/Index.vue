<template>
  <div class="helper">
    <h1>Laporan Realisasi PBB</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mb-10">
        <b-col>
          <v-btn
            :to="{ path: '/pbb/create' }"
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
        <b-col>
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
    <p class="mt-10" style="font-size: 25px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block" style="margin-right: 40px"></v-divider>

    <v-row style="margin-top: 1px">
      <v-col cols="12" md="3" xl="2" lg="2" sm="10" v-if="user.role == 'Admin'">
        <KecamatanSelected
          v-model="kecamatan"
          @selected="kecamatanSelected"
          :disabled="kelurahanDisabled"
        ></KecamatanSelected>
      </v-col>
      <!-- <v-col cols="12" md="3" xl="2" lg="2" sm="10">
        <v-autocomplete
          outlined
          single-line
          style="border-radius: 10px; width: 250px; font-size: 13px"
          item-text="name"
          item-value="value"
          v-model="kelurahans"
          :items="kelurahan"
          required
          append-icon=""
          clearable
          return-object
          label="Kelurahan"
          dense
          @change="kelurahanSelected"
          :disabled="kelurahanDisabled"
          v-if="user.role == 'Admin'"
        >
        </v-autocomplete>
        <v-autocomplete
          outlined
          single-line
          style="border-radius: 10px; width: 250px; font-size: 13px"
          item-text="name"
          item-value="value"
          v-model="kelurahans"
          :items="kelurahan"
          required
          append-icon=""
          clearable
          return-object
          label="Kelurahan"
          dense
          @change="kelurahanSelected"
          v-else
        >
        </v-autocomplete>
      </v-col>-->
      <v-col cols="12" sm="12" md="2" lg="3">
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
      </v-col>
      <v-col cols="12" md="3" xl="2" lg="2" sm="10">
        <div>
          <v-dialog v-model="dialogOverlay" persistent max-width="1px">
            <div class="text-center">
              <v-overlay :value="overlay">
                <v-progress-circular color="primary" indeterminate :size="20"></v-progress-circular>
              </v-overlay>
            </div>
          </v-dialog>
        </div>
        <v-btn
          style="
            margin-top: 2px;
            bottom: 5px;
            background: #4662d4;
            color: white;
            border-radius: 30px;
            width: 200px;
            font-weight: bold;
            height: 45px;
            padding: 2px;
            font-size: 16px;
            text-transform: capitalize;
          "
          :disabled="downloadDisabled"
          @click="downloadReport"
          >Download</v-btn
        >
      </v-col>
    </v-row>
    <br />
    <div id="app">
      <v-data-table
        loading-text="Memuat Data"
        :loading="isLoading"
        :headers="table"
        :search="searchBox"
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
        <template v-slot:[`item.keterangan`]="{ item }">
          <div v-if="item.keterangan == ''">
            {{ "-" }}
          </div>
        </template>
        <template v-slot:[`item.actions`]="{ item }" v-if="this.user.role == 'User'">
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn v-bind="attrs" v-on="on" icon>
                <v-icon dark>mdi-dots-horizontal</v-icon>
              </v-btn>
            </template>
            <v-list>
              <template class="menu">
                <v-list-item link>
                  <div>
                    <v-list-item-title @click="editItem(item)">Edit</v-list-item-title>
                  </div>
                </v-list-item>
              </template>
              <v-divider style="margin-left: 10px; margin-right: 10px"></v-divider>

              <v-list-item link>Delete</v-list-item>
            </v-list>
          </v-menu>
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
      <b-modal v-model="dialog" centered no-close-on-backdrop @ok="deletePBB()">
        Apakah anda ingin menghapus data dari
        <b>{{ this.kel }}</b>
        <br />Pada Periode Laporan <b>{{ this.period }}</b
        >?
      </b-modal>
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
  import KecamatanSelected from "../../components/SelectKecamatan.vue";
  import KelurahanSelected from "../../components/SelectKelurahan.vue";

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
      openDialog(id, kelurahan, waktu) {
        this.dialog = true;
        this.idData = id;
        this.kel = kelurahan;
        this.period = this.$moment(waktu).format("MMMM - YYYY");
      },
      formatPrice(value) {
        let val = (value / 1).toFixed(0).replace(".", ",");
        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
      },
      downloadReport() {
        this.dialogOverlay = true;
        let waktu = "";
        if (this.date) {
          waktu = this.date + "-01";
        } else {
          waktu = null;
        }
        // axios({
        //   method: "GET",
        //   url: `http://localhost:8000/api/report/pbb?id_instansi=${this.user.id_instansi}&waktu=${waktu}`,
        //   config: { headers: { "Content-Type": "multipart/form-data" } },
        // })

        //DOWNLOAD USER
        if (this.user.role == "User") {
          this.$http
            .get(`/report/pbb?id_instansi=${this.user.instansi_id}&waktu=${waktu}`, {
              config: {
                headers: {
                  "Content-Type": "multipart/form-data",
                  "Access-Control-Allow-Origin": "*",
                },
              },
            })
            .then((response) => {
              this.dialogOverlay = false;
              if (response.data == "") {
                this.dialogOverlay = false;
                this.$toast.error("Mohon pilih periode yang memiliki data");
              } else {
                this.dialogOverlay = false;
                // console.log(response.config.baseURL + response.config.url);
                // window.location.href = response.config.baseURL + response.config.url;
              }
              this.dialogOverlay = false;
            })
            .catch((error) => {
              this.dialogOverlay = false;
            });
        }
        //DOWNLOAD ADMIN
        else {
          this.$http
            .get(`/report/pbb?id_instansi=${this.kecamatan.value}&waktu=${waktu}`, {
              config: {
                headers: {
                  "Content-Type": "multipart/form-data",
                  "Access-Control-Allow-Origin": "*",
                },
              },
            })
            .then((response) => {
              this.dialogOverlay = false;
              if (response.data == "") {
                this.dialogOverlay = false;
                this.$toast.error("Mohon pilih periode yang memiliki data");
              } else {
                this.dialogOverlay = false;
                // console.log(response.config.baseURL + response.config.url);
                // window.location.href = response.config.baseURL + response.config.url;
              }
              this.dialogOverlay = false;
            })
            .catch((error) => {
              this.dialogOverlay = false;
            });
        }
      },
      renderData(search) {
        this.isLoading = true;
        let waktu = "";
        if (this.date) {
          waktu = this.date + "-01";
        } else {
          waktu = null;
        }
        // UNTUK USER
        if (this.user.role == "User") {
          this.$http
            .get("/pbb", {
              params: {
                instansi_id: `${this.user.instansi_id}`,
                waktu,
                id_kelurahan: this.filterKelurahan,
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
                console.log(error);
              }
              this.isLoading = false;
            });
        }
        // UNTUK ADMIN
        else {
          this.$http
            .get("/pbb", {
              params: {
                instansi_id: this.kecamatan.value,
                waktu,
                id_kelurahan: this.filterKelurahan,
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
                console.log(error);
              }
              this.isLoading = false;
            });
        }
        if (this.user.role == "Admin") {
          this.$http;
          // .get("/kelurahan", {
          //   params: {
          //     id_instansi: this.kecamatan.value
          //   }
          // })
          // .then(response => {
          //   this.kelurahan = [];
          //   let array = response.data.data;

          //   for (let i = 0; i < array.length; i++) {
          //     this.kelurahan.push({
          //       name: array[i].kelurahan,
          //       value: array[i].id
          //     });
          //     // this.itemSelected(response.data.data)
          //   }
          // });
        } else {
          // this.$http
          //   .get("/kelurahan", {
          //     params: {
          //       id_instansi: `${this.user.id_instansi}`,
          //     },
          //   })
          //   .then((response) => {
          //     this.kelurahan = [];
          //     let array = response.data.data;
          //     for (let i = 0; i < array.length; i++) {
          //       this.kelurahan.push({
          //         name: array[i].kelurahan,
          //         value: array[i].id,
          //       });
          //       // this.itemSelected(response.data.data)
          //     }
          //   });
        }
      },

      deletePBB() {
        this.$http.delete("/pbb/" + this.idData).then((response) => {
          this.dialog = false;
          this.renderData();
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
      kelurahanSelected(kelurahan) {
        this.kecamatanDisabled = true;
        this.kelurahan = null;
        this.filterKelurahan = null;
        if (kelurahan) {
          this.kecamatanDisabled = true;
          this.kelurahan = kelurahan;
          this.filterKelurahan = kelurahan.value;
        } else {
          this.kecamatanDisabled = true;
        }
        this.renderData("");
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
          // if (this.kecamatanSelected) {
          //   console.log("Masuk guyss");
          // }
        }
        // if (this.date == "") {
        //   this.downloadDisabled = true;
        // }
        // if (date) {
        //   this.date_filter = false;
        //   this.downloadDisabled = false;
        // }
        // if (date == null) {
        //   this.downloadDisabled = true;
        // }
        // this.renderData("");
      },
      // kelurahanSelected(kelurahan) {
      //   this.kelurahan = "";
      //   this.filterKelurahan = null;
      //   if (kelurahan) {
      //     this.kelurahan = kelurahan;
      //     this.filterKelurahan = kelurahan.id;
      //   }
      //   this.renderData();
      // },
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
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
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
  .mobile {
    color: #333;
  }

  @media screen and (max-width: 768px) {
    .mobile table.v-table tr {
      max-width: 100%;
      position: relative;
      display: block;
    }

    .mobile table.v-table tr:nth-child(odd) {
      border-left: 6px solid deeppink;
    }

    .mobile table.v-table tr:nth-child(even) {
      border-left: 6px solid cyan;
    }

    .mobile table.v-table tr td {
      display: flex;
      width: 100%;
      border-bottom: 1px solid #f5f5f5;
      height: auto;
      padding: 10px;
    }

    .mobile table.v-table tr td ul li:before {
      content: attr(data-label);
      padding-right: 0.5em;
      text-align: left;
      display: block;
      color: #999;
    }
    .v-datatable__actions__select {
      width: 50%;
      margin: 0px;
      justify-content: flex-start;
    }
    .mobile .theme--light.v-table tbody tr:hover:not(.v-datatable__expand-row) {
      background: transparent;
    }
  }
  .flex-content {
    padding: 0;
    margin: 0;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    width: 100%;
  }

  .flex-item {
    padding: 5px;
    width: 50%;
    height: 60px;
  }
</style>
