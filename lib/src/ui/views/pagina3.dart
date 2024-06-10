import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
// clase pagina3 calendario del appbar
class Pagina3 extends StatefulWidget {
  @override
  _Pagina3State createState() => _Pagina3State();
}
class _Pagina3State extends State<Pagina3> {
  // parametros de la clase
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Database? _database;
  Map<DateTime, List<Map<String, String>>> _events = {};
  List<Map<String, String>> _selectedEvents = [];
  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }
  // funcion future para que cuando se inicie la app por primera vez se inserte la bbdd entera
  // cuando se efectue alguna modificacion hay que volver a instalar la app
  Future<void> _initializeDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'calendar.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // base de datos interna con todos los campos
        // a modo de prueba se incluiran eventos de mayo en la version inicial de prueba para la demo 
        await db.execute(
          'CREATE TABLE events (id INTEGER PRIMARY KEY, date TEXT, event TEXT, description TEXT)',
        );
        // insercion de campos
        await db.insert(
          'events',
          {
            'date': '2024-05-01',
            'event': 'Cruces de mayo',
            'description':
                'Junto con la Batalla de las Flores que se celebra a principios de mayo, en la que una cabalgata de carrozas decoradas con flores pasean por Córdoba dando la bienvenida a la primavera, se celebra el Concurso Popular de Cruces de Mayo de Córdoba. En los patios y plazas se levantan cruces de gran tamaño decoradas con flores, macetas y mantones de manila. Las Asociaciones de vecinos y Peñas instalan una barra de bar donde se sirven las tapas típicas y bebidas que reconfortan al visitante. Todo amenizado con música de sevillanas y espectáculos nocturnos de baile.\nPasear por los barrios de San Basilio, San Andrés, Santa Marina, San Agustín y la zona centro dan al visitante una perfecta imagen de Córdoba en mayo.\nCruces de Mayo de Córdoba 2024: 1 de mayo al 5 de mayo.'
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-02',
            'event': 'Cruces de mayo',
            'description':
                'Junto con la Batalla de las Flores que se celebra a principios de mayo, en la que una cabalgata de carrozas decoradas con flores pasean por Córdoba dando la bienvenida a la primavera, se celebra el Concurso Popular de Cruces de Mayo de Córdoba. En los patios y plazas se levantan cruces de gran tamaño decoradas con flores, macetas y mantones de manila. Las Asociaciones de vecinos y Peñas instalan una barra de bar donde se sirven las tapas típicas y bebidas que reconfortan al visitante. Todo amenizado con música de sevillanas y espectáculos nocturnos de baile.\nPasear por los barrios de San Basilio, San Andrés, Santa Marina, San Agustín y la zona centro dan al visitante una perfecta imagen de Córdoba en mayo.\nCruces de Mayo de Córdoba 2024: 1 de mayo al 5 de mayo.'
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-03',
            'event': 'Cruces de mayo',
            'description':
                'Junto con la Batalla de las Flores que se celebra a principios de mayo, en la que una cabalgata de carrozas decoradas con flores pasean por Córdoba dando la bienvenida a la primavera, se celebra el Concurso Popular de Cruces de Mayo de Córdoba. En los patios y plazas se levantan cruces de gran tamaño decoradas con flores, macetas y mantones de manila. Las Asociaciones de vecinos y Peñas instalan una barra de bar donde se sirven las tapas típicas y bebidas que reconfortan al visitante. Todo amenizado con música de sevillanas y espectáculos nocturnos de baile.\nPasear por los barrios de San Basilio, San Andrés, Santa Marina, San Agustín y la zona centro dan al visitante una perfecta imagen de Córdoba en mayo.\nCruces de Mayo de Córdoba 2024: 1 de mayo al 5 de mayo.'
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-04',
            'event': 'Cruces de mayo',
            'description':
                'Junto con la Batalla de las Flores que se celebra a principios de mayo, en la que una cabalgata de carrozas decoradas con flores pasean por Córdoba dando la bienvenida a la primavera, se celebra el Concurso Popular de Cruces de Mayo de Córdoba. En los patios y plazas se levantan cruces de gran tamaño decoradas con flores, macetas y mantones de manila. Las Asociaciones de vecinos y Peñas instalan una barra de bar donde se sirven las tapas típicas y bebidas que reconfortan al visitante. Todo amenizado con música de sevillanas y espectáculos nocturnos de baile.\nPasear por los barrios de San Basilio, San Andrés, Santa Marina, San Agustín y la zona centro dan al visitante una perfecta imagen de Córdoba en mayo.\nCruces de Mayo de Córdoba 2024: 1 de mayo al 5 de mayo.'
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-05',
            'event': 'Cruces de mayo',
            'description':
                'Junto con la Batalla de las Flores que se celebra a principios de mayo, en la que una cabalgata de carrozas decoradas con flores pasean por Córdoba dando la bienvenida a la primavera, se celebra el Concurso Popular de Cruces de Mayo de Córdoba. En los patios y plazas se levantan cruces de gran tamaño decoradas con flores, macetas y mantones de manila. Las Asociaciones de vecinos y Peñas instalan una barra de bar donde se sirven las tapas típicas y bebidas que reconfortan al visitante. Todo amenizado con música de sevillanas y espectáculos nocturnos de baile.\nPasear por los barrios de San Basilio, San Andrés, Santa Marina, San Agustín y la zona centro dan al visitante una perfecta imagen de Córdoba en mayo.\nCruces de Mayo de Córdoba 2024: 1 de mayo al 5 de mayo.'
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-17',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-18',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-19',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-20',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-21',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-22',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-23',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-24',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-25',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await db.insert(
          'events',
          {
            'date': '2024-05-26',
            'event': 'Feria de Córdoba',
            'description':
                'La Feria de Córdoba se celebra normalmente a finales de mayo, en conmemoración de Nuestra Señora de la Salud. En el recinto del Arenal, de fácil acceso, se dan cita caballistas, gitanas y flamencos, en las casetas que se disponen de forma ordenada y repartidas en las distintas calles del ferial. Dichas casetas son públicas la mayor parte del tiempo, por lo que todos los visitantes tienen las puertas abiertas para entrar en aquellas que deseen, que es precisamente en lo que consiste parte de la diversión.\nFeria de Córdoba 2024: Del 18 al 25 de mayo.\nBus Aucorsa - Servicio Especial Feria de Córdoba 2024: https://aucorsa.es/lineas-y-horarios/#especiales\nAparcamiento Feria de Córdoba 2024 (a sólo 100 metros del recinto ferial)\nTaxis: +34 957 764 444 / 957 789 789 www.radiotaxicordoba.com / http://cordoba.etaxi.es '
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
    // llamada a la funcion futura
    await _loadEvents();
  }
  // funcion para cargar en el map dia del calendario con el nombre del evento y la descripcion
  Future<void> _loadEvents() async {
    final List<Map<String, dynamic>> maps = await _database!.query('events');
    setState(() {
      _events = {};
      for (var map in maps) {
        DateTime date = DateTime.parse(map['date']);
        if (_events[date] == null) {
          _events[date] = [];
        }
        _events[date]!.add({
          'event': map['event'] ?? '',
          'description': map['description'] ?? ''
        });
      }
    });
  }
  // funcion lista para formatear fechas
  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }
// presentacion del calendario
  @override
  Widget build(BuildContext context) {
    // devuelve la informacion montada y formateada
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(245, 255, 255, 255),
            // libreria calendar de flutter
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents = _getEventsForDay(selectedDay);
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF2B1E16),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 122, 85, 62),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.white,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                ),
                defaultTextStyle: TextStyle(
                  color: Color(0xFF2B1E16),
                ),
                weekendTextStyle: TextStyle(
                  color: Color(0xFF2B1E16),
                ),
                outsideTextStyle: TextStyle(
                  color: Color(0xFF2B1E16),
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Color(0xFF2B1E16),
                  fontSize: 16.0,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Color(0xFF2B1E16),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Color(0xFF2B1E16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 1.0),
          Expanded(
            child: _selectedEvents.isEmpty
              // operador ternario que devuelve el evento formateado visualmente o no dependiendo de si en la fecha hay o no evento
                ? const Center(child: Text('No events'))
                : ListView.builder(
                    itemCount: _selectedEvents.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Color.fromARGB(245, 255, 255, 255),
                        child: ListTile(
                          title: Row(children: [
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              _selectedEvents[index]['event']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF2B1E16),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.event)
                          ]),
                          subtitle: Container(
                            padding: EdgeInsets.all(8), 
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), 
                              border: Border.all(
                                color: Color(0xFF2B1E16), 
                                width: 1, 
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 122, 85, 62)
                                      .withOpacity(0.7), 
                                  spreadRadius: 2, 
                                  blurRadius: 4, 
                                  offset: Offset(0, 2), 
                                ),
                              ],
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              _selectedEvents[index]['description']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
