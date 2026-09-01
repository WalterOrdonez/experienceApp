// Required only so firebase-js-sdk can obtain an FCM token on web.
// Background push is intentionally NOT handled here (web only shows
// in-app foreground toasts); no onBackgroundMessage handler is registered.
importScripts('https://www.gstatic.com/firebasejs/10.14.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.14.1/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: 'AIzaSyAwQbY578AzY3YWq65RQfg-fneukfoZoFM',
  appId: '1:782659645882:web:168fd0cb3474bb3fb9ad83',
  messagingSenderId: '782659645882',
  projectId: 'ecommerce-waordone',
  authDomain: 'ecommerce-waordone.firebaseapp.com',
  storageBucket: 'ecommerce-waordone.firebasestorage.app',
});

firebase.messaging();
