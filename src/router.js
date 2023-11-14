import { createRouter, createWebHistory } from 'vue-router'
import Library from './components/views/Library.vue'

const routes = [
  { path: '/library', name: 'Library', component: Library },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router