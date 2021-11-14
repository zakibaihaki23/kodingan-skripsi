<template>
  <div class="helper">
    <h1>REPORT ADMIN</h1>

    <p
      class="d-flex d-none d-sm-block"
      style="font-size: 20px; margin-top: 20px; margin-bottom: 30px"
    >
      Find your document below
    </p>
    <v-divider
      class="d-flex d-none d-sm-block"
      style="margin-right: 40px"
    ></v-divider>
    <v-col md="12"> </v-col>
    <v-row class="mb-6" style="margin-top: 1px">
      <v-col cols="10" md="4" lg="3" xl="2" sm="6">
        <v-select
          label="Kecamatan"
          single-line
          outlined
          clearable
          class="form"
          item-text="name"
          item-value="id"
          v-model="kelurahan_id"
          :items="kelurahan"
          return-object
        >
        </v-select>
      </v-col>

      <v-col cols="2" sm="6" md="6" lg="7" xl="2"> </v-col>
      <v-col cols="2" sm="6" md="6" lg="7" xl="2"> </v-col>
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
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      dialog: false,
      kelurahan: [],
      kelurahan_id: "",
      page: 1,
      dateFormatted: "",
      btnLoading: false,
      dateDisabled: true,
      downloadDisabled: true,
      areaId: null,
      area: "",
      search: "",
      group_id: "",
      archived: null,
    };
  },

  created() {
    this.renderData("");
  },

  watch: {
    warehouse: {
      handler: function (val) {
        this.renderData("", val);
      },
      deep: true,
    },
    overlay(val) {
      val &&
        setTimeout(() => {
          this.overlay = false;
        }, 1000);
    },
    date(val) {
      this.dateFormatted = this.formatDate(this.date);
    },
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
  methods: {
    openDialog() {
      if (this.kelurahan_id.id == undefined) {
        this.downloadFileAll();
      } else {
        this.downloadFile();
      }
      //   this.dialog = true;
      //   this.overlay = true;
    },

    renderData() {
      this.$http.get(`/kecamatan`, {}).then((response) => {
        this.kelurahan = [];
        let array = response.data.data;

        for (let i = 2; i < array.length; i++) {
          this.kelurahan.push({
            name: array[i].instansi,
            id: array[i].id,
          });
          // this.itemSelected(response.data.data)
        }
      });
    },
    downloadFile() {
      this.$http
        .get("/pbb/report")
        .then((response) => {
          window.location.href = `https://api.simak.pandeglangkab.go.id/api/pbb/report?id_instansi=${this.kelurahan_id.id}`;

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
  },
};
</script>

<style scoped>
.mytable table tr {
  border: none;
}
.helper {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  padding-left: 80px;
  padding-right: 50px;
}
/* .v-btn:not(.v-btn--round).v-size--default {
    position: absolute;
    width: 200px;
    height: 50px;
    background: #4662d4;
    color: white;
    border-radius: 30px;
    font-size: 16px;
    font-weight: bold;
    margin-top: 50px;
    text-transform: capitalize;
    cursor: pointer;
    padding: 5px;
  } */
.search {
  padding-left: 100px;
  padding-right: 50px;

  margin-top: 50px;
}
thead {
  border-radius: 60px;
}
/* .mytable .v-table tbody tr:not(:last-child) {
    border-bottom: none;
    background: brown;
  } */
.v-data-table-header thead {
  background: red;
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
.gbr {
  position: absolute;
}
</style>
