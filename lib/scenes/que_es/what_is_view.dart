import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatisView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white70,
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Image(image: AssetImage("assets/que_es_image.png")
                  ),
                ],
              ),
            ),
            SizedBox(height: 1,),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 25,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 8,),
                      Text("QUÉ ES ARPI?",
                          style: TextStyle
                            (color: Colors.black,
                              fontWeight: FontWeight.bold)
                      ),
                      Icon(Icons.arrow_drop_down, size: 40,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*children: [
Container(
child: Column(
children: [
Image(image: AssetImage("assets/que_es_image.png")
),
],
),
),
SizedBox(height: 5,),
Container(
height: 50,
padding: EdgeInsets.only(left: 12),
child: Row(
children: [
Container(
width: 5,
height: 25,
color: Colors.amber,
),
SizedBox(width: 8,),
Text("QUÉ ES ARPI?",
style: TextStyle
(color: Colors.black,
fontWeight: FontWeight.bold)
),
Icon(Icons.arrow_drop_down, size: 40,)
]
)
),
Padding(
padding: const EdgeInsets.all(13),
child: Container(
//color: Colors.white,
height: Get.height * 0.18,
child: RichText(
text: TextSpan(
children: [
TextSpan(text: "A R P I  (Acción Real de Propiedad Inmobiliaria), "
"es un NUEVO MODELO de INVERSIÓN INMOBILIARIA desarrollado"
" para personas que quieran participar en la inversión de "
"proyectos de la construcción, valorización y arrendamiento "
"de Inmuebles comerciales y otros usos.",
style: TextStyle(color: Colors.black,
fontWeight: FontWeight.w200,
fontSize: 15),
),
]
)
)
),
),
Padding(
padding: const EdgeInsets.only(left: 14, right: 14),
child: Container(
height: Get.height * 0.001,
color: Colors.white,
),
),
Container(
height: 50,
padding: EdgeInsets.only(left: 12),
child: Row(
children: [
Container(
width: 5,
height: 25,
color: Colors.amber,
),
SizedBox(width: 8,),
Text("CÓMO FUNCIONA?",
style: TextStyle
(color: Colors.black,
fontWeight: FontWeight.bold)
),
Icon(Icons.arrow_drop_down, size: 40,)
]
),
),
Container(
padding: EdgeInsets.all(20),
color: Colors.white,
height: Get.height,
width: Get.width * 0.01,
child: Column(
children: [

],
),
),
],*/
