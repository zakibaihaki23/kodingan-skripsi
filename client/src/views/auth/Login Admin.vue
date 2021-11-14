<template>
  <div id="app">
    <v-app>
      <v-dialog v-model="dialog" persistent max-width="600px" min-width="360px">
        <div>
          <v-tabs
            v-model="tab"
            show-arrows
            background-color="deep-purple accent-4"
            icons-and-text
            dark
            grow
          >
            <v-tabs-slider color="red"></v-tabs-slider>
            <v-tab to="/">
              <div style="margin-top: 4px">User</div>
              <v-icon large>mdi-account</v-icon>
            </v-tab>
            <v-tab>
              <div style="margin-top: 4px">Admin</div>
              <v-icon large>mdi-account-outline</v-icon>
            </v-tab>
            <v-tab-item>
              <v-card class="px-4">
                <v-card-text> </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card class="px-4">
                <v-card-text>
                  <v-form ref="registerForm" v-model="valid" lazy-validation>
                    <v-row>
                      <v-col cols="12">
                        <v-text-field
                          v-model="admin.username"
                          label="Username"
                          :rules="[rules.required, rules.minmin]"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          v-model="admin.password"
                          :append-icon="show1 ? 'eye' : 'eye-off'"
                          :rules="[rules.required]"
                          :type="show1 ? 'text' : 'password'"
                          name="input-10-1"
                          label="Password"
                          @click:append="show1 = !show1"
                          @keyup.enter="adminLogin"
                        ></v-text-field>
                      </v-col>
                      <v-col class="d-flex" cols="12" sm="6" xsm="12"> </v-col>
                      <v-spacer></v-spacer>
                      <v-col class="d-flex" cols="12" sm="3" xsm="12" align-end>
                        <v-btn
                          x-large
                          block
                          :disabled="!validated"
                          color="success"
                          @click="adminLogin"
                        >
                          Login
                        </v-btn>
                      </v-col>
                    </v-row>
                  </v-form>
                </v-card-text>
              </v-card>
            </v-tab-item>
          </v-tabs>
        </div>
      </v-dialog>
    </v-app>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  data: () => ({
    dialog: true,
    tab: 1,
    valid: false,
    user: {
      username: "",
      password: "",
    },
    admin: {
      username: "",
      password: "",
    },
    show1: false,
    rules: {
      required: (value) => !!value || "Required.",
      min: (v) => (v && v.length >= 8) || "Min 8 characters",
      minmin: (v) => (v && v.length >= 5) || "Min 5 characters",
    },
  }),
  computed: {
    validated: function () {
      return this.admin.username.length > 5 && this.admin.password.length > 7;
    },
  },
  methods: {
    ...mapActions({
      signInAdmin: "auth/signInAdmin",
    }),
    adminLogin() {
      this.signInAdmin(this.admin)
        .then((response) => {
          window.location.reload();
          this.$router.push("/dashboard");
        })
        .catch((error) => {
          if (error.response.status == 401) {
            this.$toast.error("Harap Isi Email dan Password");
          } else {
            this.$toast.error(error.response.data.message);
          }
        });
    },
  },
};
</script>
