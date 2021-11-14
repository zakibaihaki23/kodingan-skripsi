<template>
  <div class="helper">
    <h1>Kelola User</h1>
    <!-- FOR ALL DEVICE -->
    <v-container>
      <v-row>
        <v-col cols="3" sm="6" md="6" lg="7">
          <div class="d-flex d-none d-sm-block">
            <v-btn
              :to="{ path: '/user/tambah' }"
              style="
                position: absolute;
                width: 200px;
                height: 50px;
                background: #4662d4;
                color: white;
                border-radius: 30px;
                font-size: 16px;
                margin-top: 50px;
                font-weight: bold;
                text-transform: capitalize;
                cursor: pointer;
                padding: 5px;
              "
              >Tambah User</v-btn
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
    <v-row style="margin-top: 1px">
      <v-col xl="2" md="2" sm="6" cols="12" lg="2"> </v-col>
      <v-col xl="10" md="10" sm="6" cols="12" lg="10"> </v-col>
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
        :items="dataTable"
        :page.sync="page"
        :items-per-page="10"
        :search="search"
        @page-count="pageCount = $event"
        :loading="isLoading"
        mobile-breakpoint="0"
      >
        <template v-slot:item="props">
          <tr>
            <td>{{ props.item.name }}</td>
            <td>{{ props.item.username }}</td>
            <td>{{ props.item.email }}</td>
            <td>{{ props.item.instansi }}</td>
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
                      :to="{
                        path: `/helper/update-helper/${props.item.id}`,
                      }"
                      link
                      style="width: 150px"
                    >
                      <div>
                        <v-list-item-title>Update</v-list-item-title>
                      </div>
                    </v-list-item>
                  </template>
                  <v-divider
                    style="margin-left: 10px; margin-right: 10px"
                  ></v-divider>
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
            >Are you sure to change this status to<br />
            <b>A</b> ?</v-card-text
          >
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
              <v-col xl="5" cols="6" md="6" sm="6" lg="6"> </v-col>
            </v-row>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
  </div>
</template>

<script>
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
      table: [
        {
          text: "Nama",
          value: "Name",
          class: "black--text title",
        },
        {
          text: "Username",
          value: "username",
          class: "black--text title",
        },
        {
          text: "E-Mail",
          value: "email",
          class: "black--text title",
        },
        {
          text: "Kecamatan",
          value: "instansi",
          class: "black--text title",
        },
        {
          value: "actions",
          class: "black--text title",
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
  methods: {
    //get data user dari API
    renderData() {
      this.isLoading = true;
      this.firstLoad = true;

      this.$http
        .get("/user")
        .then((response) => {
          this.dataTable = response.data.data;
          this.firstLoad = false;

          // this.overlay = true
          this.isLoading = false;

          if (this.dataTable === null) {
            this.dataTable = [];
          }
          // setTimeout(() => {
          //   if (this.firstLoad) this.firstLoad = false
          //   this.isLoading = false
          // }, 1000)
        })
        .catch((error) => {});
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
</style>
