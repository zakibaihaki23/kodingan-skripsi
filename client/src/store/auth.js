import axios from 'axios';

export default {
  namespaced: true,
  state: {
    token: null,
    user: null,
    // admin: null,
  },
  getters: {
    authenticated(state) {
      return state.token && state.user;
    },
    // authAdmin(state) {
    //     return state.token && state.admin;
    // },
    user(state) {
      return state.user;
    },
    // admin(state) {
    //     return state.admin;
    // }
  },
  mutations: {
    SET_TOKEN(state, token) {
      state.token = token;
    },
    SET_USER(state, user) {
      state.user = user;
    },
    // SET_ADMIN(state, admin) {
    //     state.admin = admin;
    // }
  },
  actions: {
    async signIn({ dispatch }, credentials) {
      let response = await axios.post(
        process.env.VUE_APP_API_URL + '/login',
        credentials
      );
      const user = response.data.user;
      // localStorage.setItem('user', user)
      // console.log(user)
      dispatch('user', user);

      return dispatch('attempt', response.data.token);
    },
    // async signInAdmin({ dispatch }, credentials) {
    //     let response = await axios.post(
    //         process.env.VUE_APP_API_URL + "/admin",
    //         credentials
    //     );

    //     const admin = response.data.admin;
    //     // localStorage.setItem('admin', admin)
    //     // console.log(admin);
    //     dispatch("admin", admin);

    //     return dispatch("attempt", response.data.token);
    // },
    async user({ commit }, user) {
      commit('SET_USER', user);
    },
    // async admin({ commit }, admin) {
    //     commit("SET_ADMIN", admin);
    // },
    async attempt({ commit, state }, token) {
      if (token) {
        commit('SET_TOKEN', token);
      }
      if (!state.token) {
        return;
      }
    },
  },
};
