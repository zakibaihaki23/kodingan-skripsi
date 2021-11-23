<template>
  <div>
    <div>
      <b-row>
        <b-col>
          <b-skeleton-wrapper :loading="loading">
            <template #loading>
              <b-skeleton></b-skeleton>
            </template>
            <b-card
              border-variant="primary"
              header="Total Kelurahan"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-card-text>{{ this.kelurahan }} Kelurahan</b-card-text>
            </b-card>
          </b-skeleton-wrapper>
        </b-col>
        <b-col>
          <b-skeleton-wrapper :loading="loading">
            <template #loading>
              <b-skeleton></b-skeleton>
            </template>
            <b-card
              border-variant="primary"
              header="Total Data yang belum divalidasi"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-card-text>{{ this.kelurahan }} Data</b-card-text>
            </b-card>
          </b-skeleton-wrapper>
        </b-col>
      </b-row>
    </div>
    <!-- <v-row no-gutters style="margin-top: 30px">
      <v-col cols="12" sm="3" md="3" lg="3">
        <v-card class="text-center" color="blue" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Kelurahan di {{ this.user.instansi }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.kelurahan }} Kelurahan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3" md="3" lg="3">
        <v-card class="text-center" color="aqua" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Laporan PBB Bulan {{ this.sekarang }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.total_pbb }} Laporan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3" md="3" lg="3">
        <v-card class="text-center" color="cyan" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Laporan PATEN Bulan {{ this.sekarang }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.total_pbb }} Laporan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3" md="3" lg="3">
        <v-card class="text-center" color="deep-purple" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Laporan Kependudukan Bulan {{ this.sekarang }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.total_pbb }} Laporan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3" md="3" lg="3" style="margin-top: 30px">
        <v-card class="text-center" color="teal" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Laporan Akta Bulan {{ this.sekarang }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.total_pbb }} Laporan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3" md="3" lg="3" style="margin-top: 30px">
        <v-card class="text-center" color="light-green" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Laporan PATEN Bulan {{ this.sekarang }}</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.total_pbb }} Laporan</div>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row> -->
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  export default {
    data() {
      return {
        pbb: [],
        total_pbb: "",
        kelurahan: "",
        sekarang: "",
        waktu_lama: "",
        interval: null,
        waktu: new Date().toISOString().substr(0, 7) + "-01",
        loading: false,
      };
    },
    destroyed() {
      clearInterval(this.interval);
    },
    created() {
      this.renderData();
      this.getDate();
    },
    computed: {
      ...mapGetters({
        user: "auth/user",
      }),
    },
    methods: {
      getDate() {
        this.waktu_lama = new Date();
        this.interval = setInterval(() => {
          this.sekarang = this.$moment(this.waktu_lama).endOf("day").format("MMMM");
        });
      },
      renderData() {
        this.loading = true;
        //GET DATA FOR TOTAL
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.user.id_instansi}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.pbb = response.data.data;
            this.total_pbb = response.data.total;
            this.firstLoad = false;
            this.dialog = false;
            this.dialogOverlay = false;
            this.overlay = true;
            this.loading = false;
          })
          .catch((error) => {
            if (error) {
              window.localStorage.clear();
              window.location.reload();
            }
            this.loading = false;
          });

        //GET DATA TOTAL KELURAHAN
        this.$http
          .get("/kelurahan", {
            params: {
              id_instansi: `${this.user.id_instansi}`,
            },
          })
          .then((response) => {
            this.kelurahan = response.data.total;
            this.firstLoad = false;
            this.dialog = false;
            this.dialogOverlay = false;
            this.overlay = true;
            this.loading = false;
          })
          .catch((error) => {
            if (error) {
              window.localStorage.clear();
              window.location.reload();
            }
            this.loading = false;
          });
      },
    },
  };
</script>
