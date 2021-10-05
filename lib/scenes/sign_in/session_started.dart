import 'package:arpi/common/components/title_what_is.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Session_StartedView extends StatefulWidget {

  @override
  _Session_StartedViewState createState() => _Session_StartedViewState();
}

class _Session_StartedViewState extends State<Session_StartedView> {
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
                  Image.asset("assets/001.png", fit: BoxFit.contain,),
                  Padding(
                    padding: const EdgeInsets.only(top: 81),
                    // child: Center(
                    //   //heightFactor: 4.5,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    //     decoration: BoxDecoration(
                    //     color: Colors.black54,
                    //     borderRadius: BorderRadius.circular(50)),
                    //     child: Text("LJ", style: TextStyle(fontSize: 28,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,)),
                    //   ),
                    // ),
                  ),
                ],
              ),
              SizedBox(height: 2,),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ Text("Laura Cristina",
                      style: TextStyle(fontSize: 22,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,)),
                    Text("JARAMILLO MORALES",
                        style: TextStyle(fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,)),
                    SizedBox(height: 10,),
                    TitleWhatIs(title: "Mi Perfil",),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/inicia_sesion.png", width: 25, height: 25, color: Colors.black54,),
                        SizedBox(width: 10,),
                        Text("Mis Datos", style: TextStyle(fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,))
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/arpis_peq.png", width: 25, height: 25, color: Colors.black54,),
                        SizedBox(width: 10,),
                        Text("Mis Datos", style: TextStyle(fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,))
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_open, color: Colors.black54,),
                        SizedBox(width: 10,),
                        Text("Contraseña", style: TextStyle(fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,))
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.black54,),
                        SizedBox(width: 10,),
                        Text("Cerrar sesión", style: TextStyle(fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
