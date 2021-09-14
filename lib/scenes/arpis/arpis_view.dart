import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArpisView extends StatelessWidget{
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white70,
    primary: Colors.black,
    minimumSize: Size(100, 50),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white70,
          child: ListView(
            children: [
              Container(
                width: Get.width,
                child:
                Image.asset('assets/home_arpi.png', fit: BoxFit.cover,),
              ),

              Container(
                height: 50,
                color: Colors.white54,
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 25,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 8,),
                    Text("PROYECTOS EN VENTA",
                        style: TextStyle
                          (color: Colors.black,
                            fontWeight: FontWeight.bold)
                    )
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                    )
                ),
                child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        child: Image.asset('assets/arpitipi.png',
                          fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: Get.width * 0.9,
                        color: Colors.white54,
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation(Colors.amber),
                          value: 0.7,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              width: Get.width / 2,
                              height: Get.height * 0.07,
                              child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(text: "4.723.000/",
                                          style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        TextSpan(text: " Acción/m2",
                                          style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15),
                                        ),
                                        TextSpan(text: "3429 Acciones/3429m2",
                                          style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15),
                                        ),
                                      ]
                                  )
                              )
                          ),
                          Container(
                              width: Get.width / 2,
                              child: RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: "1028 ",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    TextSpan(text: "Accionee disponibles",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                  ]
                              ))
                          ),
                        ],
                      )
                    ]
                ),
              ),

              SizedBox(height: 10,),

              Container(
                height: 130,
                child: Column(
                  children: [
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(text: TextSpan(
                                    text: "CSS- Central de Servicios Sur"
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                        child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () { },
                            child: Text("QUIERO INVERTIR",
                              style: TextStyle(color: Colors.amber,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}