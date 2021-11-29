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
              <b-card-text>{{ this.total_kecamatan }} Kecamatan</b-card-text>
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
      </b-row>
      <b-row>
        <b-col lg="6">
          <b-skeleton-wrapper :loading="loading">
            <template #loading>
              <b-skeleton></b-skeleton>
            </template>

            <b-card
              border-variant="primary"
              header-html="Total Data yang Diinput dan Sudah Divalidasi<br> (Tahun Ini)"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <!-- <column-chart
                :download="{ background: '#fff' }"
                :library="barchartOptions"
                loading="loading"
                label="Total Data yang Diinputkan dan Sudah Divalidasi"
                :data="[
                  ['PBB', 1],
                  ['PATEN', 2],
                  ['Kependudukan', 1],
                  ['Akta', 3],
                  ['Bencana Alam', 2],
                ]"
              ></column-chart> -->
              <column-chart :options="barchartOptions" v-if="loaded" :chartdata="datacollection" />
            </b-card>
          </b-skeleton-wrapper>
        </b-col>
        <b-col lg="6">
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
              <pie-chart loading="Loading...." :data="[total_user, total_admin]"></pie-chart>
            </b-card>
            <!-- <b-card
              border-variant="primary"
              header="Total User"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-card-text>
                {{ this.user }}
                <b-link href="/user" style="text-decoration: none">User</b-link>
              </b-card-text>
            </b-card>-->
          </b-skeleton-wrapper>
        </b-col>
      </b-row>
    </div>
    <l-map style="height: 500px; width: 100%; margin-top: 20px" :zoom="zoom" :center="center">
      <l-tile-layer :url="url" :attribution="attribution"></l-tile-layer>
      <TooltipMap></TooltipMap>
    </l-map>
  </div>
</template>

<script>
  import { LMap, LTileLayer, LMarker, LPopup } from "vue2-leaflet";
  import TooltipMap from "../../components/TootipMap.vue";
  import ColumnChart from "../../components/BarChart.vue";

  const dataLabel = ["PBB", "PATEN", "Kependudukan", "Pembuatan Akta", "Keadaan Bencana Alam"];
  const barBackgroundColors = [
    "rgba(54, 162, 235, 1)",
    "rgba(255, 206, 86, 1)",
    "rgba(75, 192, 192, 1)",
    "rgba(153, 102, 255, 1)",
    "rgba(255, 159, 64, 1)",
  ];

  export default {
    components: {
      LMap,
      LTileLayer,
      LMarker,
      LPopup,
      TooltipMap,
      ColumnChart,
    },
    data() {
      return {
        url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        attribution:
          '&copy; <a target="_blank" href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        zoom: 10,
        center: [-6.513, 105.8228],
        withPopup: [-6.30958, 106.10726],
        total_kecamatan: [],
        total_user: "",
        total_admin: "",
        total_pbb: "",
        total_paten: "",
        kecamatan: [],
        sekarang: "",
        waktu_lama: "",
        merged: null,
        interval: null,
        waktu: new Date().getFullYear(),
        kelurahan: "",
        user: "",
        loading: false,
        loaded: false,
        barchartOptions: {
          responsive: true,
          lineTension: 1,
          maintainAspectRatio: false,
          scales: {
            yAxes: [
              {
                ticks: {
                  beginAtZero: true,
                  stepSize: 1,
                },
              },
            ],
            // xAxes: [
            //   {
            //     stacked: true,
            //     barPercentage: 0.7,
            //   },
            // ],
          },
          legend: {
            display: true,
            labels: {
              generateLabels() {
                return dataLabel.map((label, index) => ({
                  text: label,
                  fillStyle: barBackgroundColors[index],
                }));
              },
            },
          },
          datasets: {
            bar: {
              categoryPercentage: 0.4,
            },
          },
        },
      };
    },

    created() {
      this.renderData();
    },
    methods: {
      renderData() {
        this.loading = true;
        this.loaded = false;
        //ALL KELURAHAN
        this.$http.get("/kelurahan").then((response) => {
          this.kelurahan = response.data.total;
        });

        //KECAMATAN
        this.$http.get("/kecamatan").then((response) => {
          // this.instansi = response.data.total;
          this.total_kecamatan = response.data.data.length;
          // console.log(response.data.data);
        });
        // this.$http.get("/user").then((response) => {
        //   this.user = response.data.all;
        // });

        //USER
        this.$http.get(`/user`).then((response) => {
          this.total_user = [response.data.total[0].role, response.data.total[0].total];
          this.total_admin = [response.data.total[1].role, response.data.total[1].total];
          this.loading = false;
        });

        //DATA VIZUALITATION
        this.$http
          .get("/total", {
            params: {
              periode: this.waktu,
            },
          })
          .then((response) => {
            this.total_pbb = response.data.data[0].total_pbb;
            this.total_paten = response.data.data[1].total_paten;
            // let results = response.data.data;
            // let pbb = results.map((a) => [[a.total_pbb] [a.total_paten]]);
            // let paten = results.map((a) => a.total_paten);

            // console.log(pbb);

            // this.pbb = total_pbb;
            // this.paten = total_paten;
            // console.log(total_pbb);

            //CARA COMBINE
            // this.combine = [].concat(pbb, this.paten);

            this.loaded = true;

            this.datacollection = {
              labels: [
                "Realisasi PBB",
                "Rekapitulasi PATEN",
                "Kependudukan",
                "Pembuatan Akta",
                "Keadaan Bencana Alam",
              ],
              datasets: [
                {
                  backgroundColor: barBackgroundColors,
                  data: [`${this.total_pbb}`, `${this.total_paten}`],
                  borderWidth: 1,
                },
              ],
            };
          })
          .catch((error) => {
            console.log(error);
          });
      },
    },
  };
</script>
