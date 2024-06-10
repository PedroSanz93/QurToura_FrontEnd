import 'package:flutter/material.dart';
import 'package:aplicacion_basica_curso/src/data/remote/models/user_data.dart';
// clase ventana usuario
class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // lista del modelo usduario
    List<dynamic> tours = UserData().datosUsuarioTours ?? [];
  // presentacion de la vista
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Área Usuario',
        style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: tours.length,
        itemBuilder: (context, index) {
          final tour = tours[index];
          final nombreTour = tour['nombreTour']; // nombre tour
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 || tours[index - 1]['nombreTour'] != nombreTour) // verificacion
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF2B1E16),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 122, 85, 62)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nombre del Tour: $nombreTour',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2B1E16),
                        ),
                      ),
                    ),
                  ),
                ),
              // widget para la presentacion en vista  
              Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    tour['nombre'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B1E16),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // llamada al contenido del modelo
                      _buildInfoText('Nombre Usuario: ${tour['nombre_user']}'),
                      _buildInfoText('Fecha de Creación: ${tour['fecha_creacion']}'),
                      _buildInfoText('Tiempo Estimado: ${tour['tiempo_estimado']}'),
                      _buildInfoText('Dirección: ${tour['direccion']}'),
                      _buildInfoText('Contacto: ${tour['contacto'] ?? 'No disponible'}'),
                      _buildInfoText('Descripción: ${tour['descripcion']}'),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
// formato del contenido del modelo
  Widget _buildInfoText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF2B1E16),
        ),
      ),
    );
  }
}
