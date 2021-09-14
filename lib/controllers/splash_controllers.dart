class SplashController extends GetxController{
  static SplashController to = Get.put(SplashController());

  @override
  void OnReady() {
    Timer(Duration(seconds: 5), ()){
      Get.to(HomeView);
    }
  }
}