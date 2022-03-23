<template>
  <div>
    <AppBar> </AppBar>
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
            <v-img
              src="@/assets/pandeglang_logo.png"
              class="text-start"
              max-width="60"
            ></v-img>
            <v-list-item-content>
              <h1 style="color: white" class="text-center">SIPK</h1>
              <h2 style="color: white; font-size: 15px" class="text-center">
                Kabupaten Pandeglang
              </h2>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
      <!-- USER -->
      <v-list class="nav" v-if="user.role == 'User'">
        <v-list-item-group>
          <v-list-item
            v-for="(userRoute, usr) in kecamatan"
            :key="usr"
            :to="userRoute.path"
            link
          >
            <v-list-item-icon>
              <v-icon style="color: white">{{ userRoute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ userRoute.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- ADMIN-->
      <v-list class="nav" v-if="user.role == 'Admin'">
        <v-list-item-group>
          <v-list-item
            v-for="(adminroute, adm) in adminNav"
            :key="adm"
            :to="adminroute.path"
            link
          >
            <v-list-item-icon>
              <v-icon style="color: white">{{ adminroute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ adminroute.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- KELURAHAN-->
      <v-list class="nav" v-if="user.role == 'Kelurahan'">
        <v-list-item-group>
          <v-list-item
            v-for="(admKelurahan, kel) in users"
            :key="kel"
            :to="admKelurahan.path"
            link
          >
            <v-list-item-icon>
              <v-icon style="color: white">{{ admKelurahan.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ admKelurahan.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- SEKDA -->
      <v-list class="nav" v-if="user.role == 'Sekda'">
        <v-list-item-group>
          <v-list-item
            v-for="(sekdaRoute, cmt) in users"
            :key="cmt"
            :to="sekdaRoute.path"
            link
          >
            <v-list-item-icon>
              <v-icon style="color: white">{{ sekdaRoute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ sekdaRoute.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- CAMAT -->
      <v-list class="nav" v-if="user.role == 'Camat'">
        <v-list-item-group>
          <v-list-item
            v-for="(camatroute, cmt) in users"
            :key="cmt"
            :to="camatroute.path"
            link
          >
            <v-list-item-icon>
              <v-icon style="color: white">{{ camatroute.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ camatroute.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>

      <!-- Lurah -->
      <v-list class="nav" v-if="user.role == 'Lurr'">
        <v-list-item-group>
          <v-list-item v-for="(lurah, lrh) in users" :key="lrh" :to="lurah.path" link>
            <v-list-item-icon>
              <v-icon style="color: white">{{ lurah.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text" style="color: white">
                {{ lurah.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
import AppBar from "./appBar";
import { mapGetters } from "vuex";

export default {
  components: { AppBar },
  data: () => ({
    drawer: {
      display: null,
      data: [],
    },
    users: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard",
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city",
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple",
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account",
      },
      {
        name: "Imunisasi",
        path: "/imunisasi",
        icon: "mdi-hospital",
      },
      {
        name: "Bencana Alam",
        path: "/bencana",
        icon: "mdi-home-flood",
      },
      {
        name: "Download Laporan",
        path: "/report",
        icon: "mdi-file-download",
      },
    ],
    kecamatan: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard",
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city",
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple",
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account",
      },
      {
        name: "Imunisasi",
        path: "/imunisasi",
        icon: "mdi-hospital",
      },
      {
        name: "Bencana Alam",
        path: "/bencana",
        icon: "mdi-home-flood",
      },
      {
        name: "Kelola User",
        path: "/user",
        icon: "mdi-account-multiple-outline",
      },
      {
        name: "Download Laporan",
        path: "/report",
        icon: "mdi-file-download",
      },
    ],
    adminNav: [
      {
        name: "Dashboard",
        path: "/dashboard",
        icon: "mdi-view-dashboard",
      },
      {
        name: "PBB",
        path: "/pbb",
        icon: "mdi-city",
      },
      {
        name: "Paten",
        path: "/paten",
        icon: "mdi-note-multiple",
      },
      {
        name: "Kependudukan",
        path: "/kependudukan",
        icon: "mdi-account",
      },
      {
        name: "Imunisasi",
        path: "/imunisasi",
        icon: "mdi-hospital",
      },
      {
        name: "Bencana Alam",
        path: "/bencana",
        icon: "mdi-home-flood",
      },
      {
        name: "Informasi",
        path: "/informasi",
        icon: "mdi-information",
      },
      {
        name: "Kelola User",
        path: "/user",
        icon: "mdi-account-multiple-outline",
      },
      {
        name: "Download Laporan",
        path: "/report",
        icon: "mdi-file-download",
      },
    ],
  }),
  methods: {
    toggleDrawer() {
      this.drawer.display = !this.drawer.display;
    },
    getRoutes() {
      this.$router.options.routes.forEach((route) => {
        this.drawer.data.push(route);
      });
    },
    logout() {
      window.localStorage.clear();
      window.location.reload();
    },
  },

  created() {
    this.getRoutes();
  },
  computed: {
    ...mapGetters({
      authenticated: "auth/authenticated",
      user: "auth/user",
    }),
  },
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
