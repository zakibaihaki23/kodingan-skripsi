<template>
  <div>
    <v-autocomplete
      outlined
      single-line
      :search-input.sync="search"
      style="border-radius: 10px; width: 250px; font-size: 13px"
      item-text="name"
      item-value="value"
      v-model="item_list"
      :items="items"
      required
      @change="selected"
      append-icon=""
      clearable
      return-object
      label="Kelurahan"
      dense
    >
    </v-autocomplete>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "AddPackableItem",
  data() {
    return {
      search: null,
      item_list: null,
      items: [],
    };
  },
  props: ["clear", "item"],

  mounted() {
    this.renderData("");
  },
  watch: {
    kecamatanId: {
      handler: function (val) {
        if (val) {
          this.item_list = null;
          this.renderData("", val);
        }
      },
    },
    kelurahan: {
      handler: function (val) {
        if (val == null) {
          this.item_list = null;
        }
      },
    },
    search: {
      handler: function (val) {
        if (val) {
          this.renderData(val);
        }
      },
      deep: true,
    },
    clear: {
      handler: function (val) {
        this.renderData("");
        if (val == true) {
          this.item_list = "";
        }
      },
      deep: true,
    },
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
  methods: {
    renderData(search, kecamatanId) {
      // GET PACKABLE WHEN 0
      if (this.user.role == "User") {
        this.$http
          .get("/kelurahan", {
            params: {
              id_instansi: `${this.user.id_instansi}`,
            },
          })
          .then((response) => {
            this.items = [];

            let array = response.data.data;

            for (let i = 0; i < array.length; i++) {
              this.items.push({
                name: array[i].kelurahan,
                value: array[i].id,
              });
              // this.itemSelected(response.data.data)
            }
          });
      } else {
        this.$http
          .get("/kelurahan", {
            params: {
              id_instansi: kecamatanId,
            },
          })
          .then((response) => {
            this.items = response.data.data;
            this.items = [];

            let array = response.data.data;

            for (let i = 0; i < array.length; i++) {
              this.items.push({
                name: array[i].kelurahan,
                value: array[i].id,
              });
              // this.itemSelected(response.data.data)
            }
          });
      }
    },
    selected(event) {
      this.$emit("selected", event);
    },
  },
};
</script>
