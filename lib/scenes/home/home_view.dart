import 'package:arpi/controllers/signin_controllers/login_controller.dart';
import 'package:arpi/scenes/profile/profile_view.dart';
import 'package:arpi/scenes/sign_in/signin_view.dart';
import 'package:arpi/scenes/what_is/what_is_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../arpis/arpis_view.dart';
import '../projects/projects_views.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with TickerProviderStateMixin {
  var currentpage;
  AuthController controller = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text('¿Deseas cerrar la aplicación?'), actions: <Widget>[
                RaisedButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(true)),
                RaisedButton(
                    child: Text('Cancelar'),
                    onPressed: () => Navigator.of(context).pop(false)),
              ]
          )
      ),
      child: Scaffold(
        body: Obx(() => page(currentpage, controller.isLogin.value) ),
        bottomNavigationBar: ConvexAppBar(
            activeColor: Colors.amber,
            color: Colors.grey,
            backgroundColor: Colors.black87,
            style: TabStyle.react,
            items: [
              TabItem(icon: currentpage == 0
                  ? Image.asset("assets/proyectos_grande.png")
                  : Image.asset("assets/proyectos_peq.png"), title: "Proyectos"),
              TabItem(icon: currentpage == 1
                  ? Image.asset("assets/arpis.png")
                  : Image.asset("assets/arpis_peq.png"), title: "ARPIS"),
              TabItem(icon: currentpage == 2
                  ? Image.asset("assets/mi_perfil.png")
                  : Image.asset("assets/inicia_sesion.png"),
                  title: Get.width < 350 ? "Perfil" : "Iniciar Sesión"),
              TabItem(icon: currentpage == 3
                  ? Image.asset("assets/que_es_grand.png")
                  : Image.asset("assets/que_es_peq.png"), title: "¿Qué es?"),
            ],
            initialActiveIndex: 1,
            onTap: (int i) {
              setState(() {
                currentpage = i;
              });
            }
        ),
      ),
    );
  }
}

 page(items, bool isLoggin) {
  var currentpage = items ;
  switch (currentpage) {
    case 0:
      return ProjectView();
    case 1:
      return ArpisView();
    case 2:
      return isLoggin ? ProfileView() : SigninView();
    case 3:
      return WhatisView();
    default:
      return ArpisView();
  }
}
