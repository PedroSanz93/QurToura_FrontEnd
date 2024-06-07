import 'package:aplicacion_basica_curso/src/ui/views/crear_tour.dart';
import 'package:flutter/material.dart';
// pagina1 homescreen
class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            GradientText(
              'CREA TU EXPERIENCIA\nPERSONALIZADA',
              gradient: LinearGradient(
                colors: [Color(0xFF2B1E16), Color(0xFF2B1E16)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  'https://www.hola.com/imagenes/viajes/20200717172215/la-mezquita-de-cordoba-mas-bella-a-la-caida-de-la-noche/0-848-73/mezquita-de-cordoba-noche-exterior-t.jpg?im=Resize=(680)',
                  alignment: Alignment.center,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text(
                      'Error al cargar la imagen',
                      style: TextStyle(color: Color(0xFF2B1E16)),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                // ruta para crear tour
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateTour()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B1E16),
              ),
              child: const SizedBox(
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
            SizedBox(
              height: 40,
            ),
            // apartado de reseñas
            Text(
              'Opiniones de Usuarios',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B1E16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildRatingStars(5, 120),
            _buildRatingStars(4, 80),
            _buildRatingStars(3, 50),
            _buildRatingStars(2, 20),
            _buildRatingStars(1, 10),
            SizedBox(
              height: 30,
            ),
            // Opiniones
            Column(
              children: _buildOpinions(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRatingStars(int stars, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Row(
            children: List.generate(
              stars,
              (index) => Icon(Icons.star, color: Colors.yellow[700]),
            ),
          ),
          SizedBox(width: 8),
          Text('$count votos positivos'),
        ],
      ),
    );
  }
  // lista con reseñas
  List<Widget> _buildOpinions() {
    final List<String> opinions = [
      "¡Excelente servicio y atención!",
      "Una experiencia inolvidable, muy recomendada.",
      "Todo salió perfecto, superó nuestras expectativas.",
      "La mejor manera de conocer la ciudad.",
      "Muy profesional y bien organizado.",
      "Nos encantó, volveríamos a hacerlo.",
      "Una aventura fantástica de principio a fin.",
      "Guías muy capacitados y amigables.",
      "Vale cada centavo, totalmente satisfecho.",
      "Lo recomendaré a todos mis amigos.",
    ];
    // retorno del map
    return opinions.map((opinion) {
      return ListTile(
        leading: Icon(Icons.thumb_up, color: Colors.green),
        title: Text(opinion),
      );
    }).toList();
  }
}
// formato texto opiniones
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    required this.style,
    this.textAlign,
  });

  final String text;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
        textAlign: textAlign,
      ),
    );
  }
}

