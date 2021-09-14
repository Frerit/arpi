import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectView extends StatefulWidget {

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white70,
      child: SafeArea(
         child: ListView(
           children: [
             Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/logo_home.png",
                            fit: BoxFit.cover),
                      ],
                    ),
                  ],
                ),
           )
           ],
         ),
      ),
    );
  }
}