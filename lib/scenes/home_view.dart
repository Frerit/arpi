import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'arpis/arpis_view.dart';
import 'projects/projects_views.dart';

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
      return ArpisView();
    case 3:
      return ArpisView();
    default:
      return ArpisView();
  }
}

class _HomeViewState extends State<HomeView> {
  var currentpage;
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
            TabItem(icon: Icons.home, title: "Proyectos",),
            TabItem(icon: Icons.business, title: "ARPIS"),
            TabItem(icon: Icons.account_circle, title: "Iniciar Sesión"),
            TabItem(icon: Icons.info, title: "¿Qué es?"),
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