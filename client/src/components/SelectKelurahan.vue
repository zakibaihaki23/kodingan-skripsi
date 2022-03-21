<template>
  <div>
    <v-tooltip top>
      <template v-slot:activator="{ on, attrs }">
        <v-autocomplete
          v-on="on"
          v-bind="attrs"
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
      </template>
      <span>Cari Berdasarkan Kelurahan</span>
    </v-tooltip>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  export default {
    name: "KelurahanSelected",
    data() {
      return {
        search: null,
        item_list: null,
        items: [],
      };
    },
    props: ["clear", "item"],

    mounted() {
      this.renderData("", this.kelurahanId);
    },
    watch: {
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
      renderData(search) {
        // GET PACKABLE WHEN 0
        this.$http
          .get("/kecamatan", {
            params: {
              id: `${this.user.instansi_id}`,
            },
          })
          .then((response) => {
            this.items = [];

            let array = response.data.data[0].kelurahan;

            for (let i = 0; i < array.length; i++) {
              this.items.push({
                name: array[i].nama_kelurahan,
                value: array[i].id,
              });
            }
          });
      },
      selected(event) {
        this.$emit("selected", event);
      },
    },
  };
</script>
