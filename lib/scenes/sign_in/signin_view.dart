import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninView extends StatefulWidget {

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white70,
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/logo_home.png",
                  width: Get.width / 4),
            ),

            SizedBox(height: 30,),

            Container(
                padding: EdgeInsets.all(5),
                height: Get.height * 0.1,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Inicia Sesión",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          TextSpan(text: " o regístrate en ",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 22),
                          ),
                          TextSpan(text: "ARPI",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ]
                    )
                )
            ),

            SizedBox(height: 30,),

            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                width: Get.width * 0.9,
                height: Get.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Image(image: AssetImage("assets/logo-de-facebook.png")),
                    SizedBox(width: 30),
                    Text("Continuar con Facebook",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 18),
                    ),
                  ],
                ),

              ),
            ),

            SizedBox(height: 15,),

            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                width: Get.width * 0.9,
                height: Get.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Image(image: AssetImage("assets/google-plus.png")),
                    SizedBox(width: 30,),
                    Text("Continuar con Google",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),

            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                width: Get.width * 0.9,
                height: Get.height * 0.08,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Image(image: AssetImage("assets/linkedin.png")),
                    SizedBox(width: 30,),
                    Text("Continuar con LinkedIn",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )

          ]
        )
      ),
    );
  }
}
