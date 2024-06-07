import 'package:aplicacion_basica_curso/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'src/config/import.dart';

void main()=>runApp(MyApp());
// main de la app
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
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
