import 'package:aplicacion_basica_curso/src/config/import.dart';
import 'package:aplicacion_basica_curso/src/ui/views/ayuda.dart';
import 'package:aplicacion_basica_curso/src/ui/widget/global/barraLateral.dart';
import 'package:flutter/material.dart';

// barra de navegacion para dirigir a diferentes paginas
class barraNavegacion extends StatelessWidget {
  const barraNavegacion({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor:
            const Color.fromARGB(255, 122, 85, 62), //Color(0xFF5E5A3C),
        title: Row(children: [
          const SizedBox(
            width: 93,
          ),
          const Text(
            'QurToura',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 91,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                  // ruta de ayuda
                    MaterialPageRoute(builder: (context) => HelpScreen()));
              },
              icon: Icon(Icons.help))
        ]),
        bottom: const TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Text(
                'Crear Tour',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Tab(
              icon: Text(
                'Lugares destacados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
                icon: Text(
              'Calendario',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
          ],
        ),
      ),
      drawer: const BarraLateral(),
      backgroundColor:
          Color.fromARGB(245, 222, 179, 130), //const Color(0xFFF5DEB3),
      body: TabBarView(
        // rutas del tabbar
        children: [
          Pagina1(), 
          Pagina2(), 
          Pagina3()],
      ),
    );
  }
}
