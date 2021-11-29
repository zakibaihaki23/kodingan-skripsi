<template>
  <div>
    <!-- USER -->
    <v-app-bar class="appbar" color="white" flat v-if="user.role == 'User'">
      <v-app-bar-nav-icon @click="toggleDrawer()" />

      <v-spacer />
      <v-list style="margin-right: 30px">
        <v-list-item-title style="font-weight: bold; text-transform: uppercase">{{ user.name }}</v-list-item-title>
        <v-list-item-title style="text-align: right">{{ user.nama_instansi }}</v-list-item-title>
      </v-list>
      <v-btn dense icon :to="{ path: '/profile' }" class="d-none d-sm-none d-sm-flex" small>
        <v-badge
          bordered
          color="green"
          content="6"
          dot
          offset-x="25"
          offset-y="9"
          class="d-none d-sm-none d-sm-flex"
        >
          <v-avatar color="orange" style="margin-right: 15px" class="d-none d-sm-none d-sm-flex">
            <span class="white--text text-h5">
              {{
              user.name
              .split(" ")
              .map((x) => x.charAt(0))
              .join("")
              .substr(0, 2)
              .toUpperCase()
              }}
            </span>
          </v-avatar>
        </v-badge>
      </v-btn>

      <v-list class="d-none d-sm-none d-sm-flex" style="margin-left: 20px">
        <v-list-item-title style="cursor: pointer" @click="logout">
          <v-icon left style="margin-left: 12px; color: grey">mdi-logout</v-icon>

          <v-list-item-title>Keluar</v-list-item-title>
        </v-list-item-title>
      </v-list>

      <v-menu left offset-y transition="slide-x-transition">
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            dense
            v-bind="attrs"
            v-on="on"
            icon
            class="d-sm-none d-md-none d-lg-none d-xl-none"
          >
            <v-badge bordered color="green" content="6" dot offset-x="21" offset-y="9">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
            </v-badge>
          </v-btn>
        </template>
        <v-card width="150px">
          <v-list-item-content class="justify-center">
            <div class="mx-auto text-center">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
              <h5 style="margin-top: 10px">{{ user.name }}</h5>
              <p class="text-caption mt-1">{{ user.nama_instansi }}</p>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text :to="{ path: '/profile' }">Profile</v-btn>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text @click="logout">Keluar</v-btn>
            </div>
          </v-list-item-content>
        </v-card>
      </v-menu>
    </v-app-bar>

    <!-- ADMIN -->
    <v-app-bar class="appbar" color="white" flat v-if="user.role == 'Admin'">
      <v-app-bar-nav-icon @click="toggleDrawer()" />

      <v-spacer />
      <v-list style="margin-right: 30px">
        <v-list-item-title style="font-weight: bold; text-transform: uppercase">{{ user.name }}</v-list-item-title>
        <v-list-item-title style="text-align: right">{{ user.nama_instansi }}</v-list-item-title>
      </v-list>
      <v-btn dense icon :to="{ path: '/profile' }" class="d-none d-sm-none d-sm-flex" small>
        <v-badge
          bordered
          color="green"
          content="6"
          dot
          offset-x="25"
          offset-y="9"
          class="d-none d-sm-none d-sm-flex"
        >
          <v-avatar color="orange" style="margin-right: 15px" class="d-none d-sm-none d-sm-flex">
            <span class="white--text text-h5">
              {{
              user.name
              .split(" ")
              .map((x) => x.charAt(0))
              .join("")
              .substr(0, 2)
              .toUpperCase()
              }}
            </span>
          </v-avatar>
        </v-badge>
      </v-btn>

      <v-list class="d-none d-sm-none d-sm-flex" style="margin-left: 20px">
        <v-list-item-title style="cursor: pointer" @click="logout">
          <v-icon left style="margin-left: 12px; color: grey">mdi-logout</v-icon>

          <v-list-item-title>Keluar</v-list-item-title>
        </v-list-item-title>
      </v-list>

      <v-menu left offset-y transition="slide-x-transition">
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            dense
            v-bind="attrs"
            v-on="on"
            icon
            class="d-sm-none d-md-none d-lg-none d-xl-none"
          >
            <v-badge bordered color="green" content="6" dot offset-x="21" offset-y="9">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
            </v-badge>
          </v-btn>
        </template>
        <v-card width="150px">
          <v-list-item-content class="justify-center">
            <div class="mx-auto text-center">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
              <h5 style="margin-top: 10px">{{ user.name }}</h5>
              <p class="text-caption mt-1">{{ user.nama_instansi }}</p>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text :to="{ path: '/profile' }">Profile</v-btn>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text @click="logout">Logout</v-btn>
            </div>
          </v-list-item-content>
        </v-card>
      </v-menu>
    </v-app-bar>

    <!-- CAMAT -->
    <v-app-bar class="appbar" color="white" flat v-if="user.role == 'Camat'">
      <v-app-bar-nav-icon @click="toggleDrawer()" />

      <v-spacer />
      <v-list style="margin-right: 30px">
        <v-list-item-title style="font-weight: bold; text-transform: uppercase">{{ user.name }}</v-list-item-title>
        <v-list-item-title style="text-align: right">{{ user.nama_instansi }}</v-list-item-title>
      </v-list>
      <v-btn dense icon :to="{ path: '/profile' }" class="d-none d-sm-none d-sm-flex" small>
        <v-badge
          bordered
          color="green"
          content="6"
          dot
          offset-x="25"
          offset-y="9"
          class="d-none d-sm-none d-sm-flex"
        >
          <v-avatar color="orange" style="margin-right: 15px" class="d-none d-sm-none d-sm-flex">
            <span class="white--text text-h5">
              {{
              user.name
              .split(" ")
              .map((x) => x.charAt(0))
              .join("")
              .substr(0, 2)
              .toUpperCase()
              }}
            </span>
          </v-avatar>
        </v-badge>
      </v-btn>

      <v-list class="d-none d-sm-none d-sm-flex" style="margin-left: 20px">
        <v-list-item-title style="cursor: pointer" @click="logout">
          <v-icon left style="margin-left: 12px; color: grey">mdi-logout</v-icon>

          <v-list-item-title>Keluar</v-list-item-title>
        </v-list-item-title>
      </v-list>

      <v-menu left offset-y transition="slide-x-transition">
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            dense
            v-bind="attrs"
            v-on="on"
            icon
            class="d-sm-none d-md-none d-lg-none d-xl-none"
          >
            <v-badge bordered color="green" content="6" dot offset-x="21" offset-y="9">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
            </v-badge>
          </v-btn>
        </template>
        <v-card width="150px">
          <v-list-item-content class="justify-center">
            <div class="mx-auto text-center">
              <v-avatar color="orange" style="margin-right: 10px">
                <span class="white--text text-h5">
                  {{
                  user.name
                  .split(" ")
                  .map((x) => x.charAt(0))
                  .join("")
                  .substr(0, 2)
                  .toUpperCase()
                  }}
                </span>
              </v-avatar>
              <h5 style="margin-top: 10px">{{ user.name }}</h5>
              <p class="text-caption mt-1">{{ user.nama_instansi }}</p>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text :to="{ path: '/profile' }">Profile</v-btn>
              <v-divider class="my-3"></v-divider>
              <v-btn depressed rounded text @click="logout">Logout</v-btn>
            </div>
          </v-list-item-content>
        </v-card>
      </v-menu>
    </v-app-bar>

    <v-navigation-drawer
      enable-resize-watcher
      v-model="drawer.display"
      app
      color="#42A5F5"
      height="100%"
      :dark="false"
      style="border-bottom-right-radius: 25px; border-top-right-radius: 25px"
    >
      <v-list>
        <v-list-item-group>
          <v-list-item>
            <v-img src="@/assets/pandeglang_logo.png" class="text-start" max-width="60"></v-img>
            <v-list-item-content>
              <h1 style="color: white" class="text-center">SIMAK</h1>
              <h2 style="color: white; font-size: 15px" class="text-center">Kabupaten Pandeglang</h2>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
      <!-- USER -->
      <v-list class="nav" v-if="user.role == 'User'">
        <v-list-item-group>
          <v-list-item v-for="(userRoute, usr) in users" :key="usr" :to="userRoute.path" link>
            <v-list-item-icon>
              <v-icon style="color: white; padding-left: 20px">{{ userRoute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{
                userRoute.name
                }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- ADMIN-->
      <v-list class="nav" v-if="user.role == 'Admin'">
        <v-list-item-group>
          <v-list-item v-for="(adminroute, adm) in adminNav" :key="adm" :to="adminroute.path" link>
            <v-list-item-icon>
              <v-icon style="color: white; padding-left: 20px">{{ adminroute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{
                adminroute.name
                }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- CAMAT -->
      <v-list class="nav" v-if="user.role == 'Camat'">
        <v-list-item-group>
          <v-list-item v-for="(camatroute, cmt) in camatNav" :key="cmt" :to="camatroute.path" link>
            <v-list-item-icon>
              <v-icon style="color: white; padding-left: 20px">{{ camatroute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{
                camatroute.name
                }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data: () => ({
    drawer: {
      display: null,
      data: []
    },
    users: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard"
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city"
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple"
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account"
      },
      {
        name: "Akta",
        path: "/akta",
        icon: "mdi-contacts"
      }
    ],
    adminNav: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard"
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city"
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple"
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account"
      },
      {
        name: "Akta",
        path: "/akta",
        icon: "mdi-contacts"
      },
      {
        name: "Kelola User",
        path: "/user",
        icon: "mdi-account-multiple-outline"
      }
    ],
    camatNav: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard"
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city"
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple"
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account"
      },
      {
        name: "Akta",
        path: "/akta",
        icon: "mdi-contacts"
      },
      {
        name: "Kelola User",
        path: "/user",
        icon: "mdi-account-multiple-outline"
      }
    ]
  }),
  methods: {
    toggleDrawer() {
      this.drawer.display = !this.drawer.display;
    },
    getRoutes() {
      this.$router.options.routes.forEach(route => {
        this.drawer.data.push(route);
      });
    },
    logout() {
      window.localStorage.clear();
      window.location.reload();
    }
  },

  created() {
    this.getRoutes();
  },
  computed: {
    ...mapGetters({
      authenticated: "auth/authenticated",
      user: "auth/user"
    })
  }
};
</script>

<style scoped>
.h-sticky {
  position: sticky;
  top: 0;
  z-index: 2;
}
.elevation-1 {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
}

/* .v-list-item.v-list-item:active {

  } */

/* .list-item: {
    color: yellow;
  } */
.nav .v-list-item-group .v-list-item--active {
  /* background-color: #323849; */
  background-color: #1976d2;
}
.v-list-group__items--active {
  background-color: black;
}
.v-list-item__title text {
  color: black;
}

/* .v-list-item--active {
    background-color: #323849;
  } */
</style>
