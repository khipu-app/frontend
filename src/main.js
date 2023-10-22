import { createApp } from 'vue'

import './style.css'
import App from './App.vue'
import router from './router'
import stateManager from './state-manager'

createApp(App)
  .use(router)
  .use(stateManager)
  .mount('#khipu-app')
