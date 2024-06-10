import 'dart:convert';
import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//clase de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  //variables para guardar el contenido de los textfield que mete el usuario por teclado
  String user = '';
  String password = '';
  // variables para regristro de usuario
  String nombre = '';
  String apellido = '';
  String correo = '';
  String pass = '';
  String pass2 = ''; // repetir contraseña
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // PARA NO VOLVER ATRAS
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E5A3C), // color del AppBar
      ),
      body: Container(
        color: const Color(0xFF5E5A3C), // color de fondo de la pantalla
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset('lib/assets/logoQ.PNG'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        user = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(
                        color: Color(0xFF2B1E16),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(245, 222, 179, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        color: Color(0xFF2B1E16),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(245, 222, 179, 0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        // diseño boton
                        child: ElevatedButton(
                          onPressed: () async {
                            // URL de la ruta para peticion a la bbdd para el LOGIN
                            var url = Uri.parse(
                                'https://photic-color.000webhostapp.com/login?email=$user&contra=$password');
                            try {
                              // realizar la solicitud HTTP
                              var response = await http.get(url);
                              // verifica si la solicitud fue bien (codigo de estado 200)
                              if (response.statusCode == 200 &&
                                  jsonDecode(response.body)['success'] ==
                                      true) {
                                // mete el JSON devuelto a la variable userData de UserData
                                UserData().datosUsuarioTours =
                                    jsonDecode(response.body)['datosUsuario']
                                        ['original'];
                                UserData().datosLugaresInteresarioTours =
                                    jsonDecode(response.body)[
                                        'datosLugaresInteres']['original'];
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } else {
                                // si la solicitud falla, muestra un mensaje de error en un pop-up
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Error'),
                                    content:
                                        Text('Usuario/Contraseña incorrectos.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } catch (e) {
                              // si ocurre un error durante la solicitud, muestra un mensaje de error
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text('An error occurred: $e'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            //PRUEBA: Navigator.pushReplacementNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF2B1E16), // color del boton
                          ),
                          child: const Text(
                            'Iniciar',
                            style: TextStyle(
                                color:
                                    Colors.white), // color del texto del boton
                          ),
                        ),
                      ),
                      SizedBox(width: 3), // espacio entre botones
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Registro de Usuario"),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              nombre = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Nombre',
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              apellido = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Apellidos',
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              correo = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Correo electrónico',
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              pass = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Contraseña',
                                          ),
                                          obscureText: true,
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              pass2 = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Repetir Contraseña',
                                          ),
                                          obscureText: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (pass == pass2) {
                                          // URL de la ruta para peticion a la bbdd para el REGISTRO DE USUARIO
                                          var url = Uri.parse(
                                              'https://photic-color.000webhostapp.com/registro?email=$correo&contra=$pass&nombre=$nombre&apellido=$apellido');
                                          try {
                                            // realizar la solicitud HTTP
                                            var response = await http.get(url);
                                            // respuesta por consola
                                            print(response);
                                            // verifica si la solicitud fue bien (codigo de estado 200)
                                            if (response.statusCode == 200 &&
                                                (jsonDecode(response.body)[
                                                        'success'] ==
                                                    true)) {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Text('correcto'),
                                                  content: Text(
                                                      'Registrado correctamente, inicie sesion'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context, '/');
                                                      },
                                                      child: Text('Close'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              // si la solicitud fue mal, muestra un mensaje de error
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Se ha producido un error'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Close'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            // si ocurre un error durante la solicitud, muestra un mensaje de error
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'An error occurred: $e'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: Text(
                                        "Registrarse",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF2B1E16),
                          ),
                          child: const Text(
                            'Registro',
                            style: TextStyle(
                                color:
                                    Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
