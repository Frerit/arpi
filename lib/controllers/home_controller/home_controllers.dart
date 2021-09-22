import 'package:arpi/models/home_model/home_models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectIconsChatController extends GetxController {
  static SelectIconsChatController get to =>
      Get.put(SelectIconsChatController());
  final box = GetStorage();
  RxList<ListItem> iconsSelected = RxList<ListItem>();

  selectIcons(ListItem item, int index) {
    iconsSelected.add(item);
  }

  deselectIcons(ListItem item, int index) {
    iconsSelected.remove(item);
  }

}
