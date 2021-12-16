<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px" v-if="this.user.role == 'Admin'">
    <h1>Kelola Informasi</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mb-10">
        <b-col lg="6">
          <v-btn
            :to="{ path: '/informasi/add' }"
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
            <span>Cari Data</span>
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
          <v-date-picker locale="id" v-model="date" no-title scrollable>
            <v-spacer></v-spacer>
            <v-btn text color="primary" @click="date_filter = false">Cancel</v-btn>
            <v-btn text color="primary" @click="(date_filter = false), renderData(search)"
              >OK</v-btn
            >
          </v-date-picker>
        </v-menu>
      </b-col>
    </b-row>
    <v-skeleton-loader
      v-if="firstLoad"
      :loading="isLoading"
      type="table-tbody"
      :types="{ 'table-row': 'table-cell@8' }"
    ></v-skeleton-loader>
    <v-data-table
      v-show="!firstLoad"
      :loading="isLoading"
      :search="search"
      :headers="table"
      :items="informasi"
      class="elevation-1"
    >
      <template v-slot:[`item.nama_instansi`]="{ item }">
        <span v-if="item.nama_instansi == null">Semua Kecamatan</span>
        <span v-else>{{ item.nama_instansi }}</span>
      </template>
      <template v-slot:[`item.waktu`]="{ item }">
        {{ item.waktu | moment("DD - MMMM - YYYY") }}
      </template>
    </v-data-table>
    <!-- <b-modal v-model="dialog" centered no-close-on-backdrop @ok="deletePBB()">
        Apakah anda ingin menghapus data dari
        <b>{{ this.kel }}</b>
        <br />Pada Periode Laporan
        <b>{{ this.period }}</b>?
      </b-modal>-->
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import KecamatanSelected from "../../components/SelectKecamatanInformasi.vue";

  export default {
    components: { KecamatanSelected },
    data() {
      return {
        informasi: [],
        search: "",
        date_filter: "",
        date: "",
        firstLoad: true,
        isLoading: true,
        kecamatan: [],
        table: [
          {
            text: "Kecamatan",
            value: "nama_instansi",
          },
          {
            text: "Informasi",
            value: "informasi",
          },
          {
            text: "Waktu",
            value: "waktu",
          },
          {
            value: "actions",
            sortable: false,
          },
        ],
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
        if (this.date) return this.$moment(this.date).format("DD - MMMM - YYYY");
      },
    },
    methods: {
      renderData(search) {
        this.firstLoad = true;

        let waktu = "";
        if (this.date) {
          waktu = this.date;
        } else {
          waktu = null;
        }

        this.$http
          .get("/informasi/all", {
            params: {
              instansi_id: this.kecamatan.value,
              waktu,
            },
          })
          .then((response) => {
            this.informasi = response.data.data;
            this.firstLoad = false;
            this.isLoading = false;
            //   console.log(this.informasi);
          })
          .catch((error) => {
            //   this.dialogOverlay = false;
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
    },
  };
</script>

<style scoped lang="scss">
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    padding-left: 80px;
    padding-right: 50px;
  }
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
