import 'package:arpi/controllers/project_controller/project_controllers.dart';
import 'package:arpi/models/project_models/project_models.dart';
import 'package:arpi/scenes/projects/project_detaill_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ListProyectos extends StatelessWidget {

  const ListProyectos({
    Key key,
    @required this.controller,
    @required this.elements,
    @required this.orientacion,
    @required this.btnInvertir
  }) : super(key: key);

  final ProjectController controller;
  final List<QueryDocumentSnapshot> elements;
  final Axis orientacion;
  final bool btnInvertir;

  @override
  Widget build(BuildContext context) {

    NumberFormat formatCurrency = NumberFormat("\$#,##0", "en_US");

    return ListView.builder(
        scrollDirection: orientacion,
        itemCount: elements.length,
        itemBuilder: (context, index) {
          QueryDocumentSnapshot data = elements[index];
          if (data["_fl_meta_"]["schema"] == "proyectos") {
            ProjectModel proyecto = controller.convertModel(data);
            return Container(
              width: Get.width * 0.98,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 900),
                        pageBuilder: (context,
                            animation,
                            secondaryAnimation) => DetailProjectView(id: proyecto.id),
                        settings: RouteSettings(
                            arguments: proyecto.id
                        ),
                        transitionsBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      )
                      );
                    },
                    child: HeroMode(
                      enabled: true,
                      child: Hero(
                        tag: proyecto.id,
                        child: Container(
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
                                    color: Colors.white,
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
                                Container(
                                  height: 50,
                                  child: proyecto.proximamente
                                      ? Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                                      child: Text("PRÓXIMAMENTE-", style: TextStyle(fontSize: 25,
                                        fontWeight: FontWeight.bold,),),
                                    )
                                  ])
                                      : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 15),
                                          width: Get.width / 2,
                                          child: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(text:"${formatCurrency.format( proyecto
                                                        .detalleDeLaInversion.valorArpis ) }" ,
                                                      style: TextStyle(color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16),
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
                                          padding: EdgeInsets.only(left: 15),
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
                                  ),
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 5,
                        height: 25,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 5),
                      Text("${proyecto.nombreProyecto}",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: RichText(text: TextSpan(
                            children: [
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: Get.width * 0.92,
                      height: 0.3,
                      color: Colors.white,
                    ),
                  ),
                  btnInvertir
                      ? Container(
                      padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                      child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white70,
                            primary: Colors.black,
                            minimumSize: Size(100, 50),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onPressed: () async {
                            final url = "https://docs.google.com/forms/d/e/1FAIpQLSfjrLVv87drMtdsyqYHp3QKICsprK-ox5qa0ndF1U3OqJG6Iw/viewform";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text("QUIERO INVERTIR",
                            style: TextStyle(color: Colors.amber,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),
                          )
                      )
                  )
                      : SizedBox(),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        }
    );
  }
}