import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Proyectos",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                  children: [
                    TextField(decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      )
                    ),
                  ]
              )
          ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                    children: <Widget>[

                    ]
                ),
              )
        ],
      ),
    );
  }
}