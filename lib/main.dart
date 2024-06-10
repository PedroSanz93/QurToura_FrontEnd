import 'package:aplicacion_basica_curso/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'src/config/import.dart';
// main de la app
void main()=>runApp(Qurtoura());
class Qurtoura extends StatefulWidget{
  @override
  State<Qurtoura> createState() => _QurtouraState();
}
class _QurtouraState extends State<Qurtoura> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // acceso al sistema de rutas
      routes: Routes.routes,
      // ruta que lleva a error 404 si se produce un error
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => const Screen404()
          );
      },
    );
  }
}
