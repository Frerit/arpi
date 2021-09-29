import 'package:arpi/models/project_models/project_models.dart';
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

  ProjectModel convertModel(QueryDocumentSnapshot item) {
     final model = ProjectModel.fromJson(item);
     if (model != null) {
       return model;
     }
  }

  ProjectModel convertModelFromQuery(DocumentSnapshot item) {
    final model = ProjectModel.fromSnapshot(item);
    if (model != null) {
      return model;
    }
  }
}