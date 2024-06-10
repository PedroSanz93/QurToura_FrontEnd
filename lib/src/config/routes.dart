import 'import.dart';
// Rutas principales del login y del tabbar de la homescreen
class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/pagina2': (context) => const Pagina2(),
    '/pagina3': (context) => Pagina3(),
    '/pagina1': (context) => const Pagina1(),
  };
}

