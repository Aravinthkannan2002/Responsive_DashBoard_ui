import 'package:get/get.dart';

import '../controllers/responsivelayout_controller.dart';

class ResponsivelayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsivelayoutController>(
      () => ResponsivelayoutController(),
    );
  }
}
