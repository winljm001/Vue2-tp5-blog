import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    // this.$store.state.mainTitle
    // 公共
    mainTitle: ""
  },
  getters: {
    // this.$store.getters.comingMovieList
    comingMovieList: state => state.comingMovieList
  },
  mutations: {
    // this.$store.commit('SET_MAIN_TITLE',title);
    // 公共
    SET_MAIN_TITLE(state, res) {
      state.mainTitle = res;
    }
  },
  actions: {
    // this.$store.dispatch('getComingMovieList');
    getComingMovieList({ commit, state }) {
      if (!state.comingMovieListLoading) {
        commit("SET_COMING_MOVIE_LIST_LOADING", true);
        var start = state.comingMovieList.length;
        Vue.prototype.axios
          .get("/movie/coming_soon?count=10&start=" + start)
          .then(function(response) {
            console.log(1);
          })
          .catch(function(error) {
            console.log(error);
          });
      }
    }
  }
});

export default store;
