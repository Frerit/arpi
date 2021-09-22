import 'package:arpi/scenes/que_es/what_is_view.dart';
import 'package:arpi/scenes/sign_in/register_view.dart';
import 'package:arpi/scenes/sign_in/signin_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';

import '../arpis/arpis_view.dart';
import '../projects/projects_views.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}


page(items) {
  var currentpage = items;
  switch (currentpage) {
    case 0:
      return ProjectView();
    case 1:
      return ArpisView();
    case 2:
      return SigninView();
    case 3:
      return WhatisView();
    default:
      return ArpisView();
  }
}


class _HomeViewState extends State<HomeView> {
  var currentpage;

  @override
  void initState() {
    super.initState();
    showLoader(isModal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page(currentpage),
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
                : Image.asset("assets/inicia_sesion.png"), title: "Iniciar Sesión"),
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
    );
  }
}