import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController{
  static ProjectController to = Get.put(ProjectController());
  final dbContent = FirebaseFirestore.instance.collection("fl_content");
  final RxList<String> cont = RxList<String>();
  

  Future<String> getData() {
    dbContent.where("_fl_meta", isEqualTo: "_fl_meta");
    FirebaseFirestore.instance.collection("fl_content");
  }
}