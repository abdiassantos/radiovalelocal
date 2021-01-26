<template>
  <li class="nav-item">
    <a class="nav-link"
       :href="`${link ? link : '#'}`"
       :class="`${active == 'true' ? 'active' : ''}`">
      <slot></slot>
    </a>
  </li>
</template>

<script>
export default {
  props: ["title", "link", "active"],
};
</script>