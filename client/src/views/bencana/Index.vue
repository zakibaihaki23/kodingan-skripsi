<template>
  <div id="app">
    <div v-if="this.user.role == 'User'">
      <IndexUser></IndexUser>
    </div>
    <div v-if="this.user.role == 'Admin'">
      <IndexAdmin></IndexAdmin>
    </div>
    <div v-if="this.user.role == 'Camat'">
      <IndexCamat></IndexCamat>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from "vuex";
  import IndexCamat from "./Camat/IndexCamat.vue";
  import IndexAdmin from "./Admin/IndexAdmin.vue";
  import IndexUser from "./User/IndexUser.vue";

  export default {
    components: { IndexCamat, IndexAdmin, IndexUser },
    computed: {
      ...mapGetters({
        user: "auth/user",
      }),
    },
  };
</script>

<style scoped lang="scss">
  // .mytable table tr {
  //   border: none;
  // }
  // .v-data-table > .v-data-table__wrapper > table > tbody > tr > td {
  //   font-size: 17px;
  // }
  .helper {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
      "Open Sans", "Helvetica Neue", sans-serif;
    padding-left: 80px;
    padding-right: 50px;
  }

  // .v-btn:not(.v-btn--round).v-size--default {
  //   position: absolute;
  //   width: 200px;
  //   height: 50px;
  //   background: #4662d4;
  //   color: white;
  //   border-radius: 30px;
  //   font-size: 16px;
  //   margin-top: 50px;
  //   font-weight: bold;
  //   text-transform: capitalize;
  //   cursor: pointer;
  //   padding: 5px;
  // }
  .search {
    padding-left: 100px;
    padding-right: 50px;
    margin-top: 50px;
  }
  .search2 {
    margin-top: 150px;
    margin-right: 150px;
    box-sizing: content-box;
    width: 150px;
  }
  .v-menu__content {
    border-radius: 8px;
    border: 1px solid #c4c4c4;
    outline-style: inherit;
    outline-color: white;
    box-shadow: none;

    outline-color: #e8eff2;
  }
  .v-sheet.v-list {
    background: #e8eff2;
  }
  .mobile {
    color: #333;
  }

  @media screen and (max-width: 768px) {
    .mobile table.v-table tr {
      max-width: 100%;
      position: relative;
      display: block;
    }

    .mobile table.v-table tr:nth-child(odd) {
      border-left: 6px solid deeppink;
    }

    .mobile table.v-table tr:nth-child(even) {
      border-left: 6px solid cyan;
    }

    .mobile table.v-table tr td {
      display: flex;
      width: 100%;
      border-bottom: 1px solid #f5f5f5;
      height: auto;
      padding: 10px;
    }

    .mobile table.v-table tr td ul li:before {
      content: attr(data-label);
      padding-right: 0.5em;
      text-align: left;
      display: block;
      color: #999;
    }
    .v-datatable__actions__select {
      width: 50%;
      margin: 0px;
      justify-content: flex-start;
    }
    .mobile .theme--light.v-table tbody tr:hover:not(.v-datatable__expand-row) {
      background: transparent;
    }
  }
  .flex-content {
    padding: 0;
    margin: 0;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    width: 100%;
  }

  .flex-item {
    padding: 5px;
    width: 50%;
    height: 60px;
  }
</style>
