import { createRouter, createWebHistory } from 'vue-router'
import Library from './components/views/Library.vue'
import Launch from './components/views/Launch.vue'

const routes = [
  { path: '/', name: 'Launch', component: Launch },
  { path: '/library', name: 'Library', component: Library },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router