import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/responsivelayout_controller.dart';

class ResponsivelayoutView extends GetView<ResponsivelayoutController> {
  const ResponsivelayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return controller.mobileBody;
          } else if (constraints.maxWidth < 1100) {
            return controller.tabletBody;
          } else {
            return controller.desktopBody;
          }
        },
      ),
    );
  }
}
