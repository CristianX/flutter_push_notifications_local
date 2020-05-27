import 'package:flutter/material.dart';

// Providers
import 'package:push_local/src/providers/push_notifications_provider.dart';
 
// Vistas
import 'package:push_local/src/pages/home_page.dart';
import 'package:push_local/src/pages/mensaje_page.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Implementando navigator key
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() { 
    super.initState();
    

    // Inicializando el provider de Notificaciones
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    // Escuchando streams
    pushProvider.mensajes.listen((data) { 
      // Navegación con el push name
      // Navigator.pushNamed(context, 'mensaje');
      // print('Argumento del push');
      // print(data);

      navigatorKey.currentState.pushNamed('mensaje', arguments: data );
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Conectando con el navigator del initState (Permite manejar el estado del MaterialApp en toda la clase)
      navigatorKey: navigatorKey,

      title: 'Notificaciones Push Local',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'mensaje' : (BuildContext context) => MensajePage(),
      },
    );
  }
}