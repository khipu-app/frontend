import { ref } from 'vue'
import { defineStore } from 'pinia'

const keys = {
  khipuLogo: 'khipu-logo-image',
  khipuLaunchTimer: 'khipu-launch-timer',
}

const values = {
  khipuLogo: 'logo-default',
  khipuLaunchTimer: 1000,
}

function save() {
  for (const key of Object.keys(keys)) {
    localStorage.setItem(keys[key], values[key])
  }
}

function load() {
  for (const key of Object.keys(keys)) {
    values[key] = localStorage.getItem(keys[key]) || values[key]
  }
}

export const useSettingsStore = defineStore('settings', () => {
  load()
  const settings = {}
  for (const key of Object.keys(keys)) {
    settings[key] = ref(values[key])
  }
  save()

  return settings
})