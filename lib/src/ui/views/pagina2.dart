import 'package:aplicacion_basica_curso/src/data/remote/models/imagenes_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
// clase pagina2 lugares destacados del appbar
class Pagina2 extends StatefulWidget {
  const Pagina2({Key? key}) : super(key: key);
  @override
  State<Pagina2> createState() => _Pagina2State();
}
class _Pagina2State extends State<Pagina2> {
  bool _isPanelOpen = false; // para mantener panel plegado
// vista de la informacion
  @override
  Widget build(BuildContext context) {
    // devuelve la la informacion montada
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(245, 255, 255, 255),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length, // imagen de clase modelo imagendata 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          final imageData = images[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    imageData.assetPath, // lista de imagenes dentro de la imagen en clase modelo imagendata
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    imageData.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // boton llama a mostra panel y lo despliega y se le pasa parametros contexto y atributo de clase modelo
                    _showPanel(context, imageData);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2B1E16),
                  ),
                  child: const SizedBox(
                    width: 140,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Ver más',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          );
        },
      ),
    );
  }
// funcion llamar al panel desplegable
  void _showPanel(BuildContext context, ImageData imageData) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(245, 222, 179, 130),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          _isPanelOpen = false;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    // carrusel de imagenes
                    CarouselSlider(
                      options: CarouselOptions(
                        // parametros visuales 
                        height: 350.0, 
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                      items: imageData.otrasImagenes.map((item) => Container( // lista dentro de la lista model imagedata
                        child: Center(
                          child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      )).toList(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // llama a metodo buscar url pasando url
                        _launchMapsUrl(imageData.mapsUrl);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2B1E16),
                      ),
                      child: const SizedBox(
                        width: 180,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Abrir en Google Maps',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), 
                  ],
                );
          },
        );
      },
    );
  }
// metodo url de libreria de flutter: URL_launcher
  void _launchMapsUrl(String mapsUrl) async {
    try {
      await launch(mapsUrl);
    } catch (e) {
      print('Error al abrir el enlace: $e');
    }
  }
}