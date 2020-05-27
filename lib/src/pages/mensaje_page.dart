import 'package:flutter/material.dart';


class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Recibiendo argumento del NavigatorKey del main
    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      appBar: AppBar(
        title: Text('Mensaje Page'),
      ),
      body: Center(
        child: Text(arg),
      ),
      
    );
  }
}