import 'package:cade_meu_pet/app/ui/screens/login/login.dart';
import 'package:get/route_manager.dart';

import 'app_routes.dart';
import '../app/ui/screens/screens.dart';
import '../app/bindings/bindings.dart';

/// All pages
class AppPages {
  /// ATENÇÃO: A PRIMEIRA ROTA DA FILA, DEVE SER SEMPRE A DE ENTRADA DO APP
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.registerPet,
      page: () => const RegisterPetcreen(),
    ),
    GetPage(
      name: Routes.registerPetFinisched,
      page: () => const FinischedInsertDataScreen(),
    ),
    GetPage(
      name: Routes.registerUser,
      page: () => const RegisterUserScreen(),
      binding: UserBindings(),
    ),
  ];
}
