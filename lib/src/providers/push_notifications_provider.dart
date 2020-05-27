import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {

  // Inicializando notificaciones (se necesita el token de este dispositivo)(no funciona en el emulador)
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications() {

    _firebaseMessaging.requestNotificationPermissions();

    // Obteniendo token del dispositivo
    _firebaseMessaging.getToken().then((token) {

      print('========== FCM Token ==============');
      print(token);

    });

  }

}