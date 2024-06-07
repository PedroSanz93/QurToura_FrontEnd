import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_basica_curso/src/ui/views/resumen_tour.dart';

class CreateTour extends StatefulWidget {
  const CreateTour({Key? key}) : super(key: key);

  @override
  State<CreateTour> createState() => _CreateTourState();
}

class _CreateTourState extends State<CreateTour> {
  int horasDisponibles = 1;
  String nombreTour= '';
  bool cultural = false;
  bool gastronomia = false;
  bool ocio = false;
  bool naturaleza = false;

  List<dynamic>? _obtenerTours(idsSeleccionados, horas) {
  List<dynamic>? placesOfInterest = UserData().datosLugaresInteresarioTours;

  if (placesOfInterest == null) {
    // Manejar el caso en que no hay datos de lugares de interés
    return null;
  } else {
    // Filtrar los lugares de interés por idCategoria antes de mostrarlos
    List<dynamic> filteredPlaces = placesOfInterest.where((place) => idsSeleccionados.contains(place['idCategoria'])).toList();

    filteredPlaces.shuffle();
    
    // Crear un mapa para almacenar las actividades seleccionadas por categoría
    Map<int, dynamic> selectedActivities = {};
    Map<int, dynamic> lugaresSeleccionados = {};

    // Recorrer la lista filtrada de lugares de interés
    for (var place in filteredPlaces) {
      // Obtener la categoría y el ID del lugar de interés
      int categoria = place['idCategoria'];
      int idLugar = place['idLugar'];
      String nombreLugar = place['nombre'];
      
      // Verificar si todavía hay horas disponibles después de agregar las horas de la actividad anterior
      if (horas > 0) {
        if (selectedActivities.containsKey(categoria)) {
          if (idsSeleccionados.every((id) => selectedActivities.containsKey(id))) {
            // Si todos los IDs de idsSeleccionados están presentes en selectedActivities,
            // introducimos la actividad ya que ha completado una vuelta a la lista de lugar de interes
            selectedActivities[categoria] = {
              'idLugar': idLugar,
            };
            lugaresSeleccionados[idLugar] = {
              'idLugar': idLugar,
              'nombreLugar': nombreLugar
            };
            horas -= place['tiempo'];
          }
        } else {
          // Si todavía hay horas disponibles, y no hay actividades de esta categoria seleccionadas,
          // seleccionamos esta actividad y restamos las horas de esta actividad al tiempo disponible
          selectedActivities[categoria] = {
            'idLugar': idLugar,
          };
          lugaresSeleccionados[idLugar] = {
              'idLugar': idLugar,
              'nombreLugar': nombreLugar
            };
          horas -= place['tiempo'];
        }
      } else {
        // Si no quedan horas disponibles, salimos del bucle
        break;
      }
    }
    
    // Convertir el mapa de actividades seleccionadas a una lista
    List<dynamic> selectedActivitiesList = selectedActivities.values.toList();
    List<dynamic> actividadesSeleccionadas = lugaresSeleccionados.values.toList();
    
    return actividadesSeleccionadas;
  }
}

// funcion añadir tour
void _startTour() {
  // lista vacia
  List<int> idsSeleccionados = [];
  // condicional para ir añadiendo hasta agotar tiempo establecido
  if (cultural) {
    idsSeleccionados.add(1);
  }
  if (gastronomia) {
    idsSeleccionados.add(2);
  }
  if (ocio) {
    idsSeleccionados.add(3);
  }
  if (naturaleza) {
    idsSeleccionados.add(4);
  }
  // variable a imprimir
  int? horas = horasDisponibles;
  // variable a imprimir
  String? nombreTour1 = nombreTour;
  // listas para las 3 opciones
  List<dynamic>? toursPropuestos1 = _obtenerTours(idsSeleccionados, horas);
  List<dynamic>? toursPropuestos2 = _obtenerTours(idsSeleccionados, horas);
  List<dynamic>? toursPropuestos3 = _obtenerTours(idsSeleccionados, horas);
  // comprobacion por cosola
  print(nombreTour1);
  // llamada al modelo para conocer el tiempo
  UserData().tiempoEstimadoTour = horas;
  // ruta para navegar mandando las lista y nombre por parametro
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TourSummary(
        nombreTour: nombreTour1,
        toursPropuestos1: toursPropuestos1,
        toursPropuestos2: toursPropuestos2,
        toursPropuestos3: toursPropuestos3,
      ),
    ),
  );
}

  // vista del contenido de la pagina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Crear Tour',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              'COMENZAR TOUR',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre del Tour',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  nombreTour = value;
                });
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '¿De cuánto tiempo dispones?',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: '1',
                    onChanged: (value) {
                      // logica para introducir tiempo
                      int parsedValue = int.tryParse(value) ?? 1;
                      if (parsedValue < 1) {
                        parsedValue = 1;
                      } else if (parsedValue > 10) {
                        parsedValue = 10;
                      }
                      // actualizar estado
                      setState(() {
                        horasDisponibles = parsedValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              '¿Qué te gustaría ver?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30,),
            // checkbox para preferencias con setState para estado de la variable
            CheckboxListTile(
              title: Text('Cultural'),
              value: cultural,
              //activeColor: Color(0xFF2B1E16),
              onChanged: (bool? value) {
                setState(() {
                  cultural = value!;
                });
              },
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              title: Text('Gastronomía'),
              value: gastronomia,
              //activeColor: Color(0xFF2B1E16),
              onChanged: (bool? value) {
                setState(() {
                  gastronomia = value!;
                });
              },
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              title: Text('Ocio'),
              value: ocio,
              //activeColor: Color(0xFF2B1E16),
              onChanged: (bool? value) {
                setState(() {
                  ocio = value!;
                });
              },
            ),
            SizedBox(height: 10,),
            CheckboxListTile(
              title: Text('Naturaleza'),
              value: naturaleza,
              //activeColor: Color(0xFF2B1E16),
              onChanged: (bool? value) {
                setState(() {
                  naturaleza = value!;
                });
              },
            ),
            SizedBox(height: 40),
            // boton llama a funcion para mandar informacion a resumen tour
            ElevatedButton(
              onPressed: _startTour,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B1E16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                
                child: Text(
                  'Iniciar Tour',
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

/*  PRUEBAS
import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_basica_curso/src/ui/views/resumen_tour.dart';

class CreateTour extends StatefulWidget {
  const CreateTour({Key? key}) : super(key: key);

  @override
  State<CreateTour> createState() => _CreateTourState();
}

class _CreateTourState extends State<CreateTour> {
  int horasDisponibles = 1;
  String nombreTour= '';
  bool cultural = false;
  bool gastronomia = false;
  bool ocio = false;
  bool naturaleza = false;

  List<dynamic>? _obtenerTours(idsSeleccionados, horas) {
  List<dynamic>? placesOfInterest = UserData().datosLugaresInteresarioTours;

  if (placesOfInterest == null) {
    // Manejar el caso en que no hay datos de lugares de interés
    return null;
  } else {
    // Filtrar los lugares de interés por idCategoria antes de mostrarlos
    List<dynamic> filteredPlaces = placesOfInterest.where((place) => idsSeleccionados.contains(place['idCategoria'])).toList();

    filteredPlaces.shuffle();
    
    // Crear un mapa para almacenar las actividades seleccionadas por categoría
    Map<int, dynamic> selectedActivities = {};
    Map<int, dynamic> lugaresSeleccionados = {};

    // Recorrer la lista filtrada de lugares de interés
    for (var place in filteredPlaces) {
      // Obtener la categoría y el ID del lugar de interés
      int categoria = place['idCategoria'];
      int idLugar = place['idLugar'];
      String nombreLugar = place['nombre'];
      
      // Verificar si todavía hay horas disponibles después de agregar las horas de la actividad anterior
      if (horas > 0) {
        if (selectedActivities.containsKey(categoria)) {
          if (idsSeleccionados.every((id) => selectedActivities.containsKey(id))) {
            // Si todos los IDs de idsSeleccionados están presentes en selectedActivities,
            // introducimos la actividad ya que ha completado una vuelta a la lista de lugar de interes
            selectedActivities[categoria] = {
              'idLugar': idLugar,
            };
            lugaresSeleccionados[idLugar] = {
              'idLugar': idLugar,
              'nombreLugar': nombreLugar
            };
            horas -= place['tiempo'];
          }
        } else {
          // Si todavía hay horas disponibles, y no hay actividades de esta categoria seleccionadas,
          // seleccionamos esta actividad y restamos las horas de esta actividad al tiempo disponible
          selectedActivities[categoria] = {
            'idLugar': idLugar,
          };
          lugaresSeleccionados[idLugar] = {
              'idLugar': idLugar,
              'nombreLugar': nombreLugar
            };
          horas -= place['tiempo'];
        }
      } else {
        // Si no quedan horas disponibles, salimos del bucle
        break;
      }
    }
    
    // Convertir el mapa de actividades seleccionadas a una lista
    List<dynamic> selectedActivitiesList = selectedActivities.values.toList();
    List<dynamic> actividadesSeleccionadas = lugaresSeleccionados.values.toList();
    
    return actividadesSeleccionadas;
  }
}


void _startTour() {
  List<int> idsSeleccionados = [];
  if (cultural) {
    idsSeleccionados.add(1);
  }
  if (gastronomia) {
    idsSeleccionados.add(2);
  }
  if (ocio) {
    idsSeleccionados.add(3);
  }
  if (naturaleza) {
    idsSeleccionados.add(4);
  }

  int? horas = horasDisponibles;
  String? nombreTour1 = nombreTour;
  List<dynamic>? toursPropuestos1 = _obtenerTours(idsSeleccionados, horas);
  List<dynamic>? toursPropuestos2 = _obtenerTours(idsSeleccionados, horas);
  List<dynamic>? toursPropuestos3 = _obtenerTours(idsSeleccionados, horas);
  print(nombreTour1);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TourSummary(
        nombreTour: nombreTour1,
        toursPropuestos1: toursPropuestos1,
        toursPropuestos2: toursPropuestos2,
        toursPropuestos3: toursPropuestos3,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: const Color.fromARGB(255, 122, 85, 62),
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      'Crear Tour',
      style: TextStyle(color: Colors.white),
    ),
  ),
  body: Center(
    child: ListView(
      children: [
        Text(
          'ÁREA USUARIO',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        // Text field para el nombre del tour
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Nombre del Tour',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            // Guardar el valor del nombre del tour en una variable
            setState(() {
               nombreTour = value;
            });
           
          },
        ),
        SizedBox(height: 20),
        // Text field para las horas disponibles
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Horas Disponibles \n1 hora min 10 max',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 10),
            Container(
              width: 100,
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '1',
                onChanged: (value) {
                  int parsedValue = int.tryParse(value) ?? 1;
                  if (parsedValue < 1) {
                    parsedValue = 1;
                  } else if (parsedValue > 10) {
                    parsedValue = 10;
                  }
                  setState(() {
                    horasDisponibles = parsedValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        // Lista de CheckboxListTile para las categorías
        CheckboxListTile(
          title: Text('Cultural'),
          value: cultural,
          onChanged: (bool? value) {
            setState(() {
              cultural = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Gastronomía'),
          value: gastronomia,
          onChanged: (bool? value) {
            setState(() {
              gastronomia = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Ocio'),
          value: ocio,
          onChanged: (bool? value) {
            setState(() {
              ocio = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Naturaleza'),
          value: naturaleza,
          onChanged: (bool? value) {
            setState(() {
              naturaleza = value!;
            });
          },
        ),
        ElevatedButton(
          onPressed: _startTour,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2B1E16),
          ),
          child: SizedBox(
            width: 150,
            height: 60,
            child: Center(
              child: Text(
                'Iniciar Tour',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}

*/