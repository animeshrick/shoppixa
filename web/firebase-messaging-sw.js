importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");


const firebaseConfig = {
  apiKey: "AIzaSyCL3BviCZfaK9DMrWUpmqAX3cs5OtF50FU",
  authDomain: "shoppixa-d0298.firebaseapp.com",
  projectId: "shoppixa-d0298",
  storageBucket: "shoppixa-d0298.appspot.com",
  messagingSenderId: "455984127761",
  appId: "1:455984127761:web:8c82ea3ced7acf85db36b0",
  measurementId: "G-6XWKZDSY6T"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});

/*

import { initializeApp } from 'firebase/app';
import {
  experimentalSetDeliveryMetricsExportedToBigQueryEnabled,
  getMessaging,
  isSupported,
  onBackgroundMessage
} from 'firebase/messaging/sw';

declare var self: ServiceWorkerGlobalScope;

self.addEventListener('install', (event) => {
  console.log(self);
  console.log(event);
});

const firebaseConfig = {
  apiKey: "AIzaSyCL3BviCZfaK9DMrWUpmqAX3cs5OtF50FU",
  authDomain: "shoppixa-d0298.firebaseapp.com",
  projectId: "shoppixa-d0298",
  storageBucket: "shoppixa-d0298.appspot.com",
  messagingSenderId: "455984127761",
  appId: "1:455984127761:web:8c82ea3ced7acf85db36b0",
  measurementId: "G-6XWKZDSY6T"
};

const app = initializeApp(firebaseConfig);

isSupported().then((isSupported) => {
  if (isSupported) {
    const messaging = getMessaging(app);

    experimentalSetDeliveryMetricsExportedToBigQueryEnabled(messaging, true);

    onBackgroundMessage(messaging, ({ notification: notification }) => {
      const { title, body, image } = notification ?? {};

      if (!title) {
        return;
      }

      self.registration.showNotification(title, {
        body,
        icon: image || '/assets/icons/icon-72x72.png',
      });
    });
  }
});*/
