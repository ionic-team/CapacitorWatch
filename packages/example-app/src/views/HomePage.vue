<template>
  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>Blank</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">CapacitorWatch</ion-title>
        </ion-toolbar>
      </ion-header>

      <div id="container">
      <ion-button @click="testFoo()">Do the thing</ion-button>
      </div>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar, IonButton } from '@ionic/vue';
import { Watch } from '@ionic-enterprise/capWatch';

const watchUI = 
`Text("Capacitor WATCH")
Text("Counter: $counter")
Button("+=1", "js(counter++)")`;

// in theory this will happen at some time well after the watch session has begun
// CapWatch.updateWatchUI(watchUI);

async function testFoo() {
  console.log("trying to update watchui");
  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  console.log(JSON.stringify(Object.keys(window.Capacitor.Plugins.Watch)));
  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  console.log(JSON.stringify(Object.keys(window.Capacitor.Plugins.WatchPlugin)));
  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  await window.Capacitor.Plugins.Watch.updateWatchUI(watchUI);
}
</script>

<style scoped>
#container {
  text-align: center;
  
  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;
  
  color: #8c8c8c;
  
  margin: 0;
}

#container a {
  text-decoration: none;
}
</style>
