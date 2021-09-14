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
      padding: EdgeInsets.all(20),
      color: Colors.white70,
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('assets/logo_home.png',
                width: 50, height: 50,),
            ),

            SizedBox(height: 20,),

            Container(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Proyecto",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,),
                        TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 50,),

            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 5,
                    left: 1
                ),
                child: Image.asset('assets/arpitipi.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}