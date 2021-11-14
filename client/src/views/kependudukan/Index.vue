<template>
  <div class="helper">
    <h1>Laporan Kependudukan</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <v-row>
        <v-col cols="3" sm="6" md="6" lg="7">
          <div class="d-flex d-none d-sm-block">
            <v-btn
              :to="{ path: '/helper/create-helper' }"
              style="
                position: absolute;
                width: 200px;
                height: 50px;
                background: #4662d4;
                color: white;
                border-radius: 30px;
                font-size: 16px;
                margin-top: 10px;
                font-weight: bold;
                text-transform: capitalize;
                cursor: pointer;
                padding: 5px;
              "
              >Input Data</v-btn
            >
          </div>
        </v-col>
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
    <!-- <v-row style="margin-top: 1px">
      <v-col xl="2" md="2" sm="6" cols="12" lg="2">
        <SelectStatus
          v-bind="attrs"
          v-on="on"
          v-model="status"
          @selected="statusSelected"
        >
        </SelectStatus>
      </v-col>
      <v-col xl="10" md="10" sm="6" cols="12" lg="10">
        <SelectWarehouse v-model="warehouse" @selected="warehouseSelected">
        </SelectWarehouse>
      </v-col>
    </v-row> -->
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
        dense
        :page.sync="page"
        :items-per-page="10"
        :search="search"
        @page-count="pageCount = $event"
        :loading="isLoading"
        mobile-breakpoint="0"
        class="elevation-1"
        fixed-header
      >
        <template v-slot:header="props">
          <thead>
            <td colspan="2">{{ props.props.headers.text }}</td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Jumlah Penduduk Awal Bulan Lalu
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Lahir
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Meninggal
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Datang
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Pindah
            </td>
            <td
              colspan="3"
              style="font-weight: bold; font-size: 15px; text-align: center"
              class="card card-1"
            >
              Jumlah Penduduk Bulan Ini
            </td>
          </thead>
        </template>
        <template v-slot:item="props">
          <tr>
            <td>{{ props.item.kelurahan }}</td>
            <td style="text-align: center">
              {{ props.item.waktu | moment("MMM - YYYY") }}
            </td>
            <td style="text-align: center">
              {{ props.item.jmlh_penduduk_bln_lalu_l }}
            </td>
            <td style="text-align: center">
              {{ props.item.jmlh_penduduk_bln_lalu_p }}
            </td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_penduduk_bln_lalu }}
            </td>
            <td style="text-align: center">{{ props.item.lahir_l }}</td>
            <td style="text-align: center">{{ props.item.lahir_p }}</td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_lahir }}
            </td>
            <td style="text-align: center">
              {{ props.item.meninggal_l }}
            </td>
            <td style="text-align: center">{{ props.item.meninggal_p }}</td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_meninggal }}
            </td>
            <td style="text-align: center">
              {{ props.item.datang_l }}
            </td>
            <td style="text-align: center">{{ props.item.datang_p }}</td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_datang }}
            </td>
            <td style="text-align: center">{{ props.item.pindah_l }}</td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.pindah_p }}
            </td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_pindah }}
            </td>
            <td style="text-align: center">
              {{ props.item.jmlh_penduduk_bln_ini_l }}
            </td>
            <td style="text-align: center">
              {{ props.item.jmlh_penduduk_bln_ini_p }}
            </td>
            <td style="text-align: center; font-weight: bold">
              {{ props.item.total_penduduk_bln_ini }}
            </td>
            <td>
              <v-menu offset-y>
                <template v-slot:activator="{ on, attrs }">
                  <v-btn v-bind="attrs" v-on="on" icon>
                    <v-icon dark> mdi-dots-horizontal </v-icon>
                  </v-btn>
                </template>
                <v-list>
                  <template class="menu">
                    <v-list-item
                      :to="{ path: `/packing-order/${props.item.id_pbb}` }"
                      link
                    >
                      <div>
                        <v-list-item-title>Detail</v-list-item-title>
                      </div>
                    </v-list-item>
                  </template>
                  <v-divider
                    style="margin-left: 10px; margin-right: 10px"
                  ></v-divider>

                  <v-list-item link @click="openDialog(props.item.id_pbb)">
                    Delete
                  </v-list-item>
                </v-list>
              </v-menu>
            </td>
          </tr>
        </template>
      </v-data-table>
      <v-dialog v-model="dialog" persistent max-width="360px">
        <v-card style="height: 200px">
          <v-card-title class="headline"> </v-card-title>
          <v-card-text
            style="font-size: 16px; margin-top: 10px"
            class="text-center"
            >Apa ada yakin ingin <b>{{ "text" }}</b> data ini?
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
                  @click="deletePBB(idPBB)"
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
      </v-dialog>
    </div>
    <!-- <v-dialog v-model="dialogOverlay" persistent max-width="1px">
      <div class="text-center">
        <v-overlay :value="overlay">
          <v-progress-circular
            color="primary"
            indeterminate
            :size="20"
          ></v-progress-circular>
        </v-overlay>
      </div>
    </v-dialog> -->
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
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
          value: "waktu",
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
      pbb: [],
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
  },
  methods: {
    openDialog(id) {
      this.dialog = true;
      this.idPBB = id;
      this.text = "Hapus";
    },
    renderData() {
      this.$http
        .get(`/kependudukan`, {
          params: {
            id_instansi: this.user.id_instansi,
          },
        })
        .then((response) => {
          this.kependudukan = response.data.data;
          this.firstLoad = false;
          this.isLoading = false;
        });
    },
    deletePBB(id) {
      this.$http.delete("/pbb/" + id).then((response) => {
        this.dialog = false;
        this.renderData();
      });
    },
    // openDialog(status, id) {
    //   this.dialog = true
    //   this.idUser = id
    //   this.statusUser = status
    //   if (status == 1) {
    //     this.text = 'Inactive'
    //   } else {
    //     this.text = 'Active'
    //   }
    // },
    //get data user dari API
    // renderData() {
    //   this.dialogOverlay = true
    //   this.isLoading = true
    //   this.firstLoad = true
    //   let isActive = ''
    //   if (this.filterActive || this.filterActive == 0) {
    //     isActive = 'user.is_active:' + this.filterActive
    //   } else {
    //     isActive = ''
    //   }

    //   let warehouseId = ''
    //   if (this.warehouse_id) {
    //     if (this.filterActive != null) {
    //       warehouseId = '|warehouse_id.e:' + this.warehouse_id
    //     } else {
    //       warehouseId = 'warehouse_id.e:' + this.warehouse_id
    //     }
    //   } else {
    //     warehouseId = ''
    //   }

    //   this.$http
    //     .get('/helper', {
    //       params: {
    //         embeds: 'user_id,helper_type_id,warehouse_id',
    //         conditions: isActive + warehouseId,
    //         orderby: '-id',
    //       },
    //     })
    //     .then((response) => {
    //       this.dataTable = response.data.data
    //       this.firstLoad = false
    //       this.dialog = false
    //       this.dialogOverlay = false
    //       // this.overlay = true
    //       this.isLoading = false

    //       if (this.dataTable === null) {
    //         this.dataTable = []
    //       }
    //   // setTimeout(() => {
    //   //   if (this.firstLoad) this.firstLoad = false
    //   //   this.isLoading = false
    //   // }, 1000)
    //     })
    //     .catch((error)=> {
    //       this.dialogOverlay = false
    //     })
    // },

    //fungsi untuk unarchive
    // archive(id) {
    //   this.firstLoad = true
    //   this.isLoading = true
    //   this.dialog = true
    //   this.dialogOverlay = true
    //   // this.isLoading = true
    //   this.$http
    //     .put('/helper/' + id + '/archive', {})
    //     .then((response) => {
    //       let self = this
    //         this.dialog = false
    //       setTimeout(function() {
    //         self.renderData()
    //         self.dialogOverlay = false
    //         self.$toast.success('User Not Active')
    //         self.loadingBtn = false
    //         self.renderData()
    //       }, 1000)
    //     })
    //     .catch((error) => {
    //       this.dialog = false
    //       this.$toast.error(error.response.data.errors.id)
    //       this.firstLoad = false
    //       this.isLoading = false
    //       this.dialogOverlay = false
    //     })
    //   setTimeout(() => {
    //     if (this.firstLoad) this.firstLoad = false
    //     this.isLoading = false
    //   }, 1000)
    // },

    //fungsi untuk archive
    // unarchive(id) {
    //   this.isLoading = true
    //   this.firstLoad = true
    //   this.dialog = true
    //   // this.firstLoad = true
    //   this.dialogOverlay = true
    //   // this.isLoading = true
    //   this.$http
    //     .put('/helper/' + id + '/unarchive', {})
    //     .then((response) => {
    //       this.dialog = false
    //       let self = this
    //       setTimeout(function() {
    //         self.renderData()
    //         self.dialogOverlay = false
    //         self.$toast.success('User Active')
    //         self.renderData()
    //       }, 1000)
    //     })
    //     .catch((error) => {
    //       this.dialog = false
    //       this.dialogOverlay = false
    //     })
    //   setTimeout(() => {
    //     if (this.firstLoad) this.firstLoad = false
    //     this.isLoading = false
    //   }, 1000)
    // },

    // warehouseSelected(warehouse) {
    //   this.warehouse = ''
    //   this.warehouse_id = ''
    //   if (warehouse) {
    //     this.warehouse = warehouse
    //     this.warehouse_id = warehouse.value
    //   }
    //   this.renderData()
    // },
    // statusSelected(status) {
    //   this.status = ''
    //   this.filterActive = null
    //   if (status) {
    //     this.status = status
    //     this.filterActive = status.value
    //   }
    //   this.renderData()
    // },
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
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

// .card-1:hover {
//   box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
// }
</style>
