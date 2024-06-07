class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();

  List<dynamic>? datosUsuarioTours;
  List<dynamic>? datosLugaresInteresarioTours;
  int tiempoEstimadoTour = 0;
}
