import { createApp, defineComponent } from 'vue'

import './style.css'
import App from './App.vue'
import router from './router'

createApp(App)
  .use(router)
  .mount('#khipu-app')
