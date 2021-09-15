import 'dart:async';

import 'package:arpi/scenes/home/home_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  static SplashController to = Get.put(SplashController());

  @override
  void onReady() {
    Timer(Duration(seconds: 5), () => Get.to(HomeView()));
  }
}