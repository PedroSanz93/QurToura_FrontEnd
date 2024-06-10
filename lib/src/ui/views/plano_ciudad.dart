import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Clase que no se esta usando
// Para futuras versiones aqui tendriamos el mapa de cordoba conectado a la API de Google Maps
class CityPlane extends StatefulWidget {
  const CityPlane({super.key});
  @override
  State<CityPlane> createState() => _CityPlaneState();
}
class _CityPlaneState extends State<CityPlane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Mapa de la ciudad',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(child: Text('MAPA GOOGLE MAPS \nSI SE PUEDE')),
    );
  }
}
