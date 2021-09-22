import 'package:arpi/scenes/home/home_view.dart';
import 'package:arpi/scenes/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ots/ots.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(Arpi());
}

class Arpi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OTS(
      showNetworkUpdates: true,
      child: GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        transitionDuration: Duration(microseconds: 35),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          canvasColor: Colors.black87,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          unselectedWidgetColor: Colors.black87,
        ),
        initialRoute: "/",
        getPages: [GetPage(name: '/', page: () => SplashScreen())] ,
      ),
    );
  }
}
