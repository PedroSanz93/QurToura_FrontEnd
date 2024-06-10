import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
import 'package:flutter/material.dart';
// clase lugares de interes
class InterestPlace extends StatefulWidget {
  const InterestPlace({Key? key}) : super(key: key);
  @override
  State<InterestPlace> createState() => _InterestPlaceState();
}
class _InterestPlaceState extends State<InterestPlace> {
  @override
  Widget build(BuildContext context) {
    // obtener los datos de lugares de interes de la variable global
    List<dynamic>? placesOfInterest = UserData().datosLugaresInteresarioTours;
    // devuelve la informacion montada y formateada
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Lugares de interés',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildPlacesOfInterest(placesOfInterest),
    );
  }
  // widget para estructura de presentacion de la informacion de la vista lugares de interes
  Widget _buildPlacesOfInterest(List<dynamic>? placesOfInterest) {
    if (placesOfInterest == null) {
      // muestra un indicador de carga si la lista de lugares de interes es nula
      return const Center(child: CircularProgressIndicator());
    } else if (placesOfInterest.isEmpty) {
      // muestra un mensaje si la lista de lugares de interes esta vacia
      return const Center(
          child: Text('No hay lugares de interés disponibles.'));
    } else {
      // filtra los lugares de interes por idCategoria antes de mostrarlos
      List<dynamic> filteredPlaces =
          placesOfInterest.where((place) => place['idCategoria'] != 2).toList();
      // muestra la lista de lugares de interes filtrados
      if (filteredPlaces.isEmpty) {
        // muestra un mensaje si no hay lugares de interes disponibles despues de filtrar
        return const Center(
            child: Text('No hay lugares de interés disponibles.'));
      } else {
        // muestra la lista de lugares de inters
        return ListView.builder(
          itemCount: filteredPlaces.length,
          itemBuilder: (context, index) {
            var place = filteredPlaces[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Color(0xFFE5E5E5),
                child: ListTile(
                  title: Text(
                    place['nombre'],
                    style: TextStyle(
                      color: Color(0xFF2B1E16),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        place['direccion'],
                        style: TextStyle(
                          color: Color(0xFF2B1E16),
                          fontSize: 19,
                        ),
                      ),
                      if (place['contacto'] != null) ...[
                        SizedBox(height: 4),
                        Text(
                          place['contacto'],
                          style: TextStyle(
                            color: Color(0xFF2B1E16),
                            fontSize: 19,
                          ),
                        ),
                      ],
                      SizedBox(height: 4),
                      Text(
                        place['descripcion'],
                        style: TextStyle(
                          color: Color(0xFF2B1E16),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    }
  }
}
