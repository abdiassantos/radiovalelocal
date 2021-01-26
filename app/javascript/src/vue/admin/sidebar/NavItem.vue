<template>
  <li class="nav-item" :class="`${active == 'true' ? 'active' : ''}`">
    <a class="nav-link" 
       :href="`${link ? link : '#'}`"
       :class="`${active == 'true' ? 'active' : ''}`">
      <span class="menu-title">{{title}}</span>
      <i :class="`mdi mdi-${icon ? icon : 'help-circle-outline'} menu-icon`"></i>
    </a>
  </li>
</template>

<script>
export default {
  props: ["title", "icon", "link", "active"],
};
</script>