importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js");

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;


firebase.initializeApp({
  apiKey: 'AIzaSyClE7RhoOCV51xUfjlXcwj6OsEVAMdVhAc',
  authDomain: 'prmda-27af3.firebaseapp.com',
  databaseURL: 'https://prmda-27af3-default-rtdb.europe-west1.firebasedatabase.app',
  projectId: 'prmda-27af3',
  storageBucket: 'prmda-27af3.appspot.com',
  messagingSenderId: '593037562166',
  appId: '1:593037562166:web:6995176762e1772b306397',
  measurementId: 'G-72XS75K1H6',
});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});