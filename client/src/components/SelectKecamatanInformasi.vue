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
      label="Kecamatan"
      dense
    >
    </v-autocomplete>
  </div>
</template>

<script>
  export default {
    name: "KecamatanSelected",
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
    methods: {
      renderData(search) {
        // GET PACKABLE WHEN 0
        this.$http.get("/kecamatan").then((response) => {
          this.items = [
            {
              value: 0,
              name: "Semua Kecamatan",
            },
          ];

          let array = response.data.data;

          for (let i = 0; i < array.length; i++) {
            this.items.push({
              name: array[i].nama_instansi,
              value: array[i].id,
            });
            // this.itemSelected(response.data.data)
          }
        });
      },
      selected(event) {
        this.$emit("selected", event);
      },
    },
  };
</script>
