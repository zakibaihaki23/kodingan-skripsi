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
        </l-popup>
      </div>
    </l-marker>
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
      },
    },
  };
</script>

<style lang="scss">
  .vue2leaflet-map {
    z-index: 1;
  }
</style>
