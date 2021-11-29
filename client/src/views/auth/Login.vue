<template>
  <div class="container">
    <div class="row text-center">
      <div class="col-12">
        <v-img
          class="gbr"
          src="@/assets/pandeglang_logo.png"
          alt="logo pandeglang"
          max-height="250"
          max-width="150"
        />
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-6 col-md-offset-3 col-xs-12">
        <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
          <div class="card-body p-4 p-sm-5">
            <h3 class="text-center fw-bold">
              SIMAK
              <br />KABUPATEN PANDEGLANG
            </h3>

            <v-form ref="loginForm" v-model="valid" lazy-validation>
              <div class="form-floating mb-3">
                <v-text-field
                  v-model="user.username"
                  required
                  class="form"
                  single-line
                  outlined
                  label="username"
                  :rules="[rules.required, rules.minmin]"
                  prepend-inner-icon="mdi-account"
                ></v-text-field>
              </div>

              <div class="form-floating mb-3">
                <v-text-field
                  v-model="user.password"
                  :rules="[rules.required, rules.min]"
                  prepend-inner-icon="mdi-lock"
                  label="Password"
                  :type="value ? 'password' : 'text'"
                  :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
                  @click:append="() => (value = !value)"
                  @keyup.enter="userLogin"
                  class="form"
                  outlined
                  single-line
                ></v-text-field>
              </div>

              <div class="d-grid mb-2">
                <v-btn
                  style="height: 50px; background: #007bff; color: white"
                  depressed
                  elevation="1"
                  @click="userLogin"
                  :loading="loading"
                  :disabled="!validated || loading == true"
                  >Login</v-btn
                >
              </div>
            </v-form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapActions } from "vuex";

  export default {
    data: () => ({
      dialog: true,
      loading: false,
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
      validated: function () {
        return this.user.username.length > 5 && this.user.password.length > 7;
      },
    },
    methods: {
      ...mapActions({
        signIn: "auth/signIn",
      }),
      userLogin() {
        this.loading = true;
        this.signIn(this.user)
          .then((response) => {
            let self = this;
            setTimeout(function () {
              self.$router.push("/dashboard");
              window.location.reload();
            }, 10 * 10 * 10);
          })
          .catch((error) => {
            if (error.response.status == 401) {
              this.loading = false;
              this.$toast.error("Harap Isi Email dan Password");
            } else {
              this.loading = false;
              this.$toast.error(error.response.data.message);
            }
          });
      },
    },
  };
</script>

<style scoped>
  body {
    background: #007bff;
    background: linear-gradient(to right, #0062e6, #33aeff);
  }

  button {
    font-size: 0.9rem;
    letter-spacing: 0.05rem;
    padding: 0.75rem 1rem;
    border-radius: 100px;

    cursor: pointer;
    text-transform: capitalize;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
  }

  .gbr {
    max-width: 100%;
    max-height: 100%;
    margin: auto;
    display: block;
  }
  .form {
    height: 60px;
    border-radius: 15px;
    margin: 30px;
    vertical-align: middle;
    text-align: start;
  }
</style>
