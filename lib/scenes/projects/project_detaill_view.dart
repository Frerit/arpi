import 'package:arpi/common/components/title_what_is.dart';
import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:arpi/models/project_models/project_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailProjectView extends StatefulWidget {

  final id;
  DetailProjectView({this.id});

  @override
  _DetailProjectViewState createState() => _DetailProjectViewState();
}

class _DetailProjectViewState extends State<DetailProjectView> {
  ProjectController controller = ProjectController.to;

  Future<String> getData(String fileString) {
   return FirebaseStorage.instance.ref('flamelink').child("media").child(fileString).getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {

    NumberFormat formatCurrency = NumberFormat("\$#,##0", "en_US");

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: null,
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: Get.width,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [ Container(
                        width: Get.width,
                        child: Image.asset("assets/imagen1.jpg", fit: BoxFit.cover,),
                    ),
                      Container(
                          width: Get.width,
                          child: Image.asset("assets/imagen2.jpg", fit: BoxFit.cover)),
                      Container(
                          width: Get.width,
                          child: Image.asset("assets/imagen3.jpg", fit: BoxFit.cover,)
                      ),
                      Container(
                          width: Get.width,
                          child: Image.asset("assets/imagen4.jpg", fit: BoxFit.cover,)
                      ),
                      Container(
                          width: Get.width,
                          child: Image.asset("assets/imagen5.jpg", fit: BoxFit.cover,)
                      ),
                    ],
                  ),
            ),
                  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 40), onPressed: () => Get.back())
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      TitleWhatIs(title: "DESCRIPCIÓN",),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("fl_content").doc(widget.id).snapshots(),
                        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if(snapshot.connectionState == ConnectionState.active) {
                            ProjectModel proyecto = controller.convertModelFromQuery(snapshot.data);
                            return Container(
                              padding: EdgeInsets.only(top: 10, bottom: 120),
                              child: Column(
                                  children: [ Text(proyecto.descripcion,
                                    style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 16),
                                  ),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: Get.width * 0.99,
                                      height: 0.3,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: TitleWhatIs(title: "UBICACIÓN",),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image.asset("assets/georefencia.png", fit: BoxFit.contain,),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: Get.width * 0.99,
                                      height: 0.3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: TitleWhatIs(title: "CLIENTES ACTUALES",),
                                    ),
                                    Container(
                                      child: Text("Empresas que creyeron en Central de Servicios Sur y YA arrendaron en el Mall:",
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16),),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: new ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                          itemCount: snapshot.data["clientes"].length,
                                          itemBuilder: (context, index){
                                            return FutureBuilder(
                                                future: FirebaseFirestore.instance.collection("fl_content").doc(snapshot.data["clientes"][index].id).get(),
                                                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshotcliente) {
                                                  if (snapshotcliente.connectionState == ConnectionState.done) {
                                                    print(snapshotcliente);
                                                    final imageId = snapshotcliente.data.exists ? snapshotcliente.data["image"][0].id : null;
                                                    return FutureBuilder(
                                                      future: FirebaseFirestore.instance.collection("fl_files").doc(imageId).get(),
                                                      builder: (context, AsyncSnapshot<DocumentSnapshot> snapImage) {
                                                        print(snapImage);
                                                        if (snapImage.connectionState == ConnectionState.done) {
                                                          return FutureBuilder(
                                                              future: getData(snapImage.data["file"]),
                                                              builder: (context, snapStore) {
                                                                if (snapStore.connectionState == ConnectionState.done) {
                                                                  final String urlImage = snapStore.data;
                                                                  return Container(
                                                                    child: Image.network(urlImage, width: Get.width, fit: BoxFit.cover,),
                                                                  );
                                                                } else {
                                                                  return SizedBox();
                                                                }
                                                              });
                                                        }else {
                                                          return SizedBox();
                                                        }
                                                      },
                                                    );
                                                  } else {
                                                    return SizedBox();
                                                  }
                                                }
                                            );
                                          }
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: Get.width * 0.99,
                                      height: 0.3,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: TitleWhatIs(title: "DETALLES DE LA INVERSIÓN",),
                                    ),
                                    SizedBox(height: 30,),
                                    Column(
                                      children: [
                                        Container(
                                            width: Get.width * 1,
                                            child: Container(
                                              width: Get.width * 2,
                                              height: 10,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                child: LinearProgressIndicator(
                                                  minHeight: 15,
                                                  backgroundColor: Colors.white38,
                                                  valueColor: AlwaysStoppedAnimation(Colors.amber),
                                                  value: proyecto.detalleDeLaInversion.porcentaje / 100,
                                                ),
                                              ),
                                            )
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(left: 10),
                                                width: Get.width / 2,
                                                child: RichText(
                                                    text: TextSpan(
                                                        children: [
                                                          TextSpan(text:"${formatCurrency.format( proyecto
                                                              .detalleDeLaInversion.valorArpis ) }" ,
                                                            style: TextStyle(color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14),
                                                          ),
                                                          TextSpan(text: " Acción/m2 ",
                                                            style: TextStyle(color: Colors.black,
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 11.5),
                                                          ),
                                                          TextSpan(text: "${proyecto
                                                              .detalleDeLaInversion.acciones} Acciones/${proyecto
                                                              .detalleDeLaInversion.acciones} m2",
                                                            style: TextStyle(color: Colors.black,
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 11.5),
                                                          ),
                                                        ]
                                                    )
                                                )
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(left: 10),
                                                width: Get.width / 3,
                                                child: RichText(text: TextSpan(
                                                    children: [
                                                      TextSpan(text: "${proyecto
                                                          .detalleDeLaInversion.acionesDisponibles}",
                                                        style: TextStyle(color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                      TextSpan(text: " Acciones disponibles",
                                                        style: TextStyle(color: Colors.black,
                                                            fontWeight: FontWeight.w300,
                                                            fontSize: 12),
                                                      ),
                                                    ]
                                                )
                                                )
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ]
                              ),
                            );
                          }else {
                            return Container();
                          }
                        }
                      )
                    ],
                  ),
                ),
              )
            ]
          ),
        )
    );
  }

}
