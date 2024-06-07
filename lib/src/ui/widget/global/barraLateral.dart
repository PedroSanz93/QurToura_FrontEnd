import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:aplicacion_basica_curso/src/ui/views/gastronomia.dart';
import 'package:aplicacion_basica_curso/src/ui/views/loginScreen.dart';
import 'package:aplicacion_basica_curso/src/ui/views/lugares_interes.dart';
import 'package:aplicacion_basica_curso/src/ui/views/horario_monumentos.dart';
import 'package:aplicacion_basica_curso/src/ui/views/area_usuario.dart';
//import 'package:aplicacion_basica_curso/src/ui/views/plano_ciudad.dart';
import 'package:flutter/material.dart';
// barra lateral
class BarraLateral extends StatelessWidget {
  const BarraLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String nombreUsuario = '';
    if (UserData().datosUsuarioTours != null && UserData().datosUsuarioTours!.isNotEmpty) {
      nombreUsuario = UserData().datosUsuarioTours![0]['nombre_user']; // llama a model user data para traer nombre del usuario
    }
    return Drawer(
      child: Container(
        color: Color.fromARGB(245, 181, 136, 84), //const Color(0xFF5E5A3C),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: Image.asset('lib/assets/logoQ.PNG'),
            ),
            Text(
              nombreUsuario,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserScreen()), // AREA USUARIO
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(80, 43, 30, 22),
                child: const Text(
                  "Área usuario",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestPlace()), // lugares de interes
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(80, 43, 30, 22),
                child: const Text(
                  "Lugares de interés",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gastronomy()), // gastronomia
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(80, 43, 30, 22),
                child: const Text(
                  "Gastronomía",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Schedule()), // horario de monumentos
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(80, 43, 30, 22),
                child: const Text(
                  "Horario monumentos",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10,),

/*        WIDGET PREPARADO PARA UNA PAGINA EN FUTURAS ACTUALIZACIONES
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CityPlane()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(80, 43, 30, 22),
                child: const Text(
                  "Mapa de la ciudad",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
*/
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog( // pop up cerrar sesion
                      title: Text("Cerrar sesión"),
                      content:
                          Text("¿Estás seguro de que deseas cerrar la sesión?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            // metodo para cierre sesion en flutter
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(), // vuelve al login
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text("Sí"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromARGB(250, 43, 30, 22),
                alignment: Alignment.center,
                child: const Text(
                  "Salir",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
