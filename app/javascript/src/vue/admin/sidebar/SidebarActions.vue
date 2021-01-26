<template>
  <li class="nav-item sidebar-actions">
    <div class="border-bottom">
      <h6 class="font-weight-normal mb-3">{{title}}</h6>
    </div>
  </li>
</template>

<script>
export default {
  props: ["title"],
};
</script>