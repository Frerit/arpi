import 'package:arpi/common/components/title_what_is.dart';
import 'package:arpi/controllers/profile_controller/profile_controllers.dart';
import 'package:arpi/scenes/my_data/my_data_view.dart';
import 'package:arpi/scenes/myarpis/my_arpis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final controller = ProfileController.to;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset("assets/bienveperfil.png", fit: BoxFit.contain,),
                  Padding(
                    padding: const EdgeInsets.only(top: 81),
                    child: Center(
                      //heightFactor: 4.5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 26),
                        decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(50)),
                        child: Text("LJ", style: TextStyle(fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2,),
              Obx( () =>
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Text(controller.firstname.value,
                        style: TextStyle(fontSize: 22,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,)),
                      Text(controller.lastname.value,
                          style: TextStyle(fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,)),
                      SizedBox(height: 10,),
                      TitleWhatIs(title: "Mi Perfil",),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => MydataView())),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/inicia_sesion.png", width: 25, height: 25, color: Colors.black54,),
                                  SizedBox(width: 10,),
                                  Text("Mis Datos", style: TextStyle(fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,))
                                ],
                              ),
                            ),
                            SizedBox(height: 25,),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => MyArpisView())),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/arpis_peq.png", width: 25, height: 25, color: Colors.black54,),
                                    SizedBox(width: 10,),
                                    Text("Mis ARPIs", style: TextStyle(fontSize: 20,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,))
                                  ],
                                ),
                            ),
                            SizedBox(height: 25,),
                            InkWell(
                              onTap: () => auth.signOut(),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.logout, color: Colors.black54,),
                                  SizedBox(width: 10,),
                                  Text("Cerrar sesión", style: TextStyle(fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}