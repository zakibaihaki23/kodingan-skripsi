import Vue from 'vue'
import Vuex from 'vuex'
import auth from './auth'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {},
  plugins: [
    createPersistedState({
      storage: window.localStorage,
    }),
  ],
  mutations: {},
  actions: {},
  modules: {
    auth,
  },
})
