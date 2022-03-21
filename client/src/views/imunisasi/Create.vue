<template>
  <div class="regist">
    <h1 class="mb-10">Input Data Imunisasi</h1>
    <v-row></v-row>
    <v-form v-model="isFormValid">
      <v-row>
        <div class="row">
          <div class="col mx-auto">
            <div class="form-group row">
              <div class="col-md">
                <p>
                  Periode
                  <span style="color: red">*</span>
                </p>
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="date"
                  transition="scale-transition"
                  offset-y
                  max-width="290px"
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      :value="date_picker"
                      prepend-inner-icon="mdi-calendar"
                      single-line
                      clearable
                      outlined
                      label="Periode"
                      class="form"
                      v-bind="attrs"
                      v-on="on"
                      @click:clear="date = ''"
                      :rules="[rules.required]"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    locale="id"
                    v-model="date"
                    type="month"
                    no-title
                    scrollable
                    @input="$refs.menu.save(date)"
                  >
                  </v-date-picker>
                </v-menu>
                <v-checkbox
                  class="mt-0"
                  v-model="nihil"
                  true-value="null"
                  false-value="0"
                  :label="`Tidak ada laporan (NIHIL)`"
                  :disabled="
                    form.bcg != null ||
                    form.dpt_1 != null ||
                    form.dpt_2 != null ||
                    form.dpt_3 != null ||
                    form.polio_1 != null ||
                    form.polio_2 != null ||
                    form.polio_3 != null ||
                    form.polio_4 != null ||
                    form.cmp != null ||
                    form.ibu_hamil_1 != null ||
                    form.ibu_hamil_2 != null ||
                    form.anak_sd_1 != null ||
                    form.anak_sd_2 != null ||
                    form.cp_1 != null ||
                    form.cp_2 != null ||
                    form.keterangan != null
                  "
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                  :rules="[rules.required]"
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
                box-sizing: content-box;
                border-radius: 25px;
                width: 100px;
                height: 45px;
                padding: 4px;
              "
              >Batalkan</v-btn
            >&nbsp;
            <v-btn
              v-if="nihil == 'null'"
              style="
                background: #007bff;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 100px;
                height: 45px;
                padding: 4px;
              "
              class="save"
              @click="save()"
              :disabled="date_picker == null"
              >Simpan</v-btn
            >
            <v-btn
              v-else
              style="
                background: #007bff;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 100px;
                height: 45px;
                padding: 4px;
              "
              class="save"
              @click="save()"
              :disabled="!isFormValid"
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
    formatDate(date) {
      if (!date) return null;

      const [year, month, day] = date.split("-");
      return `${day}/${month}/${year}`;
    },
    renderData() {
      this.$http
        .get(`/kecamatan`, {
          params: {
            id: this.user.instansi_id,
          },
        })
        .then((response) => {
          this.kelurahan = [];
          let array = response.data.data[0].kelurahan;
          // console.log(array);
          for (let i = 0; i < array.length; i++) {
            this.kelurahan.push({
              name: array[i].nama_kelurahan,
              id: array[i].id,
            });
            // console.log(this.kelurahan);
            // this.itemSelected(response.data.data)
          }
        });
    },
    //untuk menyimpan data registrasi ke dalam API
    save() {
      this.dialogOverlay = true;
      this.$http
        .post("/imunisasi", {
          instansi_id: this.user.instansi_id,
          kelurahan: this.user.kelurahan.nama_kelurahan,
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
          periode: this.date + "-01",
        })
        .then((response) => {
          let self = this;
          setTimeout(function () {
            self.dialogOverlay = false;
            self.$toast.success("Data Berhasil Disimpan");
            self.$router.push("/imunisasi");
          }, 10 * 10 * 10);
        })
        .catch((error) => {
          this.dialogOverlay = false;
          if (error.response.status == 422) {
            this.$toast.error("Periksa Form Kembali");
          } else {
            this.$toast.error("Periode sudah diinputkan");
          }
        });
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
