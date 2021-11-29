<template>
  <div v-if="this.user.role == 'Admin'">
    <!-- <b-row>
      <b-col cols="6">
        <b-skeleton-wrapper :loading="loading">
          <template #loading>
            <b-skeleton></b-skeleton>
          </template>
          <b-container>
            <b-card
              border-variant="primary"
              header="Total User"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <pie-chart loading="Loading...." :data="[total_user,total_admin]"></pie-chart>
            </b-card>
          </b-container>
        </b-skeleton-wrapper>
      </b-col>
      <b-col cols="6">
        <b-skeleton-wrapper :loading="loading">
          <template #loading>
            <b-skeleton></b-skeleton>
          </template>
          <b-container>
            <b-card
              border-variant="primary"
              header="Total Data Yang Diinputkan"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <column-chart
                :refresh="1"
                :download="true"
                :library="barchartOptions"
                loading="loading"
                label="Total Data yang Diinputkan dan Sudah Divalidasi"
                :data="[['PBB', this.total_pbb ], ['PATEN', 2], ['Kependudukan', 1],['Akta', 3], ['Bencana Alam', 2]]"
              ></column-chart>
            </b-card>
          </b-container>
        </b-skeleton-wrapper>
      </b-col>
    </b-row> -->
    <div class="container">
      <column-chart :options="options" v-if="loaded" :chartdata="datacollection" />
    </div>
  </div>
</template>

<script>
  import ColumnChart from "../../components/BarChart.vue";

  export default {
    components: {
      ColumnChart,
    },
    data() {
      return {
        loaded: false,
        date_input: null,
        number_of_morality: null,
        chicken_age: null,
        datacollection: null,
        pbb: null,
        options: {
          responsive: true,
          lineTension: 1,
          scales: {
            yAxes: [
              {
                ticks: {
                  beginAtZero: true,
                  stepSize: 1,
                  beginAtZero: true,
                },
              },
            ],
          },
        },
      };
    },
    created() {
      this.fillData();
      if (this.user.role != "Admin") {
        this.$router.push("/dashboard");
      }
    },
    mounted() {
      this.fillData();
    },
    methods: {
      fillData() {
        this.loaded = false;
        this.$http
          .get("/counter")
          .then((response) => {
            let results = response.data.data;
            let total_pbb = results.map((a) => a.total);

            this.pbb = total_pbb;
            this.loaded = true;
            // let results = response.data.data
            // let dateresult = results.map(a => a.date_input)
            // let mortalityresult = results.map(a => a.number_of_morality)
            // let chickenageresult = results.map(a => a.chicken_age)
            // this.date_input = dateresult
            // this.number_of_morality= mortalityresult
            // this.chicken_age= chickenageresult
            this.datacollection = {
              labels: ["PBB", "PATEN", "Kependudukan", "AKTA", "Bencana Alam"],
              datasets: [
                {
                  label: "PBB",
                  backgroundColor: "#f87979",
                  data: this.pbb,
                },
                {
                  label: "PATEN",
                  backgroundColor: "#2E6E89",
                  data: "3",
                },
              ],
              options: {
                responsive: true,
                lineTension: 1,
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true,
                        padding: 1,
                      },
                    },
                  ],
                },
              },
            };
          })
          .catch((error) => {
            console.log(error);
          });
      },
    },
  };
  // export default {
  //   data() {
  //     return {
  //       user: [],
  //       total_user: "",
  //       total_admin: "",
  //       total_pbb: "",
  //       loading: false,
  //       test: [],
  //       barchartOptions: {
  //         responsive: true,
  //         lineTension: 1,
  //         scales: {
  //           yAxes: [
  //             {
  //               ticks: {
  //                 beginAtZero: true,
  //                 padding: 1,
  //               },
  //             },
  //           ],
  //         },
  //       },
  //     };
  //   },
  //   mounted() {
  //     this.renderData();
  //   },

  //   methods: {
  //     renderData() {
  //       this.loading = true;
  //       this.$http.get(`/user`).then((response) => {
  //         this.total_user = [response.data.total[0].role, response.data.total[0].total];
  //         this.total_admin = [response.data.total[1].role, response.data.total[1].total];
  //         this.loading = false;
  //       });
  //       this.$http.get(`/counter`).then((response) => {
  //         this.total_pbb = response.data.data[0].total;
  //         this.loading = false;
  //       });
  //     },
  //   },
  // };
</script>

<style></style>
