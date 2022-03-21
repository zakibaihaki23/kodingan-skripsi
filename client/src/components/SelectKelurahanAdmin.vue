<template>
  <div>
    <v-tooltip top>
      <template v-slot:activator="{ on, attrs }">
        <v-autocomplete
          v-on="on"
          v-bind="attrs"
          outlined
          single-line
          style="border-radius: 10px; width: 250px; font-size: 13px"
          item-text="name"
          item-value="value"
          v-model="kelurahan"
          :items="items"
          required
          @change="selected"
          append-icon=""
          clearable
          return-object
          :disabled="disabled"
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
  export default {
    name: "KelurahanSelected",
    data() {
      return {
        search: null,
        kelurahan: null,
        items: [],
      };
    },
    props: ["clear", "disabled", "kecamatanId"],

    mounted() {
      this.renderData("", this.kecamatanId);
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
      kecamatanId: {
        handler: function (val) {
          if (val) {
            this.kelurahan = null;
            this.renderData("", val);
          }
        },
      },
    },
    methods: {
      renderData(search, kecamatanId) {
        this.$http
          .get("/kecamatan", {
            params: {
              id: kecamatanId,
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
