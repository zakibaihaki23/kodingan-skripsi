<template>
  <div class="helper" v-if="this.user.role == 'Admin'">
    <h1>Kelola User</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row class="mb-10">
        <b-col>
          <v-btn
            :to="{ path: '/user/create' }"
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
      </b-row>
    </v-container>
    <p class="mt-10" style="font-size: 25px">Filter</p>
    <v-divider class="d-flex d-none d-sm-block" style="margin-right: 40px"></v-divider>
    <br />
    <div id="app">
      <v-data-table :headers="table" :items="userTable" class="elevation-1">
        <!-- <template v-slot:item="props"> -->
        <template>
          <!-- <tr v-if="!isMobile"> -->
          <tr>
            <!-- <td>{{ props.item.kelurahan }}</td>
              <td>{{ props.item.waktu | moment("MMM - YYYY") }}</td>
              <td>Rp. {{ formatPrice(props.item.target_pbb) }}</td>
              <td>Rp. {{ formatPrice(props.item.realisasi_bln_lalu) }}</td>
              <td>Rp. {{ formatPrice(props.item.realisasi_bln_ini) }}</td>
              <td>{{ props.item.jmlh_realisasi }}</td>
              <td>Rp. {{ formatPrice(props.item.sisa_target) }}</td>
            <td>{{ props.item.keterangan }}</td>-->
            <!-- <td>
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
                      @click="openDialog(props.item.id, props.item.kelurahan, props.item.waktu)"
                    >Delete</v-list-item>
                  </v-list>
                </v-menu>
            </td>-->
          </tr>
          <!-- <tr v-else>
              <td>
                <ul class="flex-content">
                  <li class="flex-item" data-label="Kelurahan">{{ props.item.kelurahan }}</li>
                  <li
                    class="flex-item"
                    data-label="Periode"
                  >{{ props.item.waktu | moment("MMM - YYYY") }}</li>
                  <li
                    class="flex-item"
                    data-label="Target PBB"
                  >Rp. {{ formatPrice(props.item.target_pbb) }}</li>
                  <li
                    class="flex-item"
                    data-label="Tealisasi Bulan Lalu"
                  >Rp. {{ formatPrice(props.item.realisasi_bln_lalu) }}</li>
                  <li
                    class="flex-item"
                    data-label="Realisasi Bulan Ini"
                  >Rp. {{ formatPrice(props.item.realisasi_bln_ini) }}</li>
                  <li
                    class="flex-item"
                    data-label="Jumlah Realisasi"
                  >{{ props.item.jmlh_realisasi }}</li>
                  <li
                    class="flex-item"
                    data-label="Sisa Target"
                  >Rp. {{ formatPrice(props.item.sisa_target) }}</li>
                  <li class="flex-item" data-label="Keterangan">{{ props.item.keterangan }}</li>
                </ul>
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
                      @click="openDialog(props.item.id, props.item.kelurahan, props.item.waktu)"
                    >Delete</v-list-item>
                  </v-list>
                </v-menu>
              </td>
          </tr>-->
        </template>
      </v-data-table>
      <!-- <b-modal v-model="dialog" centered no-close-on-backdrop @ok="deletePBB()">
        Apakah anda ingin menghapus data dari
        <b>{{ this.kel }}</b>
        <br />Pada Periode Laporan
        <b>{{ this.period }}</b>?
      </b-modal>-->
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";

  export default {
    data() {
      return {
        userTable: [],
        search: "",
        table: [
          {
            text: "Nama",
            value: "name",
          },
          {
            text: "Username",
            value: "username",
          },
          {
            text: "Email",
            value: "email",
          },
          {
            text: "Role",
            value: "role",
          },
          {
            text: "Kecamatan",
            value: "nama_instansi",
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
      if (this.user.role != "Admin") {
        this.$router.push("/dashboard");
      }
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
    },
    methods: {
      renderData(search) {
        this.$http
          .get("/user")
          .then((response) => {
            this.userTable = response.data.data;
            //   console.log(this.userTable);
          })
          .catch((error) => {
            //   this.dialogOverlay = false;
          });
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
