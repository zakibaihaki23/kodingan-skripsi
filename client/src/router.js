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
        name: "PBB",
        component: () => import("./views/pbb/Index"),
        path: "/pbb",
      },
      {
        name: "Input Data PBB",
        component: () => import("./views/pbb/Create"),
        path: "/pbb/create",
      },
      {
        name: "Edit Data PBB",
        component: () => import("./views/pbb/Detail"),
        path: "/pbb/:id",
      },
      {
        name: "DELETE PBB",
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
        name: "Paten",
        component: () => import("./views/paten/Index"),
        path: "/paten",
      },
      {
        name: "Akta",
        component: () => import("./views/akta/Index"),
        path: "/akta",
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
        component: () => import("./views/admin/User/Profile"),
        path: "/profile",
      },
    ],
  },

  // {
  //   name: 'Create',
  //   icon: 'mdi-view-dashboard',
  //   component: MainLayout,
  //   path: '/pbb',
  //   open: false,
  //   beforeEnter: (to, from, next) => {
  //     if (!store.getters['auth/authenticated']) {
  //       return next({
  //         name: 'Login',
  //       });
  //     }
  //     next();
  //   },
  //   children: [

  //   ],
  // },
  {
    name: "Lap Kependudukan",
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
    ],
  },
  {
    name: "Report User",
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
        name: "Laporan PBB",
        component: () => import("./views/pbb/Report"),
        path: "/report/pbb",
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
