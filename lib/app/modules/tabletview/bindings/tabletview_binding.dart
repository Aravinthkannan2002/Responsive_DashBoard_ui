import 'package:get/get.dart';

import '../controllers/tabletview_controller.dart';

class TabletviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabletviewController>(
      () => TabletviewController(),
    );
  }
}
