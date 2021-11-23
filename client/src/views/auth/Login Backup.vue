<template>
  <div id="app">
    <v-app>
      <v-dialog v-model="dialog" persistent max-width="600px" min-width="360px">
        <div>
          <v-tabs v-model="tab" background-color="#1E88E5" icons-and-text dark grow>
            <v-img src="@/assets/logo.png"></v-img>
            <v-tabs-slider color="#64B5F6"></v-tabs-slider>
            <v-tab>
              <div style="margin-top: 4px; font-size: 20px">
                SIMAK<br />
                <strong>Kabupaten Pandeglang</strong>
              </div>
            </v-tab>
            <v-tab-item>
              <v-card class="px-4">
                <v-card-text>
                  <v-form ref="loginForm" v-model="valid" lazy-validation>
                    <v-row>
                      <v-col cols="12">
                        <v-text-field
                          v-model="user.username"
                          label="Username"
                          :rules="[rules.required, rules.minmin]"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          v-model="user.password"
                          :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
                          :type="value ? 'password' : 'text'"
                          :rules="[rules.required, rules.min]"
                          name="input-10-1"
                          label="Password"
                          @click:append="value = !value"
                          @keyup.enter="userLogin"
                        ></v-text-field>
                      </v-col>
                      <v-col class="d-flex" cols="12" sm="6" xsm="12"> </v-col>
                      <v-spacer></v-spacer>
                      <v-col>
                        <!-- <v-btn
                          x-large
                          block
                          :disabled="!validated"
                          color="success"
                          @click="userLogin"
                        >
                          Login
                        </v-btn> -->
                        <v-btn
                          style="
                            background: #bbdefb;
                            height: 50px;
                            margin-bottom: 15px;
                            margin-top: 0px;
                          "
                          elevation="1"
                          block
                          :disabled="!validated"
                          @click="userLogin"
                        >
                          <!----><!----><span>Login</span>
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
      value: String,
      tab: 0,
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
      validated: function() {
        return this.user.username.length > 5 && this.user.password.length > 7;
      },
    },
    methods: {
      ...mapActions({
        signIn: "auth/signIn",
      }),
      userLogin() {
        this.signIn(this.user)
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

<style scoped>
  button {
    height: 150px;
    border-radius: 90px;
    color: blue;
    cursor: pointer;
    text-transform: capitalize;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
  }
</style>
