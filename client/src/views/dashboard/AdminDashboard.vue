<template>
  <div>
    <v-row no-gutters style="margin-top: 30px">
      <v-col cols="10" sm="3" md="3" lg="2" style="margin-left: 5px">
        <v-card class="text-center" color="blue" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Kecamatan</div>
          </v-card-text>

          <v-card-text>
            <div class="text-h4 font-weight-thin">
              {{ this.instansi }} Kecamatan
            </div>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="10" sm="3" md="3" lg="2" style="margin-left: 5px">
        <v-card class="text-center" color="aqua" dark max-width="300">
          <v-card-text>
            <div class="text-h6">Total Kelurahan</div>
          </v-card-text>
          <v-card-text>
            <div class="text-h4 font-weight-thin">
              {{ this.kelurahan }} Kelurahan
            </div>
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
    </v-row>
    <l-map
      style="height: 500px; width: 100%; margin-top: 20px"
      :zoom="zoom"
      :center="center"
    >
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

      angsana: {
        id: 5,
        latlong: [-6.5772555, 105.8604562],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      banjar: {
        id: 6,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      banjar: {
        id: 7,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      bojong: {
        id: 8,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cadasari: {
        id: 8,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      carita: {
        id: 9,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      carita: {
        id: 10,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cibaliung: {
        id: 11,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cibitung: {
        id: 12,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cigeulis: {
        id: 13,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cikedal: {
        id: 14,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cimanggu: {
        id: 15,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cimanuk: {
        id: 16,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cipeucang: {
        id: 17,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      cisata: {
        id: 18,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      jiput: {
        id: 19,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      kaduhejo: {
        id: 20,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      karang_tanjung: {
        id: 21,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      koroncong: {
        id: 22,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      labuan: {
        id: 23,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      mandalawangi: {
        id: 24,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      mekarjaya: {
        id: 25,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      menes: {
        id: 26,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      munjul: {
        id: 27,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      pagelaran: {
        id: 28,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      panimbang: {
        id: 29,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      patia: {
        id: 30,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      picung: {
        id: 31,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      pulosari: {
        id: 32,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      saketi: {
        id: 33,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      sindang_resmi: {
        id: 34,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      sobang: {
        id: 35,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      sukaresmi: {
        id: 36,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      sumur: {
        id: 37,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
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
      //ALL KELURAHAN
      this.$http.get("/kelurahan").then((response) => {
        this.kelurahan = response.data.total;
      });
      this.$http.get("/kecamatan").then((response) => {
        this.instansi = response.data.total;
      });
      this.$http.get("/user").then((response) => {
        this.user = response.data.total;
      });

      // Angsana
      if (this.angsana.id == 5) {
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.angsana.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.angsana.total_pbb = response.data.total;
          });
      }
      // Banjar
      if (this.banjar.id == 6) {
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.banjar.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.banjar.total_pbb = response.data.total;
          });
      }
      // Bojong
      if (this.bojong.id == 6) {
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.bojong.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.bojong.total_pbb = response.data.total;
          });
      }
      // Cadasari
      if (this.cadasari.id == 7) {
        this.$http
          .get("/pbb", {
            params: {
              id_instansi: `${this.cadasari.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.cadasari.total_pbb = response.data.total;
          });
      }
      // Carita

      // Cibaliung

      // Cibitung

      // Cigeulis

      // Cikedal

      // Cikeusik

      // Cimanggu

      // Cimanuk

      // Cipeucang

      // Cisata

      // Jiput

      // Kaduhejo

      // Karang Tanjung

      // Koroncong

      // Labuan

      // Mandalawangi

      // Mekarjaya

      // Menes

      // Munjul

      // Pagelaran

      // Panimbang

      // Patia

      // Picung

      // Pulosari

      // Saketi

      // Sindangresmi

      // Sobang

      // Sukaresmi

      // Sumur
    },
  },
};
</script>