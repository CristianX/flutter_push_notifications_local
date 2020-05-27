// Firebase Messaging
import 'package:firebase_messaging/firebase_messaging.dart';

// Analisis de tipo de plataforma
import 'dart:io';

// Stream
import 'dart:async';

class PushNotificationProvider {

  // Inicializando notificaciones (se necesita el token de este dispositivo)(no funciona en el emulador)
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // Stream
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

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

      // Se dispara cuando la aplicación está abierta (aquí se recibe la información)
      onMessage: ( info ) async {

        print( '======= On Message ========' );
        print( info );

        // Determinando si es android o ios
        String argumento = 'no-data';
        if( Platform.isAndroid ) {
          //  ?? si no viene el argumento 'comida' enviar 'no-data'
          argumento = info['data']['comida'] ?? 'no-data' ;
        }

        _mensajesStreamController.sink.add( argumento );

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

  // Cerrando Stream
  dispose() {
    _mensajesStreamController?.close();
  }

}