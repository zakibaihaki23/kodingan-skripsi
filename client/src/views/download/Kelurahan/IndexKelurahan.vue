<template>
  <div id="app" style="margin-left: 25px; margin-right: 25px">
    <div>
      <b-skeleton-wrapper :loading="loading">
        <template #loading>
          <b-skeleton type="text"></b-skeleton>
        </template>
        <h1>Download Laporan</h1>
      </b-skeleton-wrapper>
    </div>

    <div>
      <b-skeleton-wrapper :loading="loading" class="mt-2 mb-5">
        <template #loading>
          <b-skeleton type="text"></b-skeleton>
        </template>
        <v-divider class="d-flex d-none d-sm-block"></v-divider>
      </b-skeleton-wrapper>
    </div>
    <b-row style="margin-top: 1px" cols-lg="5" cols-md="1">
      <b-col>
        <b-skeleton-wrapper :loading="loading">
          <template #loading>
            <b-skeleton type="input"></b-skeleton>
          </template>
          <v-tooltip top>
            <template v-slot:activator="{ on, attrs }">
              <v-autocomplete
                v-on="on"
                v-bind="attrs"
                outlined
                single-line
                style="border-radius: 10px; width: 250px; font-size: 13px"
                item-text="text"
                item-value="value"
                v-model="item_list"
                :items="item"
                append-icon=""
                clearable
                @input="dataSelected"
                return-object
                label="Laporan"
                dense
                :disabled="dialogOverlay == true"
              >
              </v-autocomplete>
            </template>
            <span>Pilih data laporan yang ingin diunduh</span>
          </v-tooltip>
        </b-skeleton-wrapper>
      </b-col>
      <b-col lg="3">
        <b-skeleton-wrapper :loading="loading">
          <template #loading>
            <b-skeleton type="input"></b-skeleton>
          </template>
          <v-menu
            ref="menu"
            v-model="date_filter"
            :close-on-content-click="false"
            transition="scale-transition"
            offset-y
            min-width="290px"
            :disabled="dialogOverlay == true || dateDisabled"
          >
            <template v-slot:activator="{ on }">
              <div v-on="on">
                <v-tooltip top>
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-bind="attrs"
                      v-on="on"
                      style="border-radius: 10px; font-size: 13px; width: 250px"
                      prepend-inner-icon="mdi-calendar"
                      outlined
                      single-line
                      clearable
                      readonly
                      dense
                      @click:clear="date = ''"
                      :value="format_date"
                      :disabled="dialogOverlay == true || dateDisabled"
                      @input="dateSelected"
                    >
                      <template v-slot:label>Filter Periode</template>
                    </v-text-field>
                  </template>
                  <span>Cari Berdasarkan Periode</span>
                </v-tooltip>
              </div>
            </template>
            <v-date-picker
              @change="dateSelected"
              locale="id"
              v-model="date"
              type="month"
              no-title
              scrollable
              @input="date_filter = false"
            >
            </v-date-picker>
          </v-menu>
        </b-skeleton-wrapper>
      </b-col>
      <b-col lg="3">
        <b-skeleton-wrapper :loading="loading">
          <template #loading>
            <b-skeleton type="button"></b-skeleton>
          </template>
          <v-btn
            :disabled="dialogOverlay || downloadDisabled"
            style="
              background: #4662d4;
              width: 150px;
              color: white;
              border-radius: 30px;
              font-size: 16px;
              font-weight: bold;
              text-transform: capitalize;
              cursor: pointer;
            "
            @click="download"
          >
            Download
          </v-btn>
        </b-skeleton-wrapper>
      </b-col>
      <b-col lg="1"></b-col>
      <b-col></b-col>
    </b-row>

    <v-dialog v-model="dialogOverlay" max-width="300" persistent>
      <div>
        <v-card color="primary" dark class="text-center">
          <v-card-text>
            Mohon tunggu sebentar......
            <v-progress-linear
              indeterminate
              color="white"
              class="mb-0"
            ></v-progress-linear>
          </v-card-text>
          <v-btn
            class="mb-2"
            v-show="!hideButton"
            color="#6C757D"
            dark
            fab
            small
            @click="dialogOverlay = false"
          >
            <v-icon> mdi-close </v-icon>
          </v-btn>
        </v-card>
      </div>
    </v-dialog>
    <div d-flex justify-content-center class="text-center">
      <b-skeleton-wrapper :loading="loading" class="mt-10">
        <template #loading>
          <b-skeleton></b-skeleton>
        </template>
        <b-alert show variant="info">
          <v-icon>mdi-information</v-icon>
          Mohon pilih Laporan serta Periode terlebih dahulu untuk dapat mengunduh laporan
        </b-alert>
      </b-skeleton-wrapper>
    </div>
    <b-skeleton-wrapper :loading="loading" class="d-flex justify-content-center mt-10">
      <template #loading>
        <b-skeleton-img no-aspect height="300px" width="300px"></b-skeleton-img>
      </template>
      <div class="mt-10 d-flex justify-content-center">
        <v-layout style="max-width: 250px" justify-center>
          <v-img src="@/assets/Data.png"></v-img>
        </v-layout>
      </div>
    </b-skeleton-wrapper>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      informasi: [],
      search: "",
      date_filter: "",
      date: "",
      item_list: null,
      loading: false,
      isLoading: true,
      dialogOverlay: false,
      kecamatan: [],
      dateDisabled: true,
      data: null,
      hideButton: true,
      downloadDisabled: true,
      item: [
        {
          text: "Laporan Realisasi PBB",
          value: "pbb",
        },
        {
          text: "Laporan Rekapitulasi PATEN",
          value: "paten",
        },
        {
          text: "Laporan Kependudukan",
          value: "kependudukan",
        },
        {
          text: "Kegiatan Harian Camat",
          value: "camat",
        },
        {
          text: "Laporan Keadaan Bencana Alam",
          value: "bencana",
        },
      ],
    };
  },
  watch: {
    search: {
      handler: function (val) {
        this.renderData(val);
      },
      deep: true,
    },
    overlay(val) {
      val &&
        setTimeout(() => {
          this.overlay = false;
        }, 1000);
    },
  },

  watch: {
    clearable: {
      handler: function (val) {
        this.renderData("");
      },
      deep: true,
    },
  },
  created() {
    this.loading = true;
    setTimeout(() => {
      this.loading = false;
    }, 1500);
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
    format_date() {
      if (this.date) return this.$moment(this.date).format("MMMM - YYYY");
    },
  },
  methods: {
    download() {
      this.dialogOverlay = true;
      let periode = "";
      if (this.date) {
        periode = this.date;
      } else {
        periode = null;
      }

      this.$http
        .get(
          `/report/${this.data}?instansi_id=${this.user.instansi_id}&periode=${periode}&kelurahan=${this.user.kelurahan.nama_kelurahan}`,
          {
            config: {
              headers: {
                "Content-Type": "multipart/form-data",
                "Access-Control-Allow-Origin": "*",
              },
            },
          }
        )
        .then((response) => {
          if (response.data == "") {
            this.$toast.error("Data laporan pada periode tersebut tidak ada");
            this.dialogOverlay = false;
          } else {
            window.open(response.config.baseURL + response.config.url, "_blank");
            this.dialogOverlay = false;
          }
        })
        .catch((error) => {
          this.dialogOverlay = false;
          this.hideButton = true;
        });
    },

    dataSelected(val) {
      this.val = null;
      this.data = "";
      if (val) {
        this.val = val;
        this.data = val.value;
        this.dateDisabled = false;
      } else {
        this.val = null;
        this.data = "";
        this.dateDisabled = true;
        this.date = "";
        this.downloadDisabled = true;
      }
    },
    dateSelected() {
      if (this.date) {
        this.downloadDisabled = false;
      } else {
        this.downloadDisabled = true;
      }
    },
  },
};
</script>

<style scoped lang="scss"></style>
