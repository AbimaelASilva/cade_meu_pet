import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/ui.dart';
import '../../../controllers/controllers.dart';

class HomeTemplate extends GetView<HomeController> {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'Cadê meu pet?',
          style: ProTextStyles.bold22,
        ),
        centerTitle: true,
      ),
    );
  }
}
