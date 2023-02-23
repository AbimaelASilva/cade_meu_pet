import 'package:get/route_manager.dart';

import 'app_routes.dart';
import '../app/ui/screens/screens.dart';
import '../app/bindings/bindings.dart';

/// All pages
class AppPages {
  /// ATENÇÃO: A PRIMEIRA ROTA DA FILA, DEVE SER SEMPRE A DE ENTRADA DO APP
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
  ];
}
