<template>
  <div>
    <v-tooltip top>
      <template v-slot:activator="{ on, attrs }" v-if="this.user.role == 'Kelurahan'">
        <v-select
          v-bind="attrs"
          v-on="on"
          v-model="statusSelected"
          style="border-radius: 10px; width: 250px; font-size: 13px"
          outlined
          label="Status"
          single-line
          :items="statusUser"
          item-text="text"
          item-value="value"
          clearable
          hide-no-data
          hide-selected
          return-object
          :search-input.sync="search"
          @change="selected"
          dense
        >
        </v-select>
      </template>
      <span>Cari Berdasarkan Status</span>
    </v-tooltip>
    <v-tooltip top>
      <template v-slot:activator="{ on, attrs }" v-if="this.user.role == 'User'">
        <v-select
          v-bind="attrs"
          v-on="on"
          v-model="statusSelected"
          style="border-radius: 10px; width: 250px; font-size: 13px"
          outlined
          label="Status"
          single-line
          :items="statusCamat"
          item-text="text"
          item-value="value"
          clearable
          hide-no-data
          hide-selected
          return-object
          :search-input.sync="search"
          @change="selected"
          dense
        >
        </v-select>
      </template>
      <span>Cari Berdasarkan Status</span>
    </v-tooltip>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "SelectStatus",
  data() {
    return {
      statusUser: [
        {
          text: "Menunggu Validasi",
          value: 1,
        },
        {
          text: "Sudah Divalidasi",
          value: 2,
        },
        {
          text: "Ditolak",
          value: 3,
        },
      ],
      statusCamat: [
        {
          text: "Menunggu Validasi",
          value: 1,
        },
        {
          text: "Sudah Divalidasi",
          value: 2,
        },
      ],
      statusSelected: null,
      search: null,
    };
  },
  props: ["clear"],
  watch: {
    clear: {
      handler: function (val) {
        this.renderData("");
      },
      deep: true,
    },
  },
  methods: {
    selected(event) {
      this.$emit("selected", event);
    },
  },
  computed: {
    ...mapGetters({
      user: "auth/user",
    }),
  },
};
</script>
