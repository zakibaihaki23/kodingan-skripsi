<template>
  <div class="regist">
    <h1 class="mb-10">Input Data PBB</h1>
    <v-row></v-row>
    <v-form v-model="isFormValid">
      <v-row>
        <div class="row">
          <div class="col mx-auto">
            <div class="form-group row">
              <div class="col-md-6">
                <p>
                  Kelurahan
                  <span style="color: red">*</span>
                </p>
                <v-select
                  single-line
                  outlined
                  class="form"
                  item-text="name"
                  item-value="id"
                  v-model="kelurahan_id"
                  :items="kelurahan"
                  return-object
                  :rules="[rules.required]"
                ></v-select>
              </div>
              <div class="col-md-6">
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
                      class="form"
                      v-bind="attrs"
                      v-on="on"
                      @click:clear="date = ''"
                      :rules="[rules.required]"
                    ></v-text-field>
                  </template>
                  <v-date-picker locale="id" v-model="date" type="month" no-title scrollable>
                    <v-spacer></v-spacer>
                    <v-btn text color="primary" @click="menu = false">Batalkan</v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(date)">Ok</v-btn>
                  </v-date-picker>
                </v-menu>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-lg-4">
                <p>Target PBB</p>
                <vuetify-money
                  v-model="form.target_pbb"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
              <div class="col-lg-4">
                <p>Realisasi Bulan Lalu</p>
                <vuetify-money
                  v-model="form.realisasi_lalu"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
              <div class="col-lg-4">
                <p>Realisasi Bulan Ini</p>
                <vuetify-money
                  v-model="form.realisasi_sekarang"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
            </div>
            <div class="form-group row">
              <div class="col-lg-6">
                <p>Jumlah Realisasi</p>
                <v-text-field outlined class="form" v-model="form.jumlah_realisasi"></v-text-field>
              </div>
              <div class="col-lg-6">
                <p>Sisa Target</p>
                <vuetify-money
                  v-model="form.sisa_target"
                  v-bind:placeholder="placeholder"
                  v-bind:readonly="readonly"
                  v-bind:disabled="disabled"
                  v-bind:outlined="outlined"
                  v-bind:clearable="clearable"
                  v-bind:valueWhenIsEmpty="kosong"
                  v-bind:options="options"
                  class="form"
                />
              </div>
            </div>
            <div class="form-group row">
              <div>
                <p>Keterangan</p>
                <v-textarea
                  clearable
                  clear-icon="mdi-close-circle"
                  single-line
                  outlined
                  class="form"
                  v-model="form.keterangan"
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
              :to="{ path: '/pbb' }"
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
              :disabled="overlay == true || !isFormValid"
              >Simpan</v-btn
            >
          </b-col>
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
        date: "",
        menu: false,
        search: null,
        saveDisabled: true,
        isFormValid: false,
        loading: false,
        rules: {
          required: (value) => !!value || "Required",
          counter: (value) => value.length <= 12 || "Max 30 Characters",
        },
        form: {
          kelurahan: 0,
          target_pbb: 0,
          realisasi_lalu: 0,
          realisasi_sekarang: 0,
          jumlah_realisasi: 0,
          sisa_target: 0,
          keterangan: "",
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
      if (this.user.role != "User") {
        this.$router.push("/dashboard");
      }
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
              id: this.user.id,
            },
          })
          .then((response) => {
            this.kelurahan = [];
            let array = response.data.data.kelurahan;
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
        this.overlay = true;
        this.$http
          .post("/pbb", {
            instansi_id: this.user.instansi_id,
            kelurahan: this.kelurahan_id.name,
            target_pbb: parseInt(this.form.target_pbb),
            realisasi_bln_lalu: parseInt(this.form.realisasi_lalu),
            realisasi_bln_ini: parseInt(this.form.realisasi_sekarang),
            jmlh_realisasi: parseInt(this.form.jumlah_realisasi),
            sisa_target: parseInt(this.form.sisa_target),
            keterangan: this.form.keterangan,
            periode: this.date + "-01",
          })
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.overlay = false;
              self.$toast.success("Data Berhasil Disimpan");
              self.$router.push("/pbb");
            }, 10 * 10 * 10);
          })
          .catch((error) => {
            this.overlay = false;
            if (error.response.status == 422) {
              this.$toast.error("Periksa Form Kembali");
            } else {
              this.$toast.error("Periode sudah diinputkan pada kelurahan yang dipilih");
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
