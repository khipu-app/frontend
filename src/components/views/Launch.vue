<script setup>
import { useRouter } from 'vue-router'
import { useSettingsStore } from '../../stores/settings'

import Logo from '../blocks/Logo.vue'

const { khipuLaunchTimer } = useSettingsStore()

const router = useRouter()
setTimeout(() => {
  router.push({ name: 'Library' })
}, khipuLaunchTimer);
</script>

<template>
  <div class="launch">
    <Logo class="launch__logo" />
  </div>
</template>

<style>
.launch {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: var(--bg-tone-gold);
}

.launch__logo {
  display: inherit;
}
</style>
