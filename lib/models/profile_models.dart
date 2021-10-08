import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModels {

  String id;
  String firstname;
  String lastname;
  String emails;
  DateTime dateofbirth;
  String phone;

  ProfileModels({this.id, this.firstname, this.lastname, this.emails, this.dateofbirth, this.phone});

  ProfileModels.fromJson(QueryDocumentSnapshot json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    emails = json['emails'];
    dateofbirth = json['dateofbirth'];
    phone = json['phone'];
  }

}