import 'package:arpi/scenes/sign_in/register_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController to = Get.put(ProfileController());

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User> get getUser async => _auth.currentUser;
  final firstname = "".obs;
  final lastname = "".obs;
  final email = "".obs;
  final phone = "".obs;

  @override
  void onReady() {
    getDataFromFirebase();
    super.onReady();
  }

  getDataFromFirebase() {
    final uuid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection("users").doc(uuid).get().then( (value) async {
      if (value.exists) {
        print(value);
      } else {
        Get.to(() => RegisterView());
      }
    });
  }
}