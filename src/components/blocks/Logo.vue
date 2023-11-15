<script setup>
import { useSettingsStore } from '../../stores/settings'
const { khipuLogo, khipuName } = useSettingsStore()
</script>

<template>
  <div class="logo">
    <img
      class="logo__image"
      alt="Логотип Kiphu"
      :src="`/assets/images/${khipuLogo}.svg`"
      width="150"
      height="150"
    >
    <h1 class="logo__name typo typo--mono">{{ khipuName }}</h1>
  </div>
</template>

<style>
.logo {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  margin: 0;
  padding: 0;
  width: 100vw;
  height: 100vh;
  background-color: transparent;
}

.logo__image {
  display: inherit;
  width: 150px;
  height: 150px;
}

.logo__name {
  display: inherit;
  color: var(--bg-panel, #000000);
  font-family: var(--font-family);
  font-size: var(--font-size-xxl);
  font-weight: 500;
  line-height: var(--font-line-height-xxl);
  letter-spacing: var(--letter-spacing);
}
</style>
