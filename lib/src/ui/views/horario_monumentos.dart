import 'package:flutter/material.dart';
// clase horario monumentos
class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);
  @override
  State<Schedule> createState() => _ScheduleState();
}
// lista de assets para pdf
class _ScheduleState extends State<Schedule> {
  List<String> imagePaths = [
    'lib/assets/pdf1.jpg',
    'lib/assets/pdf2.jpg',
    'lib/assets/pdf3.jpg',
    'lib/assets/pdf4.jpg',
    'lib/assets/pdf5.jpg',
    'lib/assets/pdf6.jpg',
    'lib/assets/pdf7.jpg',
    'lib/assets/pdf8.jpg',
    'lib/assets/pdf8.jpg',
    'lib/assets/pdf9.jpg',
    'lib/assets/pdf10.jpg',
    'lib/assets/pdf11.jpg',
    'lib/assets/pdf12.jpg',
    'lib/assets/pdf13.jpg',
    'lib/assets/pdf14.jpg',
    'lib/assets/pdf15.jpg',
    'lib/assets/pdf16.jpg',
    'lib/assets/pdf17.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 122, 85, 62),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Horarios Monumentos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      body: GridView.builder(
        itemCount: imagePaths.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showImageDialog(imagePaths[index]); // llama a lista
            },
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
// funcion para aumentar vision del contenido
  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: InteractiveViewer(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
