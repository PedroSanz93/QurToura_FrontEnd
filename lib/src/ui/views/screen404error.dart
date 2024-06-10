import 'package:flutter/material.dart';
//  ventana error prevista para error en la conexion
class Screen404 extends StatefulWidget {
  const Screen404({super.key});
  @override
  State<Screen404> createState() => _Screen404State();
}
// muestra un mensaje de error en el centro de la pantalla
class _Screen404State extends State<Screen404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error 404"),
      ),
      body: const Center(
        child: Text("Error la pagina no ha sido encontrada"),
      ),
    );
  }
}