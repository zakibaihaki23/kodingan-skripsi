import Vue from "vue";
import VueRouter from "vue-router";
import MainLayout from "./layout/index";
import EmptyLayout from "./layout/empty";
import store from "./store";

Vue.use(VueRouter);

const routes = [
  {
    component: EmptyLayout,
    path: "",
    open: false,
    beforeEnter: (to, from, next) => {
      if (store.getters["auth/authenticated"]) {
        return next({
          name: "Dashboard",
        });
      }
      next();
    },
    children: [
      {
        name: "Login",
        component: () => import("./views/auth/Login"),
        path: "",
      },
    ],
  },
  {
    name: "Dashboard Page",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/dashboard-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Dashboard",
        component: () => import("./views/dashboard/Dashboard"),
        path: "/dashboard",
      },
    ],
  },
  {
    name: "PBB Page",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/pbb-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Laporan Realisasi PBB",
        component: () => import("./views/pbb/Index"),
        path: "/pbb",
      },
      {
        name: "Input Data Realisasi PBB",
        component: () => import("./views/pbb/Create"),
        path: "/pbb/add",
      },
      {
        name: "Update Data Realisasi PBB",
        component: () => import("./views/pbb/Detail"),
        path: "/pbb/update/:id",
      },
      {
        name: "Hapus Data Realisasi PBB",
        component: () => import("./views/pbb/Index"),
        path: "/pbb/delete/:id",
      },
    ],
  },
  {
    name: "Paten Page",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/paten-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Laporan Rekapitulasi PATEN",
        component: () => import("./views/paten/Index"),
        path: "/paten",
      },
      {
        name: "Input Data Rekapitulasi PATEN",
        component: () => import("./views/paten/Create"),
        path: "/paten/add",
      },
      {
        name: "Update Data Rekapitulasi PATEN",
        component: () => import("./views/paten/Detail"),
        path: "/paten/update/:id",
      },
      {
        name: "Hapus Data Rekapitulasi PATEN",
        component: () => import("./views/paten/Index"),
        path: "/paten/delete/:id",
      },
    ],
  },
  {
    name: "Kependudukan",
    icon: "mdi-account",
    component: MainLayout,
    path: "/pendudukan",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Laporan Kependudukan",
        component: () => import("./views/kependudukan/Index"),
        path: "/kependudukan",
      },
      {
        name: "Input Data Kependudukan",
        component: () => import("./views/kependudukan/Create"),
        path: "/kependudukan/add",
      },
      {
        name: "Update Data Kependudukan",
        component: () => import("./views/kependudukan/Detail"),
        path: "/kependudukan/update/:id",
      },
      {
        name: "Hapus Data Kependudukan",
        component: () => import("./views/kependudukan/Index"),
        path: "/kependudukan/delete/:id",
      },
    ],
  },
  {
    name: "Imunisasi",
    icon: "mdi-account",
    component: MainLayout,
    path: "/imun",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Laporan Imunisasi",
        component: () => import("./views/imunisasi/Index"),
        path: "/imunisasi",
      },
      {
        name: "Input Data Imunisasi",
        component: () => import("./views/imunisasi/Create"),
        path: "/imunisasi/add",
      },
      {
        name: "Update Data Imunisasi",
        component: () => import("./views/imunisasi/Detail"),
        path: "/imunisasi/update/:id",
      },
      {
        name: "Hapus Data Imunisasi",
        component: () => import("./views/imunisasi/Index"),
        path: "/imunisasi/delete/:id",
      },
    ],
  },
  {
    name: "Bencana",
    icon: "mdi-account",
    component: MainLayout,
    path: "/pendudukan",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Laporan Keadaan Bencana Alam",
        component: () => import("./views/bencana/Index"),
        path: "/bencana",
      },
      {
        name: "Input Data Keadaan Bencana Alam",
        component: () => import("./views/bencana/Create"),
        path: "/bencana/add",
      },
      {
        name: "Update Data Keadaan Bencana Alam",
        component: () => import("./views/bencana/Detail"),
        path: "/bencana/update/:id",
      },
      {
        name: "Hapus Data Keadaan Bencana Alam",
        component: () => import("./views/bencana/Index"),
        path: "/bencana/delete/:id",
      },
    ],
  },

  {
    name: "Profile Page",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/profile-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Ubah Profil",
        component: () => import("./views/user/Profile"),
        path: "/profile",
      },
    ],
  },

  {
    name: "Report",
    component: MainLayout,
    path: "/report",
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Download Laporan",
        component: () => import("./views/download/Index"),
        path: "/report",
      },
    ],
  },
  {
    name: "Auth Admin",
    component: EmptyLayout,
    path: "/admin-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (store.getters["auth/authAdmin"]) {
        return next({
          name: "Dashboard",
        });
      }
      if (store.getters["auth/authenticated"]) {
        return next({
          name: "PBB",
        });
      }
      next();
    },
    children: [
      {
        name: "Login Admin",
        component: () => import("./views/auth/Login Admin"),
        path: "/admin",
      },
      {
        path: "/admin-2",
      },
    ],
  },
  {
    name: "User CRUD",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/pbb-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Kelola User",
        component: () => import("./views/user/Index"),
        path: "/user",
      },
      {
        name: "Input Data User",
        component: () => import("./views/user/Create"),
        path: "/user/create",
      },
      {
        name: "Edit Data User",
        component: () => import("./views/user/Detail"),
        path: "/user/update/:id",
      },
      // {
      //   name: "DELETE PBB",
      //   component: () => import("./views/pbb/Index"),
      //   path: "/pbb/delete/:id",
      // },
    ],
  },
  {
    name: "Informasi Page",
    icon: "mdi-view-dashboard",
    component: MainLayout,
    path: "/pbb-page",
    open: false,
    beforeEnter: (to, from, next) => {
      if (!store.getters["auth/authenticated"]) {
        return next({
          name: "Login",
        });
      }
      next();
    },
    children: [
      {
        name: "Kelola Informasi",
        component: () => import("./views/informasi/Index"),
        path: "/informasi",
      },
      {
        name: "Input Data Informasi",
        component: () => import("./views/informasi/Create"),
        path: "/informasi/add",
      },
      {
        name: "Edit Informasi",
        component: () => import("./views/informasi/Detail"),
        path: "/informasi/update/:id",
      },
      {
        name: "DELETE Informasi",
        component: () => import("./views/informasi/Index"),
        path: "/informasi/delete/:id",
      },
    ],
  },
  // {
  //   name: 'Dashboard Admin',
  //   icon: 'mdi-view-dashboard',
  //   component: MainLayout,
  //   path: '/admin-page',
  //   open: false,
  //   beforeEnter: (to, from, next) => {
  //     if (!store.getters['auth/authAdmin']) {
  //       return next({
  //         name: 'Login Admin',
  //       });
  //     }
  //     next();
  //   },
  //   children: [
  //     {
  //       name: 'Dashboard',
  //       component: () => import('./views/admin/PBB/Index'),
  //       path: '/dashboard',
  //     },
  //     {
  //       name: 'Laporan BB',
  //       component: () => import('./views/admin/PBB/Report PBB'),
  //       path: '/admin/report/pbb',
  //     },
  //     {
  //       name: 'Kelola User',
  //       component: () => import('./views/admin/User/Kelola User'),
  //       path: '/user',
  //     },
  //     {
  //       name: 'Tambah User',
  //       component: () => import('./views/admin/User/Create'),
  //       path: '/user/tambah',
  //     },
  //   ],
  // },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.VUE_BASE_URL,
  routes,
});

router.beforeEach((to, from, next) => {
  document.title = `${to.name} - SIMAK Kabupaten Pandeglang`;
  next();
});

export default router;
