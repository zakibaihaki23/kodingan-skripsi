<template>
  <div class="regist">
    <h1>CREATE HELPER</h1>

    <v-row></v-row>
    <v-form>
      <v-row>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right-1">
            <p>Nama <span style="color: red">*</span></p>
            <v-text-field
              single-line
              label="Nama"
              outlined
              class="form"
              v-model="form.name"
              :rules="[rules.required]"
            >
            </v-text-field>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right-1">
            <p>Kecamatan <span style="color: red">*</span></p>
            <v-select
              label="Kecamatan"
              single-line
              outlined
              clearable
              @click:clear="(kecamatan = []), renderData('')"
              class="form"
              item-text="name"
              item-value="id"
              v-model="kecamatan_id"
              :items="kecamatan"
              return-object
              :rules="[rules.required]"
            >
            </v-select>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Email <span style="color: red">*</span></p>
            <v-text-field
              single-line
              label="Email"
              outlined
              class="form"
              :rules="[rules.required, rules.email]"
              v-model="form.email"
            >
            </v-text-field>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Username <span style="color: red">*</span></p>
            <v-text-field
              single-line
              label="Username"
              outlined
              class="form"
              :rules="[rules.required, rules.min]"
              v-model="form.username"
            >
            </v-text-field>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Password <span style="color: red">*</span></p>
            <v-text-field
              label="Password"
              outlined
              single-line
              class="form"
              :type="value ? 'password' : 'text'"
              :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
              @click:append="() => (value = !value)"
              :rules="[rules.required, rules.min]"
              v-model="form.password"
            >
            </v-text-field>
          </div>
        </v-col>
        <v-col cols="12" sm="6" lg="6" md="6">
          <div class="form-right">
            <p>Password Confirmation <span style="color: red">*</span></p>
            <v-text-field
              label="Confirm Password"
              outlined
              single-line
              class="form"
              :type="val_confirm ? 'password' : 'text'"
              :append-icon="val_confirm ? 'mdi-eye' : 'mdi-eye-off'"
              @click:append="() => (val_confirm = !val_confirm)"
              :rules="[rules.required, rules.min]"
              v-model="form.password_confirmation"
            >
            </v-text-field>
          </div>
        </v-col>
      </v-row>

      <br />
      <br /><br />

      <v-divider></v-divider>
      <div class="btn">
        <v-row>
          <v-col md="10" sm="9" cols="5" lg="10" class="text-right">
            <v-btn
              :to="{ path: '/pbb' }"
              color="#E6E9ED"
              style="
                margin: 10px;
                color: #768f9c;
                margin-top: 50px;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              class="cancel"
              >Cancel</v-btn
            >
          </v-col>
          <v-col md="1" sm="2" cols="5" lg="1" class="text-right">
            <v-btn
              style="
                margin: 10px;
                margin-top: 50px;
                background: #4662d4;
                color: white;
                box-sizing: content-box;
                border-radius: 25px;
                width: 111px;
                height: 45px;
                padding: 4px;
              "
              class="save"
              @click="save"
              >Save</v-btn
            >
          </v-col>
        </v-row>
      </div>
    </v-form>
    <v-dialog v-model="dialog" persistent max-width="1px">
      <div class="text-center"></div>
    </v-dialog>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      kosong: "",
      date: "",
      menu: false,
      search: null,
      dialog: false,
      saveDisabled: true,
      loading: false,
      rules: {
        required: (value) => !!value || "Required",
        counter: (value) => value.length <= 12 || "Max 30 Characters",
        min: (v) => (v && v.length >= 8) || "Min 8 characters",
        email: (v) =>
          !v ||
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          "E-mail must be valid",
      },
      form: {
        name: "",
        email: "",
        username: "",
        password: "",
        password_confirmation: "",
      },
      value: String,
      val_confirm: String,
      warehouse: "",
      warehouse_id: "",
      kecamatan_id: "",
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
        }, 1000);
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
    testClick() {
      console.log("MASUKKKKK");
    },
    // addKelurahan(val) {
    //   if (val) {
    //     this.kelurahan = val;
    //     for (let i = 0; i < val.length; i++) {
    //       arr.push(val[i].id);
    //     }
    //   }
    // },
    openDialog() {
      this.dialog = true;
      this.overlay = true;
      this.save();
    },
    //untuk mendapatkan list warehouse dari API
    renderData() {
      //untuk mendapatkan list type Helper dari API
      this.$http.get(`/kecamatan`).then((response) => {
        this.kecamatan = [];
        let array = response.data.data;

        for (let i = 2; i < array.length; i++) {
          this.kecamatan.push({
            name: array[i].instansi,
            id: array[i].id,
          });
          // this.itemSelected(response.data.data)
        }
      });
    },
    //untuk menyimpan data registrasi ke dalam API
    save() {
      this.$http
        .post("/register", {
          id_instansi: this.kecamatan_id.id,
          instansi: this.kecamatan_id.name,
          name: this.form.name,
          email: this.form.email,
          username: this.form.username,
          password: this.form.password,
          password_confirmation: this.form.password_confirmation,
        })
        .then((response) => {
          this.$router.push("/user");
          this.$toast.success("Data Berhasil Disimpan");
        })
        .catch((error) => {
          //   this.$toast.error("Periksa Form Kembali");
          this.error = error.response.data;
          //   console.log(this.error);
          if (this.error.name) {
            this.$toast.error(this.error.name[0]);
          }
          if (this.error.instansi) {
            this.$toast.error(this.error.instansi[0]);
          }
          if (this.error.email) {
            this.$toast.error(this.error.email[0]);
          }
          if (this.error.username) {
            this.$toast.error(this.error.username[0]);
          }
          if (this.error.password) {
            this.$toast.error(this.error.password[0]);
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
