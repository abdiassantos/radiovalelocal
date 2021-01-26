<template>
  <li class="nav-item" :class="`${active == 'true' ? 'active' : ''}`">
    <a class="nav-link" 
       data-toggle="collapse"
       :class="`${active != 'true' ? 'collapsed' : ''}`"
       :href="`#ui-${this._uid}`"
       :aria-expanded="`${active == 'true' ? 'true' : 'false'}`"
       :aria-controls="`ui-${this._uid}`">
      <span class="menu-title">{{title}}</span>
      <i class="menu-arrow"></i>
      <i :class="`mdi mdi-${icon ? icon : 'help-circle-outline'} menu-icon`"></i>
    </a>
    <div class="collapse" 
         :class="`${active == 'true' ? 'show' : ''}`"
         :id="`ui-${this._uid}`">
      <ul class="nav flex-column sub-menu">
        <slot></slot>
      </ul>
    </div>
  </li>
</template>

<script>
export default {
  props: ["title", "icon", "active"],
  // mounted() {
  //   console.log(this)
  // }
};
</script>