import 'package:aplicacion_basica_curso/src/ui/widget/barraNavegacion.dart';
import 'package:flutter/material.dart';
// ventana homescreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      // llama a la barra de navegacion tabbar principal del home
      child: barraNavegacion(),
    );
  }
}

