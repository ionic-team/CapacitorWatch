import { createRouter, createWebHistory } from "@ionic/vue-router";
import { RouteRecordRaw } from "vue-router";
import HomePage from "../views/HomePage.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    redirect: "/home",
  },
  {
    path: "/home",
    name: "Home",
    component: HomePage,
  },
];

const router = createRouter({
  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
