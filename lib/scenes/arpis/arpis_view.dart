import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:arpi/scenes/projects/list_proyects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArpisView extends StatefulWidget{

  final id;
  ArpisView({this.id});

  @override
  _ArpisViewState createState() => _ArpisViewState();
}

class _ArpisViewState extends State<ArpisView> {
  ProjectController controller = ProjectController.to;

  Future<String> getData(String fileString) {
    return FirebaseStorage.instance.ref('flamelink').child("media").child(fileString).getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.grey,
          child: ListView(
            children: [

              StreamBuilder(
                stream: FirebaseFirestore.instance
                  .collection("fl_content").doc("XKETitQGyktV5nDIi7Ug").snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if(snapshot.connectionState == ConnectionState.active && snapshot.data != null) {
                    final idImageBack =  snapshot.data["imagebackground"][0].id;
                    return FutureBuilder(
                      future: FirebaseFirestore.instance.collection("fl_files").doc(idImageBack).get(),
                      builder: (context, snapshotFile) {
                        if (snapshotFile.connectionState == ConnectionState.done) {
                          final imageId = snapshotFile.data["file"];
                          return FutureBuilder(
                              future: FirebaseStorage.instance.ref('flamelink').child("media").child(imageId).getDownloadURL(),
                              builder: (context, files) {
                                if( files.connectionState == ConnectionState.done) {
                                  return  Image.network(files.data);
                                } else {
                                  return SizedBox();
                                }
                              });
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  }else{
                    return SizedBox();
                  }
                }
              ),

              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("fl_content").doc("0ipZyc2gW0UeNH2E6iwI").snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if(snapshot.connectionState == ConnectionState.active && snapshot.data != null) {
                      final idImageBack =  snapshot.data["imagebackground"][0].id;
                      return FutureBuilder(
                        future: FirebaseFirestore.instance.collection("fl_files").doc(idImageBack).get(),
                        builder: (context, snapshotFile) {
                          if(snapshotFile.connectionState == ConnectionState.done) {
                            final imageId = snapshotFile.data["file"];
                            return FutureBuilder(
                                future: FirebaseStorage.instance.ref('flamelink').child("media").child(imageId).getDownloadURL(),
                                builder: (context, files) {
                                  if( files.connectionState == ConnectionState.done) {
                                    return  Image.network(files.data);
                                  } else {
                                    return SizedBox();
                                  }
                                });
                          } else {
                            return SizedBox();
                          }
                        },
                      );
                    }else{
                      return SizedBox();
                    }
                  }
              ),

              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.only(top: 10, left: 10,),
                child: Row(
                  children: [
                    Container(
                    width: 5,
                    height: 25,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 8,),
                  Text("PROYECTOS EN VENTA",
                    style: TextStyle
                      (color: Colors.black, fontSize: 16,
                        fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
              Padding(
                  padding: EdgeInsets.only(top:5, left: 5, right: 5),
                  child: Container(
                    height: 700,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("fl_content")
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(snapshot.connectionState == ConnectionState.active) {
                          return ListProyectos(controller: controller,
                              elements: snapshot.data.docs,
                              orientacion: Axis.horizontal,
                              btnInvertir: true);
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
              ),

              SizedBox()
            ],
          ),
        ),
    );
  }
}