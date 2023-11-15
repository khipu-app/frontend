<script setup>
import { RouterView } from 'vue-router';
</script>

<template>
  <header class="base__header typo typo--mono"></header>
  <main class="base__main typo typo--text">
    <router-view />
  </main>
  <footer class="base__footer typo typo--mono"></footer>
</template>

<style>
</style>
