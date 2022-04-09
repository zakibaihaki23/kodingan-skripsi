<template>
  <div class="regist">
    <h1 class="mb-10">Edit Data Imunisasi</h1>
    {{ this.imunisasi }}
    <div class="row">
      <div class="col mx-auto" style="font-size: 17pt">
        <div class="form-group row">
          <b-skeleton-wrapper :loading="loading">
            <template #loading>
              <b-skeleton></b-skeleton>
            </template>
            <div class="col-lg-3">
              <p>Periode</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.$moment(imunisasi.periode).format("MMMM - YYYY") }}
              </p>
            </div>
            <div class="col-lg-3">
              <p>Kelurahan/Desa</p>
            </div>
            <div class="col-lg-9">
              <p style="font-weight: bold">
                {{ this.imunisasi.kelurahan }}
              </p>
            </div>
          </b-skeleton-wrapper>
        </div>
      </div>
    </div>
    <v-form>
      <v-row>
        <div class="row">
          <div class="col mx-auto">
            <div class="form-group row">
              <div class="col-md">
                <v-checkbox
                  class="mt-0"
                  v-model="nihil"
                  true-value="null"
                  false-value="0"
                  :label="`Tidak ada laporan (NIHIL)`"
                  @change="checkBox"
                >
                </v-checkbox>
              </div>
            </div>
            <!-- BCG -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>BCG</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-12">
                <p>BCG</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.bcg"
                  label="BCG"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- DPT -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>DPT</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>1</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.dpt_1"
                  label="DPT 1"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>2</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.dpt_2"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="DPT 2"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-4">
                <p>3</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.dpt_3"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="DPT 3"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- POLIO -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Polio</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-3">
                <p>1</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.polio_1"
                  label="Polio 1"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-3">
                <p>2</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.polio_2"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Polio 2"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-3">
                <p>3</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.polio_3"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Polio 3"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-3">
                <p>4</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.polio_4"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="Polio 4"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- CMP -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>CMP</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-12">
                <p>CMP</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.cmp"
                  label="CMP"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- IBU HAMIL -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Ibu Hamil</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>TT 1</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.ibu_hamil_1"
                  label="TT 1"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>TT 2</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.ibu_hamil_2"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="TT 2"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- ANAK SD -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Anak SD</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>DT 1</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.anak_sd_1"
                  label="DT 1"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>DT 2</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.anak_sd_2"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="DT 2"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- CP -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>CP</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>TT 1</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.cp_1"
                  label="TT 1"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>TT 2</p>
                <v-text-field
                  outlined
                  class="form"
                  v-model="form.cp_2"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                  label="TT 2"
                  onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                ></v-text-field>
              </div>
            </div>
            <!-- Keterangan -->
            <div class="mt-5 text-center bg-primary text-light">
              <h5>Keterangan</h5>
            </div>
            <div class="form-group row">
              <div class="col-lg-12">
                <p>Keterangan</p>
                <v-textarea
                  outlined
                  class="form"
                  v-model="form.keterangan"
                  label="Keterangan"
                  clearable
                  single-line
                  :disabled="nihil == 'null'"
                ></v-textarea>
              </div>
            </div>
          </div>
        </div>
      </v-row>

      <br />
      <br />
      <br />

      <v-divider></v-divider>
      <div>
        <b-row>
          <b-col class="text-right">
            <v-btn
              :to="{ path: '/imunisasi' }"
              color="#4FC3F7"
              class="button"
              outlined
              style="
                margin-top: 50px;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              >Batalkan</v-btn
            >
            <v-btn
              style="
                margin-top: 50px;
                background: #007bff;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
                margin-left: 10px;
              "
              class="save"
              @click="save()"
              :disabled="imunisasi.is_verified != 3"
              >Simpan</v-btn
            >
          </b-col>
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
              </v-card>
            </div>
          </v-dialog>
          <v-overlay :value="overlay">
            <v-progress-circular indeterminate color="blue"></v-progress-circular>
          </v-overlay>
        </b-row>
      </div>
    </v-form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      overlay: false,
      kosong: "",
      confirmDialog: false,
      dialogOverlay: false,
      isFormValid: false,
      date: "",
      menu: false,
      search: null,
      nihil: null,
      saveDisabled: true,
      isFormValid: false,
      loading: false,
      rules: {
        required: (value) => !!value || "Required",
        isi: (value) => !!value || value == "" || "KOSONG",
        counter: (value) => value.length <= 12 || "Max 30 Characters",
      },
      form: {
        kelurahan: "",
        bcg: null,
        dpt_1: null,
        dpt_2: null,
        dpt_3: null,
        polio_1: null,
        polio_2: null,
        polio_3: null,
        polio_4: null,
        cmp: null,
        ibu_hamil_1: null,
        ibu_hamil_2: null,
        anak_sd_1: null,
        anak_sd_2: null,
        cp_1: null,
        cp_2: null,
        keterangan: null,
      },
      value: String,
      val_confirm: String,
      warehouse: "",
      warehouse_id: "",
      kelurahan_id: "",
      kelurahan: [],
      kecamatan: [],
      imunisasi: [],
      error: {},
      placeholder: " ",
      readonly: false,
      disabled: false,
      outlined: true,
      clearable: true,
      options: {
        locale: "ID",
        prefix: "Rp.",
        suffix: "",
        length: 11,
        precision: 0,
      },
    };
  },

  created() {
    this.renderData("");
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
        }, 3000);
    },
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
    computedDateFormatted() {
      return this.formatDate(this.date);
    },
    date_picker() {
      if (this.date) return this.$moment(this.date).format("MMMM - YYYY");
    },
  },
  methods: {
    renderData() {
      this.loading = true;
      this.$http
        .get("/imunisasi/" + this.$route.params.id)

        .then((response) => {
          this.loading = false;
          this.imunisasi = response.data.data;
          this.form.bcg = response.data.data.bcg;
          this.form.dpt_1 = response.data.data.dpt_1;
          this.form.dpt_2 = response.data.data.dpt_2;
          this.form.dpt_3 = response.data.data.dpt_3;
          this.form.polio_1 = response.data.data.polio_1;
          this.form.polio_2 = response.data.data.polio_2;
          this.form.polio_3 = response.data.data.polio_3;
          this.form.polio_4 = response.data.data.polio_4;
          this.form.cmp = response.data.data.cmp;
          this.form.ibu_hamil_1 = response.data.data.ibu_hamil_1;
          this.form.ibu_hamil_2 = response.data.data.ibu_hamil_2;
          this.form.anak_sd_1 = response.data.data.anak_sd_1;
          this.form.anak_sd_2 = response.data.data.anak_sd_2;
          this.form.cp_1 = response.data.data.cp_1;
          this.form.cp_2 = response.data.data.cp_2;
          this.form.keterangan = response.data.data.keterangan;
        });

      this.$http
        .get(`/kecamatan`, {
          params: {
            id: this.user.instansi_id,
          },
        })
        .then((response) => {
          // this.kelurahan = [];
          this.kelurahan = response.data.data[0].kelurahan;
          // for (let i = 0; i < array.length; i++) {
          //   this.kelurahan.push({
          //     name: array[i].nama_kelurahan,
          //     id: array[i].id,
          //   });
          // }
        });
    },

    save() {
      this.dialogOverlay = true;
      this.$http
        .put("/imunisasi/" + this.$route.params.id, {
          instansi_id: this.imunisasi.instansi_id,
          kelurahan: this.imunisasi.kelurahan,
          bcg: parseInt(this.form.bcg),
          dpt_1: parseInt(this.form.dpt_1),
          dpt_2: parseInt(this.form.dpt_2),
          dpt_3: parseInt(this.form.dpt_3),
          polio_1: parseInt(this.form.polio_1),
          polio_2: parseInt(this.form.polio_2),
          polio_3: parseInt(this.form.polio_3),
          polio_4: parseInt(this.form.polio_4),
          cmp: parseInt(this.form.cmp),
          ibu_hamil_1: parseInt(this.form.ibu_hamil_1),
          ibu_hamil_2: parseInt(this.form.ibu_hamil_2),
          anak_sd_1: parseInt(this.form.anak_sd_1),
          anak_sd_2: parseInt(this.form.anak_sd_2),
          cp_1: parseInt(this.form.cp_1),
          cp_2: parseInt(this.form.cp_2),
          keterangan: parseInt(this.form.keterangan),
          periode: this.imunisasi.periode,
          is_verified: 1,
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$router.push("/imunisasi");
            self.$toast.success("Data Berhasil Diupdate");
          }, 10 * 10 * 10);
        });
    },
    checkBox(val) {
      if (val == "null") {
        this.form.bcg = null;
        this.form.dpt_1 = null;
        this.form.dpt_2 = null;
        this.form.dpt_3 = null;
        this.form.polio_1 = null;
        this.form.polio_2 = null;
        this.form.polio_3 = null;
        this.form.polio_4 = null;
        this.form.cmp = null;
        this.form.ibu_hamil_1 = null;
        this.form.ibu_hamil_2 = null;
        this.form.anak_sd_1 = null;
        this.form.anak_sd_2 = null;
        this.form.cp_1 = null;
        this.form.cp_2 = null;
        this.form.keterangan = null;
      }
      if (val == "0") {
        this.renderData();
      }
    },
  },
};
</script>

<style scoped>
.regist {
  padding-left: 80px;
  padding-right: 50px;
}
.form-right {
  padding-right: 90px;
  font-size: 20px;
}
.form-right-1 {
  margin-top: 60px;
  padding-right: 90px;
  font-size: 20px;
}
.form-credential {
  margin-top: 20px;
  padding-right: 90px;
}

.name {
  border-radius: 15px;
}
/* .v-btn:not(.v-btn--round).v-size--default {
  margin-top: 50px;
  background: #4662d4;
  color: white;
  box-sizing: content-box;
  border-radius: 25px;
  width: 111px;
  height: 45px;
  padding: 4px;
} */
.btn {
  margin-top: 30px;
}
.form {
  border-style: none;
  text-decoration: none;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

input[type="number"] {
  -moz-appearance: textfield;
}
</style>
