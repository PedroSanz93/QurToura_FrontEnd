import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TourSummary extends StatefulWidget {
  // PARAMETROS A RECIBIR
  final String? nombreTour;
  final List<dynamic>? toursPropuestos1;
  final List<dynamic>? toursPropuestos2;
  final List<dynamic>? toursPropuestos3;
// CONSTRUCTOR
  const TourSummary({
    Key? key,
    this.nombreTour,
    this.toursPropuestos1,
    this.toursPropuestos2,
    this.toursPropuestos3,
  }) : super(key: key);

  @override
  _TourSummaryState createState() => _TourSummaryState();
}

class _TourSummaryState extends State<TourSummary> {
  int? _selectedTour;

  void _generarTour() async {
    List<dynamic>? tourPropuesto;

    // Seleccionar el tour segun el checkbox seleccionado
    switch (_selectedTour) {
      case 1:
        tourPropuesto = widget.toursPropuestos1;
        break;
      case 2:
        tourPropuesto = widget.toursPropuestos2;
        break;
      case 3:
        tourPropuesto = widget.toursPropuestos3;
        break;
      default:
        tourPropuesto = null;
    }
    int idUsuario = 0;
    int tiempoEstimado = 0;
    // verificacion por si viene null
    if (UserData().datosUsuarioTours != null &&
        UserData().datosUsuarioTours!.isNotEmpty) {
      idUsuario = UserData().datosUsuarioTours![0]['idusuario'];
      tiempoEstimado = UserData().tiempoEstimadoTour;
    }
    // variable nombre
    String? nombreTour = widget.nombreTour;

    if (tourPropuesto != null) {
      // imprimir por consola para pruebas
      print(idUsuario);
      print(widget.nombreTour);
      print(tourPropuesto);
      // conexion con el modelo
      var url = Uri.parse(
          'https://photic-color.000webhostapp.com/generarTour?idUsuario=$idUsuario&nombreTour=$nombreTour&tiempoEstimado=$tiempoEstimado&sitiosElegidos=$tourPropuesto');
      // Realizar la solicitud HTTP
      var response = await http.get(url);

      // Verificar si la solicitud fue exitosa (codigo de estado 200)
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['success'] == true) {
        // Asignar el JSON devuelto a la variable userData de UserData
        UserData().datosUsuarioTours =
            jsonDecode(response.body)['datosUsuario']['original'];
        UserData().datosLugaresInteresarioTours =
            jsonDecode(response.body)['datosLugaresInteres']['original'];
            // si todo es correcto vuelve a home
        Navigator.pushReplacementNamed(context, '/home');
        ScaffoldMessenger.of(context).showSnackBar( // mensaje todo correcto
          SnackBar(
              content: Text(
                  'Su tour se ha creado correctamente, podrá verlo en la sección Area Usuario. \nLe llegará a su correo electrónico toda la información.')),
        );
      } else {
        // Si la solicitud no fue exitosa, mostrar un mensaje de error
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text('Ha ocurrido un error al generar el tour.'),
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
    } else {
      // Manejar el caso en que no se selecciona ningun tour
      ScaffoldMessenger.of(context).showSnackBar( // mensaje error
        SnackBar(content: Text('Por favor, selecciona un tour.')),
      );
    }
  }
// vista de la informacion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Resumen del Tour',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Text(
              'Nombre del Tour: ${widget.nombreTour}', //nombre del tour
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // opciones que vienen de las listas por parametros
            Text(
              'Opciones del Tour:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Tour Propuesto 1:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.toursPropuestos1 != null)
              for (var tour in widget.toursPropuestos1!)
                Text('- ${tour['nombreLugar']}'),
            SizedBox(height: 20),
            Text(
              'Tour Propuesto 2:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.toursPropuestos2 != null)
              for (var tour in widget.toursPropuestos2!)
                Text('- ${tour['nombreLugar']}'),
            SizedBox(height: 20),
            Text(
              'Tour Propuesto 3:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.toursPropuestos3 != null)
              for (var tour in widget.toursPropuestos3!)
                Text('- ${tour['nombreLugar']}'),
            SizedBox(height: 30),
            Text(
              'Selecciona una opción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // check box para una de las tres opciones
            CheckboxListTile(
              title: Text('Seleccionar Tour 1'),
              value: _selectedTour == 1,
              onChanged: (bool? value) {
                setState(() {
                  _selectedTour = value == true ? 1 : null;
                });
              },
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              title: Text('Seleccionar Tour 2'),
              value: _selectedTour == 2,
              onChanged: (bool? value) {
                setState(() {
                  _selectedTour = value == true ? 2 : null;
                });
              },
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              title: Text('Seleccionar Tour 3'),
              value: _selectedTour == 3,
              onChanged: (bool? value) {
                setState(() {
                  _selectedTour = value == true ? 3 : null;
                });
              },
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B1E16),
              ),
              // al pulsar el boton llamada a generar tour y finaliza
              onPressed: _generarTour,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Crear Tour',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
