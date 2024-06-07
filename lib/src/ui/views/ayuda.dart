import 'package:aplicacion_basica_curso/src/config/import.dart';
import 'package:flutter/material.dart';
// pagina ayuda
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  // map clave valor con informacion de pregunta respuesta de ayuda
  final List<Map<String, String>> faq = [
    {
      'question': '¿Cómo puedo crear una cuenta?',
      'answer':
          'Para crear una cuenta, haz clic en "Registro" nada más iniciar la aplicación y sigue los pasos indicados.'
    },
    {
      'question': '¿Cómo creo un tour personalizado?',
      'answer':
          'Para poder crear un tour personalizado para ti, solo tienes que hacer click en el botón iniciar tour de la página principal y seguir los pasos.'
    },
    {
      'question': '¿Dónde puedo ver mis tour creados?',
      'answer':
          'Puedes ver todos tus tour creados accediendo a tu área de usuario.'
    },
    {
      'question':
          '¿Llegaría alguna confirmacion de que se ha hecho correctamente?',
      'answer':
          'Sí, te llegaría una confirmación con todos los detalles del tour a tu cuenta de correo registrada en la aplicación.'
    },
    {
      'question':
          '¿Cómo puedo ver los eventos de la ciudad de Córdoba en el calendario de la aplicación?',
      'answer':
          'Para ver consultar los eventos solo tienes que pichar en el día deseado, justo abajo aparecerá toda la información.'
    },
    {
      'question': '¿Cómo puedo ver la localización de los lugares destacados?',
      'answer':
          'Para acceder a su localización simplemente pincha en mas información, donde obtendras una galeria de imagenes de lugar y justo abajo un botón que directamente te dirige a Google Maps en tu movil.'
    },
    {
      'question': '¿Qué puedo ver en la sección Lugares de Interés?',
      'answer':
          'Aquí podras encontrar la información de todos los lugares relacionados con Cultura, Ocio y Naturaleza de la ciudad de Córdoba.'
    },
    {
      'question': '¿Dónde puedo consultar los mejores restaurantes?',
      'answer':
          'En la barra lateral tienes la opción Gastronomía, aqui encontrarás los mejores restuarantes de la ciudad.'
    },
    {
      'question': '¿Cómo puedo saber los horarios de los monumentos?',
      'answer':
          'En el menú lateral encontrarás la opción de Horarios a Monumentos, donde podras encontrar toda la información detallada y actualizada.'
    },
    {
      'question': '¿Cómo puedo salir de la aplicación de forma segura?',
      'answer':
          'En la barra lateral en la parte inferior izquierta tienes el botón de salir, toda tu información se almacenará en nuestra base de datos de forma segura.'
    },
  ];
// vista
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Área de ayuda para el usuario',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder( // lista bucle, muestra lista completa
        padding: const EdgeInsets.all(16.0),
        itemCount: faq.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), 
                    border: Border.all(
                      color: Color(0xFF2B1E16), 
                      width: 1, 
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 122, 85, 62).withOpacity(0.5), 
                        spreadRadius: 2, 
                        blurRadius: 4, 
                        offset: Offset(0, 2), 
                      ),
                    ],
                  ),
                  child: Text(
                    faq[index]['question']!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Color(0xFF2B1E16)),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  faq[index]['answer']!,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                      color: Color(0xFF2B1E16)),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
