<template>
  <div>
    <l-marker v-for="item in instansi" :key="item.id" :lat-lng="item">
      <div>
        <l-popup style="height: 200px">
          <span>Total data yang diinput {{ item.instansi }} Bulan ini: </span>
          <div v-if="item.total_pbb != null">
            <div><b>PBB:</b> {{ item.total_pbb }}</div>
          </div>
          <div v-else>
            <div><b>PBB:</b> 0</div>
          </div>
          <div><b>PATEN:</b> {{ item.total_paten }}</div>
          <div><b>Kependudukan:</b> {{ item.total_penduduk }}</div>
          <div><b>Akta:</b> {{ item.total_pbb }}</div>
          <div><b>Bencana Alam:</b> {{ item.total_pbb }}</div>
          <!-- <span
            >Total Kelurahan di Kecamatan Pandeglang:
            <b>{{ this.pandeglang.kelurahan }} </b></span
          > -->
        </l-popup>
      </div>
      <!-- <div>
        <l-popup style="height: 200px">
          <pre>{{ item }}</pre>
          <span>Total data yang diinput {{ pbb.instansi }} Bulan ini: </span>
          <div><b>PBB:</b> {{ pbb.total_pbb }}</div>
          <div><b>PATEN:</b> {{ item.total_paten }}</div>
          <div><b>Kependudukan:</b> {{ item.total_kep }}</div>
          <div><b>Akta:</b> {{ item.total_pbb }}</div>
          <div><b>Bencana Alam:</b> {{ item.total_pbb }}</div>
          <span
            >Total Kelurahan di Kecamatan Pandeglang:
            <b>{{ item.kelurahan }} </b></span
          > 
        </l-popup>
      </div> -->
    </l-marker>
    <!-- <l-marker :lat-lng="majasari.latlong">
      <div>
        <l-popup style="height: 200px">
          <span>Total data yang diinput Kecamatan Majasari Bulan Ini: </span>
          <div><b>PBB:</b> {{ this.majasari.total_pbb }}</div>
          <div><b>PATEN:</b> {{ this.majasari.total_paten }}</div>
          <div><b>Kependudukan:</b> {{ this.majasari.total_kep }}</div>
          <div><b>Akta:</b> {{ this.majasari.total_pbb }}</div>
          <div><b>Bencana Alam:</b> {{ this.majasari.total_pbb }}</div>
          <span
            >Total Kelurahan di Kecamatan Majasari:
            <b>{{ this.majasari.kelurahan }} </b></span
          >
        </l-popup>
      </div>
    </l-marker> -->
    <!-- ANGSANA -->
    <!-- <l-marker :lat-lng="angsana.latlong">
      <div>
        <l-popup style="height: 200px">
          <span>Total data yang diinput Kecamatan Angsana Bulan Ini: </span>
          <div><b>PBB:</b> {{ this.angsana.total_pbb }}</div>
          <div><b>PATEN:</b> {{ this.angsana.total_pbb }}</div>
          <div><b>Kependudukan:</b> {{ this.angsana.total_pbb }}</div>
          <div><b>Akta:</b> {{ this.angsana.total_pbb }}</div>
          <div><b>Bencana Alam:</b> {{ this.angsana.total_pbb }}</div>
          <span
            >Total Kelurahan di Kecamatan Angsana:
            <b>{{ this.angsana.kelurahan }} </b></span
          >
        </l-popup>
      </div>
    </l-marker> -->
  </div>
</template>

<script>
import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LPopup,
  },
  data() {
    return {
      waktu: new Date().toISOString().substr(0, 7) + "-01",
      instansi: [],
      total: [],
      pandeglang: {
        id: 3,
        latlong: [-6.30958, 106.10726],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
      majasari: {
        id: 4,
        latlong: [-6.3288422, 106.093506],
        total_pbb: "",
        total_akta: "",
        total_paten: "",
        total_kep: "",
        total_benc: "",
        kelurahan: "",
      },
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
      bojong: {
        id: 7,
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
    };
  },
  created() {
    this.renderData();
  },
  methods: {
    renderData() {
      this.$http
        .get("/counter", {
          params: {
            waktu: this.waktu,
          },
        })
        .then((response) => {
          this.instansi = response.data.data;
          this.total = response.data.pbb;
          // console.log(response.data);
        });
      // Pandeglang
      if (this.pandeglang.id == 3) {
        this.$http
          .get("/counter", {
            params: {
              id_instansi: `${this.pandeglang.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.pandeglang.total_pbb = response.data.pbb;
            this.pandeglang.total_kep = response.data.kependudukan;
            this.pandeglang.total_paten = response.data.paten;
          });
        this.$http
          .get("/kelurahan", {
            params: {
              id_instansi: `${this.pandeglang.id}`,
            },
          })
          .then((response) => {
            this.pandeglang.kelurahan = response.data.total;
          });
      }
      // Majasari
      if (this.majasari.id == 4) {
        this.$http
          .get("/counter", {
            params: {
              id_instansi: `${this.majasari.id}`,
              waktu: this.waktu,
            },
          })
          .then((response) => {
            this.majasari.total_pbb = response.data.pbb;
            this.majasari.total_kep = response.data.kependudukan;
            this.majasari.total_paten = response.data.paten;
          });
        this.$http
          .get("/kelurahan", {
            params: {
              id_instansi: `${this.majasari.id}`,
            },
          })
          .then((response) => {
            this.majasari.kelurahan = response.data.total;
          });
      }
      // Angsana
      //   if (this.angsana.id == 4) {
      //     this.$http
      //       .get("/counter", {
      //         params: {
      //           id_instansi: `${this.angsana.id}`,
      //           waktu: this.waktu,
      //         },
      //       })
      //       .then((response) => {
      //         this.angsana.total_pbb = response.data.total;
      //       });
      //     this.$http
      //       .get("/kelurahan", {
      //         params: {
      //           id_instansi: `${this.angsana.id}`,
      //         },
      //       })
      //       .then((response) => {
      //         this.angsana.kelurahan = response.data.total;
      //       });
      //   }
      // Banjar

      // Bojong

      // Cadasari

      // Carita
    },
  },
};
</script>