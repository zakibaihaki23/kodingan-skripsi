import Vue from "vue";
import App from "./App.vue";
import vuetify from "./plugins/vuetify";
import router from "./router";
import store from "./store";
import http from "./axios";
import "./plugins/vuetify-money";
import VueMoment from "vue-moment";
import Toast from "vue-toastification";
const moment = require("moment");
import { LMap, LTileLayer, LMarker } from "vue2-leaflet";
import { Icon } from "leaflet";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";
import "leaflet/dist/leaflet.css";

//CHART
import Chartkick from "vue-chartkick";
import Chart from "chart.js";

Vue.use(Chartkick.use(Chart));

Chartkick.options = {
  options: {
    responsive: true,
    lineTension: 1,
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: true,
            padding: 1,
          },
        },
      ],
    },
  },
};

require("moment/locale/id");
//leaflet
Vue.component("l-map", LMap);
Vue.component("l-tile-layer", LTileLayer);
Vue.component("l-marker", LMarker);

delete Icon.Default.prototype._getIconUrl;

Icon.Default.mergeOptions({
  iconRetinaUrl: require("leaflet/dist/images/marker-icon-2x.png"),
  iconUrl: require("leaflet/dist/images/marker-icon.png"),
  shadowUrl: require("leaflet/dist/images/marker-shadow.png"),
});

import "vue-toastification/dist/index.css";
Vue.use(Toast, {
  position: "top-right",
  timeout: 4000,
  closeOnClick: true,
  pauseOnFocusLoss: false,
  pauseOnHover: false,
  draggable: true,
  draggablePercent: 0.6,
  showCloseButtonOnHover: false,
  hideProgressBar: true,
  closeButton: "button",
  icon: true,
  rtl: false,
  transition: "Vue-Toastification__bounce",
});

Vue.use(VueMoment, {
  moment,
});

// BOOTSTRAP
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);

// END BOOTSTRAP
Vue.use(http);

Vue.config.productionTip = false;
require("./store/subscriber");

store.dispatch("auth/attempt", localStorage.getItem("token")).then(() => {
  new Vue({
    vuetify,
    store,
    router,
    render: (h) => h(App),
  }).$mount("#app");
});
