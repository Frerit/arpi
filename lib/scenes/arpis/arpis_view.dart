import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:arpi/scenes/projects/list_proyects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArpisView extends StatelessWidget{
  ProjectController controller = ProjectController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.grey,
          child: ListView(
            children: [
              Container(
                width: Get.width,
                child:
                Image.asset('assets/home_arpis.png', fit: BoxFit.cover,),
              ),
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
                      (color: Colors.black, fontSize: 18,
                        fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
              Padding(
                  padding: EdgeInsets.only(top:5, left: 5, right: 5),
                  child: Container(
                    height: 600,
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