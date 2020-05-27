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

      // e_Ex8rOtadw:APA91bGjkaegyCCSlrL4WMPcw25SPu9J9diRs4QvcOfxZHreUVzLNP3GrE4UM7JADAj3fN1_1HOmEnJoQd2IldDTuCrBJhJo2Jx7HLdpIq1e4YLFSv0o0BUTM6r_fAknN8tgxviAF3LQ
      

    });

    // Configuración de los métodos de firebase messaging
    _firebaseMessaging.configure(

      // Se dispara cuando la aplicación está abierta
      onMessage: ( info ) async {

        print( '======= On Message ========' );
        print( info );

      },

      // Recibir notificaciones
      onLaunch: ( info ) async {

        print( '======= On Launch ========' );
        print( info );

        // final notif = info['data']['comida'];
        // print( notif );

      },

      // Cuando la aplicación se termino
      onResume: ( info ) async {

        print( '======= On Launch ========' );
        print( info );

        // final notif = info['data']['comida'];
        // print( notif );


      }

    );

  }

}