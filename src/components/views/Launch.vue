<script setup>
import { useRouter } from 'vue-router'
import { useSettingsStore } from '../../stores/settings'

const settings = useSettingsStore()

const router = useRouter()
setTimeout(() => {
  router.push({ name: 'Library' })
}, settings.khipuLaunchTimer);
</script>

<template>
  <div class="launch">
    <img
      class="launch__logo"
      alt="Логотип Kiphu"
      :src="`/assets/images/${settings.khipuLogo}.svg`"
      width="150"
      height="150"
    >
    <h1 class="launch__name typo typo--mono">Khipu</h1>
  </div>
</template>

<style>
.launch {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  margin: 0;
  padding: 0;
  width: 100vw;
  height: 100vh;
  background-color: var(--bg-tone-gold);
}

.launch__logo {
  display: inherit;
}

.launch__name {
  display: inherit;
  color: var(--bg-panel, #000000);
  font-family: var(--font-family);
  font-size: var(--font-size-xxl);
  font-weight: 500;
  line-height: var(--font-line-height-xxl);
  letter-spacing: var(--letter-spacing);
}
</style>
