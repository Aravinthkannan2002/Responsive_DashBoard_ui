import 'package:dashboardresponsive/app/modules/home/views/home_view.dart';
import 'package:dashboardresponsive/app/modules/tabletview/views/tabletview_view.dart' show TabletviewView;
import 'package:dashboardresponsive/app/modules/webview/views/webview_view.dart' show WebviewView;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsivelayoutController extends GetxController {
  final Widget mobileBody = const  HomeView();
  final Widget tabletBody =const  TabletviewView();
  final Widget desktopBody =  WebviewView();

  final count = 0.obs;

  void increment() => count.value++;
}
