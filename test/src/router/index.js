import Vue from 'vue'
import VueRouter from 'vue-router'
import { Loading, Message  } from 'element-ui';

Vue.use(VueRouter)

const routes = [
  {
    path: '',
    redirect: '/index'
  },
  {
    path: '/index',
    name: 'index',
    component: () => import('../views/index.vue')
  },
  {
    path: '/home',
    name: 'home',
    meta: {
      reqLogin: true
    },
    component: () => import('../views/home.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import( '../views/login.vue')
  },
  {
    path: '/register',
    name: 'register',
    component: () => import( '../views/register.vue')
  },
  {
    path: '/album',
    name: 'Album',
    component: () => import('../views/album.vue')
  },
  {
    path: '/search',
    name: 'Search',
    component: () => import('../views/search.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

//Using the push approach
const RouterPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (to) {
  return RouterPush.call(this, to).catch(err => err)
}

//Using the replace method
const RouterReplace = VueRouter.prototype.replace
VueRouter.prototype.replace = function replace (to) {
  return RouterReplace.call(this, to).catch(err => err)
}

router.beforeEach((to, from, next) => {

  if(to.matched.some(record => record.meta.reqLogin)) {
    if(sessionStorage.getItem('loginInfo')) {
      next()
    }else{
      Message('Please log in first !')
      next({
        path: '/login'
      })
    }
  }else{
    next()
  }
})

export default router
