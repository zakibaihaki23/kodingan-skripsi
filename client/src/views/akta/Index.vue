<template>
  <v-card>
    <v-card-title>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="pbb"
      :items-per-page="5"
      class="elevation-1"
    >
    </v-data-table>
  </v-card>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      search: "",
      pbb: [],
      headers: [
        {
          text: "Kelurahan",
          align: "start",
          sortable: false,
          value: "kelurahan",
        },
        { text: "PEriode", value: "waktu" },
        { text: "Realisasi Bulan Lalu", value: "realisasi_bln_lalu" },
        { text: "Realisasi Bulan Ini", value: "realisasi_bln_ini" },
        { text: "Sisa Target", value: "sisa_target" },
      ],
    };
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
  created() {
    this.renderData();
  },
  methods: {
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    renderData(search) {
      this.isLoading = true;
      let waktu = "";
      if (this.date) {
        waktu = this.date + "-01";
      } else {
        waktu = null;
      }
      if (this.user.role == "User") {
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.user.id_instansi}`,
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
            this.isLoading = false;
          });
      } else {
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
            this.isLoading = false;
          });
      }
    },
  },
};
</script>
