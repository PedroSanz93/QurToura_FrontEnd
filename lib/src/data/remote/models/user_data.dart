// clase modelo usuario
class UserData {
  static final UserData _instance = UserData._internal();
  // factory para instanciar
  factory UserData() {
    return _instance;
  }
  UserData._internal();
  // atributos para crear los tours
  List<dynamic>? datosUsuarioTours;
  List<dynamic>? datosLugaresInteresarioTours;
  int tiempoEstimadoTour = 0;
}
