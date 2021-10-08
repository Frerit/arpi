import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController{
  static RegisterController to = Get.put(RegisterController());
  final TextEditingController teFirstname = TextEditingController();
  final TextEditingController teLastname = TextEditingController();
  final TextEditingController teEmail = TextEditingController();
  final TextEditingController teBirthday = TextEditingController();
  final _dbUser = FirebaseFirestore.instance.collection("users");
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User> get getUser async => _auth.currentUser;
  final box = GetStorage();

  final firstname = "".obs;
  final lastname = "".obs;
  final email = "".obs;
  final birthday = "".obs;

  @override
  void onInit() {
    registerUsersFirebase();
    super.onInit();
  }

  registerUsersFirebase(){
    final uuid = FirebaseAuth.instance.currentUser.uid;
    _dbUser.doc(uuid).get().then( (value) {
      if (value.exists) {
        print(value);
      } else{
        final user = _auth.currentUser;
        final name = user.displayName.split(" ");
        teEmail.text = user.email;
        teFirstname.text = name[0];
        teLastname.text = name[1];
      }
    });
  }

  void saveRegisterUsers() {

    final user = _auth.currentUser;
      _dbUser.doc(user.uid).set({
        "firstname" : teFirstname.text,
        "lastname" : teLastname.text,
        "birthday" : teBirthday.text,
        "email" : teEmail.text,
      }).then((value){
        Get.back();
      });

  }

  void showDatepicker(BuildContext context) async {
    final date = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()
    );
    teBirthday.text = "${date.day}/${date.month}/${date.year}";
  }
}