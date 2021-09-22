import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:arpi/models/project_models/project_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProjectView extends StatefulWidget {
  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  ProjectController controller = ProjectController.to;

  final formatCurrency = NumberFormat("\$#,##0", "en_US");
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
                  padding: EdgeInsets.all(5),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("fl_content")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      print(snapshot);
                      if(snapshot.connectionState == ConnectionState.active) {
                        final datos = snapshot.data.docs;
                        return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot data = snapshot.data.docs[index];
                              if (data["_fl_meta_"]["schema"] == "proyectos") {
                                ProjectModel proyecto = controller.convertModel(data);
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    topRight: Radius.circular(12)),
                                                child: Image.asset('assets/proyect1.jpg',
                                                  fit: BoxFit.cover,),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                  width: Get.width * 0.8,
                                                  color: Colors.white54,
                                                  child: Container(
                                                    width: Get.width * 0.8,
                                                    height: 10,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      child: LinearProgressIndicator(
                                                        minHeight: 10,
                                                        backgroundColor: Colors.grey,
                                                        valueColor: AlwaysStoppedAnimation(Colors.amber),
                                                        value: proyecto.detalleDeLaInversion.porcentaje / 100,
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              SizedBox(height: 5,),
                                              proyecto.proximamente
                                                  ? Row(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                                                  child: Text("PRÓXIMAMENTE-", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
                                                )
                                              ])
                                                  : Row(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(left: 15),
                                                      width: Get.width / 2,
                                                      height: Get.height * 0.08,
                                                      child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(text:"${formatCurrency.format( proyecto.detalleDeLaInversion.valorArpis ) }" ,
                                                                  style: TextStyle(color: Colors.black,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 16),
                                                                ),
                                                                TextSpan(text: " Acción/m2 ",
                                                                  style: TextStyle(color: Colors.black,
                                                                      fontWeight: FontWeight.w300,
                                                                      fontSize: 11.5),
                                                                ),
                                                                TextSpan(text: "${proyecto.detalleDeLaInversion.acciones} Acciones/${proyecto.detalleDeLaInversion.acciones} m2",
                                                                  style: TextStyle(color: Colors.black,
                                                                      fontWeight: FontWeight.w300,
                                                                      fontSize: 11.5),
                                                                ),
                                                              ]
                                                          )
                                                      )
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(left: 15),
                                                      width: Get.width / 3,
                                                      child: RichText(text: TextSpan(
                                                          children: [
                                                            TextSpan(text: "${proyecto.detalleDeLaInversion.acionesDisponibles}",
                                                              style: TextStyle(color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 15),
                                                            ),
                                                            TextSpan(text: "Acciones disponibles",
                                                              style: TextStyle(color: Colors.black,
                                                                  fontWeight: FontWeight.w300,
                                                                  fontSize: 14),
                                                            ),
                                                          ]
                                                      )
                                                      )
                                                  ),
                                                ],
                                              )
                                            ]
                                        ),
                                      ), SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 5,
                                            height: 25,
                                            color: Colors.amber,
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: RichText(text: TextSpan(
                                                children: [
                                                  TextSpan(text: "${proyecto.nombreProyecto}",
                                                    style: TextStyle(color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  TextSpan(text: "${proyecto.ubicacion}",
                                                    style: TextStyle(color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 18),
                                                  ),
                                                ]
                                            )
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: Get.width * 0.92,
                                          height: 0.3,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else{
                                return SizedBox();
                              }
                            }
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
              )
          )
        ],
      ),
    );
  }
}