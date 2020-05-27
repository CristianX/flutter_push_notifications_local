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

  @override
  void initState() { 
    super.initState();
    

    // Inicializando el provider de Notificaciones
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    // Escuchando streams
    pushProvider.mensajes.listen((argumento) { 
      // Navegación con el push name
      // Navigator.pushNamed(context, 'mensaje');
      print('argumento del push');
      print(argumento);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones Push Local',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'mensaje' : (BuildContext context) => MensajePage(),
      },
    );
  }
}