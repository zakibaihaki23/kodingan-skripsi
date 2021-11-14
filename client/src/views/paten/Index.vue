<template>
  <div id="app">
    <ejs-grid
      ref="grid"
      :dataSource="pbb"
      :pageSettings="pageSettings"
      :allowPaging="true"
    >
      <e-columns>
        <e-column
          field="kelurahan"
          headerText="Product ID"
          textAlign="left"
          format="yMed"
        ></e-column>
        <e-column field="waktu" headerText="Product Name"></e-column>
        <e-column
          field="QuantityPerUnit"
          headerText="Quantity per unit"
          textAlign="Right"
        ></e-column>
        <e-column
          field="UnitsInStock"
          headerText="Units In Stock"
          textAlign="Right"
        ></e-column>
      </e-columns>
    </ejs-grid>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { GridPlugin, Page, Toolbar } from "@syncfusion/ej2-vue-grids";
import { mapGetters } from "vuex";

Vue.use(GridPlugin);

export default {
  data() {
    return {
      pageSettings: { pageSize: 6 },
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

      dataTable: [],
      warehouse: null,
      warehouse_id: "",
      type: "",
      status: null,
      filterActive: null,
      warehouseList: [],
      kecamatan: [],
      pbb: [],
    };
  },
  watch: {
    search: {
      handler: function (val) {
        this.renderData(val);
      },
      deep: true,
    },
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
  provide: {
    grid: [Page, Toolbar],
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
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    openDialog(id) {
      this.dialog = true;
      this.idPBB = id;
      this.text = "Hapus";
    },
    renderData(search) {
      let waktu = "";
      if (this.date != "") {
        waktu = this.date + "-01";
      } else {
        waktu = "";
      }
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
          if (error.response.status === 401) {
            window.localStorage.clear();
            window.location.reload();
          }
        });
    },

    deletePBB(id) {
      this.$http.delete("/pbb/" + id).then((response) => {
        this.dialog = false;
        this.renderData();
      });
    },

    onResize() {
      if (window.innerWidth < 769) this.isMobile = true;
      else this.isMobile = false;
    },
  },
};
</script>

<style scoped>
@import url("https://cdn.syncfusion.com/ej2/material.css");
</style>

