<template>
  <div>
    <l-marker v-for="item in instansi" :key="item.id" :lat-lng="item">
      <div>
        <l-tooltip style="height: 200px">
          <span>Total data yang diinput {{ item.nama_instansi }} Bulan ini:</span>
          <div v-if="item.total_pbb != null">
            <div>
              <b>PBB:</b>
              {{ item.total_pbb }}
            </div>
          </div>
          <div v-else>
            <div><b>PBB:</b> 0</div>
          </div>
          <div v-if="item.total_paten != null">
            <div>
              <b>PATEN:</b>
              {{ item.total_paten }}
            </div>
          </div>
          <div v-else>
            <div><b>PATEN:</b> 0</div>
          </div>
          <div v-if="item.total_kependudukan != null">
            <div>
              <b>Kependudukan:</b>
              {{ item.total_kependudukan }}
            </div>
          </div>
          <div v-else>
            <div><b>Kependudukan:</b> 0</div>
          </div>
          <div v-if="item.total_imunisasi != null">
            <div>
              <b>Kegiatan Camat:</b>
              {{ item.total_imunisasi }}
            </div>
          </div>
          <div v-else>
            <div><b>Kegiatan Camat:</b> 0</div>
          </div>
          <div v-if="item.total_bencana != null">
            <div>
              <b>Bencana Alam:</b>
              {{ item.total_bencana }}
            </div>
          </div>
          <div v-else>
            <div><b>Bencana Alam:</b> 0</div>
          </div>
        </l-tooltip>
      </div>
    </l-marker>
  </div>
</template>

<script>
  import { LMap, LTileLayer, LMarker, LTooltip } from "vue2-leaflet";

  export default {
    components: {
      LMap,
      LTileLayer,
      LMarker,
      LTooltip,
    },
    data() {
      return {
        waktu: this.$moment(
          new Date(Date.now() + 3600 * 1000 * 24).toISOString().substr(0, 10)
        ).format("YYYY-MM"),
        instansi: [],
        total: [],
        tes: new Date(Date.now() + 3600 * 1000 * 24).toISOString().substr(0, 10),
      };
    },
    created() {
      this.renderData();
    },
    methods: {
      renderData() {
        // this.$http
        //   .get("/counter", {
        //     params: {
        //       waktu: this.waktu,
        //     },
        //   })
        //   .then((response) => {
        //     this.instansi = response.data.data;
        //     this.total = response.data.pbb;
        //     // console.log(response.data);
        // //   });
        // this.$http.get("/kecamatan").then((response) => {
        //   this.instansi = response.data.data;
        //   // console.log(response.data.data);
        // });
        this.$http
          .get("/result", {
            params: {
              periode: this.waktu,
            },
          })
          .then((response) => {
            this.instansi = response.data.data;
          });
      },
    },
  };
</script>

<style lang="scss">
  .vue2leaflet-map {
    z-index: 1;
  }
</style>
