import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'list_proyects.dart';

class ProjectView extends StatefulWidget {
  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  ProjectController controller = ProjectController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white70,
      child: Column(
        children: [
          Center(
            child: Image.asset("assets/logo_home.png",
                width: Get.width / 4),
          ),
          SizedBox(height: 15,),
          Container(
            child: Row(
              children: [
                Text("Proyectos",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  children: [
                    TextField(cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,
                            color: Colors.grey,size: 35,),
                          border: InputBorder.none,
                        )
                    ),
                  ]
              )
          ),
          Flexible(
              child: Padding(
                  padding: EdgeInsets.only(top:5, left: 5, right: 5),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("fl_content")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if(snapshot.connectionState == ConnectionState.active) {
                        return ListProyectos(controller: controller, elements: snapshot.data.docs, orientacion: Axis.vertical, btnInvertir: false,);
                      } else {
                        return Container();
                      }
                    },
                  )
              ),
          ),
        ],
      ),
    );
  }
}
