import 'package:arpi/common/components/title_what_is.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatisView extends StatefulWidget {
  @override
  _WhatisViewState createState() => _WhatisViewState();
}

class _WhatisViewState extends State<WhatisView> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white70,
        child: ListView(
          children: [
            Image(image: AssetImage("assets/que_es_image.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleWhatIs(title: "QUÉ ES ARPI?",),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Text("A R P I  (Acción Real de Propiedad Inmobiliaria), "
                    "es un NUEVO MODELO de INVERSIÓN INMOBILIARIA desarrollado"
                    " para personas que quieran participar en la inversión de "
                    "proyectos de la construcción, valorización y arrendamiento "
                    "de Inmuebles comerciales y otros usos.",
                style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.width * 0.92,
                height: 0.3,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleWhatIs(title: "CÓMO FUNCIONA?"),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal:8.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                        children: [TextSpan(text: "1. ",
                          style: TextStyle(color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                          TextSpan(text: "La sociedad creada para administrar y operar el inmueble emite "
                              "las acciones reales de propiedad inmobiliaria ARPIs en función del número "
                              "de m2 que tiene el proyecto, así garantizamos que sean Acciones Reales de "
                              "Propiedad Inmobiliaria, y que el papel siempre tenga un respaldo físico del "
                              "activo fijo que se valoriza.",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 15),
                          )
                        ]
                    ),
                  ),
                  Row(
                    children: [
                      Text("Es decir: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 15
                        ),
                      ),
                      Text("1 ARPI= 1m2 ",
                        style: TextStyle(color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                        children: [TextSpan(
                            text: "2. ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 15
                            )
                        ),
                          TextSpan(text: "Realizamos las rondas de inversión en el proyecto otorgando "
                              "las acciones ARPIS a los compradores y conseguímos los contratos de "
                              "alquiler de los espacios",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 15),
                          ),
                        ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        children: [TextSpan(
                            text: "3. ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 15
                            )
                        ),
                          TextSpan(text: "Una vez en operación, recaudamos los valores de alquiler, pagamos "
                              "los gastos de administración e impuestos y realizamos mensualmente la "
                              "distribución de la renta a cada uno de los accionistas a su cuenta bancaria "
                              "y enviando los reportes a través de la aplicación móvil y el portal web",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 15),
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleWhatIs(title: "ES SEGURO INVERTIR EN ARPIS?"),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal:8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("ARPIS ", style: TextStyle(color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                      ),
                        Text("es una inversión 100% segura porque: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [Text("1. ", style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                      ),
                        Text("Inviertes en propiedad raíz. ",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontSize: 15),
                        ),],
                    ),
                    RichText(
                        text: TextSpan(
                            children: [TextSpan(
                                text: "2. ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)
                            ),
                              TextSpan(text: "Los montos de capital son menores a los requeridos en el modelo tradicional",
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15)
                              )
                            ]
                        )
                    ),
                    RichText(
                        text: TextSpan(
                            children: [TextSpan(
                                text: "3. ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)
                            ),
                              TextSpan(text: "Tu acción está representada en un inmueble real que permanecerá ahí y que"
                                  "se valoriza día a día",
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15)
                              )
                            ]
                        )
                    ),
                    RichText(
                        text: TextSpan(
                            children: [TextSpan(
                                text: "4. ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)
                            ),
                              TextSpan(text: "Gozas del beneficio de un operador inmobiliario que siempre "
                                  "está trabajando en obtener el mejor arrendamiento de todos los espacios "
                                  "del inmueble y trasladando el beneficio por igual a todos los dueños "
                                  "de las ARPIs.",
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15)
                              )
                            ]
                        )
                    ),
                    RichText(
                        text: TextSpan(
                            children: [TextSpan(
                                text: "5. ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)
                            ),
                              TextSpan(text: "Puedes vender o transar fácilmente tus acciones.",
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15)
                              )
                            ]
                        )
                    )
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleWhatIs(title: "CÓMO FUNCIONA?"),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          children:[
                            TextSpan(
                            text: "Área comercial: +57 3013673063. ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 16
                            ))]
                      ),
                    ),
                    SizedBox(height: 1),
                    RichText(
                      text: TextSpan(
                          children: [TextSpan(
                              text: "Correos: gerencia@zonain.com.co ",
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16)
                          )]
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 60),
                        RichText(
                            text: TextSpan(
                            children: [
                              TextSpan(text: "direccion@zonain.com.co ",
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                            ]
                        )),
                      ],
                    ),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(text: "Página Web: www.prinza.com/arpi/ ",
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                            ]
                        )
                    ),
                  ],
                )
            ),
            SizedBox(height: 100)
          ],
        ),
      )
    );
  }
}