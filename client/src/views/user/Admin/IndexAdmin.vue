<template>
  <div
    id="app"
    style="margin-left: 25px; margin-right: 25px"
    v-if="this.user.role == 'Admin'"
  >
    <!-- FOR ALL DEVICE -->
    <v-container>
      <b-row>
        <b-col>
          <div style="margin: 0px; padding: 0px">
            <h4>Kelola User</h4>
          </div>
        </b-col>
        <b-col class="text-right" style="margin: 0px; padding: 0px">
          <v-btn
            large
            depressed
            v-show="!firstLoad"
            :to="{ path: '/user/create' }"
            style="
              background: #4662d4;
              color: white;
              border-radius: 30px;
              text-transform: capitalize;
              cursor: pointer;
            "
            >Input Data
            <v-icon right>mdi-plus-circle</v-icon>
          </v-btn>
        </b-col>
      </b-row>
    </v-container>
    <v-divider class="d-flex d-none d-sm-block" style="margin-right: 40px"></v-divider>
    <br />
    <b-row style="margin-top: 1px">
      <b-col cols="12" lg="3">
        <KecamatanSelected
          v-show="!firstLoad"
          v-model="kecamatan"
          @selected="kecamatanSelected"
        ></KecamatanSelected>
      </b-col>
      <b-col cols="12" lg="4">
        <div>
          <v-autocomplete
            v-show="!firstLoad"
            outlined
            single-line
            style="border-radius: 10px; font-size: 13px; width: 250px"
            item-text="name"
            item-value="name"
            v-model="role"
            :items="roles"
            required
            append-icon=""
            clearable
            return-object
            label="Role"
            dense
            @input="roleSelected"
          >
          </v-autocomplete>
        </div>
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
      :items="userTable"
      class="elevation-1"
    >
      <template v-slot:[`item.role`]="{ item }">
        <div v-if="item.role == 'User'">Admin Kecamatan</div>
        <div v-else>{{ item.role }}</div>
      </template>
      <template v-slot:[`item.actions`]="{ item }">
        <v-menu offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn v-bind="attrs" v-on="on" icon>
              <v-icon dark>mdi-dots-horizontal</v-icon>
            </v-btn>
          </template>
          <v-list>
            <template class="menu">
              <v-list-item
                :to="{
                  path: `/user/update/${item.id}`,
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
      Apakah anda ingin menghapus data user berikut:
      <div class="row">
        <div class="col mx-auto">
          <div class="form-group row">
            <div class="col-md-3">Nama</div>
            <div class="col-md-6" style="font-weight: bold">{{ this.nama }}</div>
          </div>
          <div class="form-group row">
            <div class="col-md-3">Username</div>
            <div class="col-md-6" style="font-weight: bold">{{ this.username }}</div>
          </div>
          <div class="form-group row">
            <div class="col-md-3">E-mail</div>
            <div class="col-md-6" style="font-weight: bold">{{ this.email }}</div>
          </div>
          <div class="form-group row">
            <div class="col-md-3">Role</div>
            <div class="col-md-6" style="font-weight: bold">{{ this.role }}</div>
          </div>
          <div class="form-group row">
            <div class="col-md-3">Kecamatan</div>
            <div class="col-md-6" style="font-weight: bold">{{ this.kecamatan }}</div>
          </div>
        </div>
      </div>
    </b-modal>
    <v-dialog v-model="dialogOverlay" persistent max-width="300">
      <div>
        <v-card color="primary" dark class="text-center">
          <v-card-text>
            Mohon tunggu sebentar......
            <v-progress-linear
              indeterminate
              color="white"
              class="mb-0"
            ></v-progress-linear>
          </v-card-text>
        </v-card>
      </div>
    </v-dialog>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import KecamatanSelected from "../../../components/SelectKecamatan.vue";

export default {
  components: { KecamatanSelected },
  data() {
    return {
      dialog: false,
      userTable: [],
      firstLoad: true,
      overlay: false,
      isLoading: true,
      dialogOverlay: false,
      idData: "",
      nama: "",
      username: "",
      email: "",
      role: "",
      kecamatan: "",
      search: "",
      kecamatan: [],
      filterRole: "",
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
      roles: [
        {
          name: "Admin Kecamatan",
          value: "User",
        },
        {
          name: "Camat",
          value: "Camat",
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
  },
  methods: {
    renderData(search) {
      this.isLoading = true;
      this.$http
        .get("/user", {
          params: {
            instansi_id: this.kecamatan.value,
            role: this.role.value,
          },
        })
        .then((response) => {
          this.userTable = response.data.data;
          this.firstLoad = false;
          this.isLoading = false;
        })
        .catch((error) => {
          //   this.dialogOverlay = false;
        });
    },
    hapusDialog(item) {
      this.dialog = true;
      this.idData = item.id;
      this.nama = item.name;
      this.username = item.username;
      this.email = item.email;
      this.role = item.role;
      this.kecamatan = item.nama_instansi;
    },
    hapusData(idData) {
      this.dialogOverlay = true;
      this.firstLoad = true;
      this.$http
        .delete("/user/" + idData)
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialog = false;
            self.renderData();
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Dihapus");
            self.isLoading = false;
          });
        })
        .catch((error) => {
          this.dialogOverlay = false;
        });
    },
    kecamatanSelected(kecamatan) {
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
    roleSelected(role) {
      this.role = "";
      if (role) {
        this.role = role;
      }
      this.renderData();
    },
  },
};
</script>

<style scoped lang="scss">
.helper {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
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
