import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/responsivelayout/bindings/responsivelayout_binding.dart';
import '../modules/responsivelayout/views/responsivelayout_view.dart';
import '../modules/tabletview/bindings/tabletview_binding.dart';
import '../modules/tabletview/views/tabletview_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.RESPONSIVELAYOUT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESPONSIVELAYOUT,
      page: () => const ResponsivelayoutView(),
      binding: ResponsivelayoutBinding(),
    ),
    GetPage(
      name: _Paths.TABLETVIEW,
      page: () => const TabletviewView(),
      binding: TabletviewBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () =>  WebviewView(),
      binding: WebviewBinding(),
    ),
  ];
}
