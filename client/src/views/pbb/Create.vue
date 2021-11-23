<template>
  <div class="regist">
    <h1>Input Data PBB</h1>

    <v-row></v-row>
    <v-form>
      <v-row>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right-1">
            <p>Kelurahan <span style="color: red">*</span></p>
            <v-select
              single-line
              outlined
              clearable
              @click:clear="(kelurahan = ''), renderData('')"
              class="form"
              item-text="name"
              item-value="id"
              v-model="kelurahan_id"
              :items="kelurahan"
              return-object
            >
            </v-select>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right-1">
            <p>Periode <span style="color: red">*</span></p>
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
                ></v-text-field>
              </template>
              <v-date-picker locale="id" v-model="date" type="month" no-title scrollable>
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu = false"> Batalkan </v-btn>
                <v-btn text color="primary" @click="$refs.menu.save(date)"> Ok </v-btn>
              </v-date-picker>
            </v-menu>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Target PBB <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Target PBB"
              outlined
              class="form"
              v-model="form.target_pbb"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Realisasi Bulan Lalu <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Realisasi Bulan Lalu"
              outlined
              class="form"
              v-model="form.realisasi_lalu"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Realisasi Bulan Ini <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Realisasi Bulan Ini"
              outlined
              class="form"
              v-model="form.realisasi_sekarang"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Jumlah Realisasi <span style="color: red">*</span></p>
            <v-text-field outlined class="form" v-model="form.jumlah_realisasi"> </v-text-field>
            <!-- <vuetify-money
              label="Jumlah Realisasi"
              v-model="form.jumlah_realisasi"
              v-bind:placeholder="placeholder"
              v-bind:readonly="readonly"
              v-bind:disabled="disabled"
              v-bind:outlined="outlined"
              v-bind:clearable="clearable"
              v-bind:valueWhenIsEmpty="kosong"
              v-bind:options="options"
              class="form"
            /> -->
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Sisa Target <span style="color: red">*</span></p>
            <!-- <v-text-field
              single-line
              label="Sisa Target"
              outlined
              class="form"
              v-model="form.sisa_target"
            >
            </v-text-field> -->
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
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Keterangan <span style="color: red">*</span></p>
            <v-textarea
              clearable
              clear-icon="mdi-close-circle"
              single-line
              outlined
              class="form"
              v-model="form.keterangan"
            >
            </v-textarea>
          </div>
        </v-col>
      </v-row>

      <br />
      <br /><br />

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
                margin-top: 50px;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              >Batalkan</v-btn
            >

            <v-dialog v-model="confirmDialog" persistent>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  v-bind="attrs"
                  v-on="on"
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
                >
                  Simpan
                </v-btn>
              </template>
              <v-card>
                <v-card-title class="text-h5"> Apakah data di bawah ini sudah benar? </v-card-title>
                <v-card-text style="margin-top: 20px">
                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Kelurahan</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ kelurahan_id.name }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Periode</h3>
                    </v-col>
                    <v-col>
                      <b> : {{ date }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Target PBB</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.target_pbb }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Realisasi Bulan Lalu</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.realisasi_lalu }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Realisasi Bulan ini</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.realisasi_sekarang }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Jumlah Realisasi</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.jumlah_realisasi }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Sisa Target</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.sisa_target }}</b>
                    </v-col>
                  </v-row>

                  <v-row style="margin-top: -20px">
                    <v-col md="2">
                      <h3>Keterangan</h3>
                    </v-col>
                    <v-col>
                      <b>: {{ form.keterangan }}</b>
                    </v-col>
                  </v-row>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="confirmDialog = false">
                    Batalkan
                  </v-btn>
                  <v-btn color="blue darken-1" text @click="save"> Simpan </v-btn>
                </v-card-actions>
              </v-card>
              <v-overlay :value="overlay">
                <v-progress-circular indeterminate size="64"></v-progress-circular>
              </v-overlay>
            </v-dialog>
          </b-col>
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
        loading: false,
        rules: {
          required: (value) => !!value || "Required",
          counter: (value) => value.length <= 12 || "Max 30 Characters",
        },
        form: {
          kelurahan: "",
          target_pbb: "",
          realisasi_lalu: "",
          realisasi_sekarang: "",
          jumlah_realisasi: "",
          sisa_target: "",
          keterangan: "",
        },
        value: String,
        val_confirm: String,
        warehouse: "",
        warehouse_id: "",
        kelurahan_id: "",
        kelurahan: [],
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

      // addKelurahan(val) {
      //   if (val) {
      //     this.kelurahan = val;
      //     for (let i = 0; i < val.length; i++) {
      //       arr.push(val[i].id);
      //     }
      //   }
      // },
      //untuk mendapatkan list warehouse dari API
      renderData() {
        //untuk mendapatkan list type Helper dari API
        this.$http
          .get(`/kelurahan`, {
            params: {
              id_instansi: this.user.id_instansi,
            },
          })
          .then((response) => {
            this.kelurahan = [];
            let array = response.data.data;

            for (let i = 0; i < array.length; i++) {
              this.kelurahan.push({
                name: array[i].kelurahan,
                id: array[i].id,
              });
              // this.itemSelected(response.data.data)
            }
          });
      },
      //untuk menyimpan data registrasi ke dalam API
      save() {
        this.overlay = true;
        this.$http
          .post("/pbb", {
            id_instansi: this.user.id_instansi,
            id_kelurahan: this.kelurahan_id.id,
            instansi: this.user.instansi,
            kelurahan: this.kelurahan_id.name,
            target_pbb: parseInt(this.form.target_pbb),
            realisasi_bln_lalu: parseInt(this.form.realisasi_lalu),
            realisasi_bln_ini: parseInt(this.form.realisasi_sekarang),
            jmlh_realisasi: parseInt(this.form.jumlah_realisasi),
            sisa_target: parseInt(this.form.sisa_target),
            keterangan: this.form.keterangan,
            waktu: this.date + "-01",
          })
          .then((response) => {
            this.overlay = false;
            this.$router.push("/pbb");
            this.$toast.success("Data Berhasil Disimpan");
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
