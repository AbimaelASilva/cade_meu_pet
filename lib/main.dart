import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/pro_translations.dart';
import 'routes/routes.dart';

void main() async {
  runApp(const ProApp());
}

class ProApp extends StatelessWidget {
  const ProApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preço Bom',
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      unknownRoute: AppPages.routes.first,
      translations: ProTranslations(),

      ///TODO(Abimael): Aqui faz-s o ajuste para o Get trocar alinguagem do aplicativo
      //locale: Get.deviceLocale,
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('pt', 'BR'),
      theme: ThemeData(
        // colorSchemeSeed: Colors.green[700],
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.green[700],
          secondary: Colors.green[700],
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          hintStyle: TextStyle(
            color: Colors.green[700],
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
