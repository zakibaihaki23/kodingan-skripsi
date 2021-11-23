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
              header="Total Kecamatan"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-card-text>{{ this.instansi }} Kecamatan</b-card-text>
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
              header="Total User"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-card-text>{{ this.user }} User</b-card-text>
            </b-card>
          </b-skeleton-wrapper>
        </b-col>
      </b-row>
    </div>
    <!-- KOLOM DETAIL TOTAL -->
    <!-- <v-row no-gutters style="margin-top: 30px">
      <v-col cols="10" sm="3" md="3" lg="2" style="margin-left: 5px">
        <v-card class="text-center" color="blue" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Kecamatan</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.instansi }} Kecamatan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="10" sm="3" md="3" lg="2" style="margin-left: 5px">
        <v-card class="text-center" color="aqua" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Kelurahan</div>
          </v-card-text>
          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.kelurahan }} Kelurahan</div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="10" sm="3" md="3" lg="3" style="margin-left: 5px">
        <v-card class="text-center" color="cyan" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total User</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">{{ this.user }} User</div>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row> -->
    <l-map style="height: 500px; width: 100%; margin-top: 20px" :zoom="zoom" :center="center">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
      <TooltipMap> </TooltipMap>
    </l-map>
  </div>
</template>

<script>
  import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";
  import TooltipMap from "../../components/TootipMap.vue";

  export default {
    components: {
      LMap,
      LTileLayer,
      LMarker,
      LPopup,
      TooltipMap,
    },
    data() {
      return {
        url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        attribution:
          '&copy; <a target="_blank" href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        zoom: 10,
        center: [-6.513, 105.8228],
        withPopup: [-6.30958, 106.10726],
        pbb: [],
        total: [],
        kecamatan: [],
        sekarang: "",
        waktu_lama: "",
        interval: null,
        waktu: new Date().toISOString().substr(0, 7) + "-01",
        kelurahan: "",
        instansi: "",
        user: "",
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
    methods: {
      getDate() {
        this.waktu_lama = new Date();
        this.interval = setInterval(() => {
          this.sekarang = this.$moment(this.waktu_lama)
            .endOf("day")
            .format("MMMM");
        });
      },
      renderData() {
        this.loading = true;
        //ALL KELURAHAN
        this.$http.get("/kelurahan").then((response) => {
          this.kelurahan = response.data.total;
          this.loading = false;
        });
        this.$http.get("/kecamatan").then((response) => {
          this.instansi = response.data.total;
          this.loading = false;
        });
        this.$http.get("/user").then((response) => {
          this.user = response.data.total;
        });
      },
    },
  };
</script>
