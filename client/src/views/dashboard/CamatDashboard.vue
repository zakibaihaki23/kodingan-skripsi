<template>
  <div>
    <div>
      <b-row>
        <b-col lg="12">
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
              <b-card-text>{{ this.total_kelurahan }} Kelurahan</b-card-text>
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
              header-html="Total Data yang Sudah Divalidasi <b>(Bulan Ini)</b>"
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
              <column-chart
                :options="barchartOptions"
                v-if="loaded"
                :chartdata="this.datacollection"
              />
            </b-card>
          </b-skeleton-wrapper>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import ColumnChart from "../../components/BarChart.vue";

export default {
  components: {
    ColumnChart,
  },
  data() {
    return {
      pbb: [],
      notif: 0,
      total_pbb: "",
      total_kelurahan: "",
      kelurahan: "",
      sekarang: "",
      waktu_lama: "",
      loaded: false,
      interval: null,
      waktu: new Date(),
      loading: false,
      pbb_valid: "",
      paten_valid: "",
      kependudukan_valid: "",
      camat_valid: "",
      bencana_valid: "",
      notvalid: "",
      informasi: "",
      notif_all: "",
      all_informasi: "",
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
        datasets: {
          bar: {
            categoryPercentage: 0.4,
          },
        },
      },
    };
  },
  computed: {
    ...mapGetters({
      authenticated: "auth/authenticated",
      user: "auth/user",
    }),
  },
  destroyed() {
    clearInterval(this.interval);
  },
  created() {
    this.renderData();
  },
  methods: {
    renderData() {
      this.loading = true;
      this.loaded = false;
      //GET DATA FOR TOTAL

      //GET DATA TOTAL KELURAHAN
      this.$http
        .get("/kelurahan", {
          params: {
            instansi_id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.total_kelurahan = response.data.total;
          // console.log(this.total_kelurahan);
          // this.kelurahan = response.data.data;
          this.firstLoad = false;
          this.dialog = false;
          this.dialogOverlay = false;
          this.overlay = true;
          this.loading = false;
        })
        .catch((error) => {
          if (error) {
            console.log(error);
          }
          this.loading = false;
        });

      // INFORMASI
      this.$http
        .get("/informasi", {
          params: {
            instansi_id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.informasi = response.data.data;
          this.notif = response.data.total;
        });

      this.$http
        .get("/informasi", {
          params: {
            instansi_id: 0,
          },
        })
        .then((response) => {
          this.all_informasi = response.data.data;
          this.notif_all = response.data.total;
        });

      //DATA BELUM VALID
      this.$http
        .get("/notvalid", {
          params: {
            periode: this.$moment(this.waktu).format("YYYY-MM"),
            instansi_id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.notvalid = response.data.data;
        });
      // TOTAL UNTUK CHART

      this.$http
        .get("/chart", {
          params: {
            periode: this.$moment(this.waktu).format("YYYY-MM"),
            instansi_id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.pbb_valid = response.data.data[1].pbb_valid;
          this.paten_valid = response.data.data[4].paten_valid;
          this.kependudukan_valid = response.data.data[7].kependudukan_valid;
          this.camat_valid = response.data.data[10].camat_valid;
          this.bencana_valid = response.data.data[13].bencana_valid;
          this.loaded = true;

          // UNTUK INFORMASI
          // console.log(this.$moment(test).fromNow());
          this.datacollection = {
            labels: ["PBB", "PATEN", "Kependudukan", "Kegiatan Camat", "Bencana Alam"],
            datasets: [
              {
                label: "Sudah Divalidasi",
                backgroundColor: "rgba(255, 206, 86, 1)",
                data: [
                  `${this.pbb_valid}`,
                  `${this.paten_valid}`,
                  `${this.kependudukan_valid}`,
                  `${this.camat_valid}`,
                  `${this.bencana_valid}`,
                ],
                borderWidth: 1,
              },
            ],
          };
        });
    },
  },
};
</script>
