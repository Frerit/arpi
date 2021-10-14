import 'package:arpi/common/components/title_what_is.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyArpisView extends StatefulWidget {

  @override
  _MyArpisViewState createState() => _MyArpisViewState();
}

class _MyArpisViewState extends State<MyArpisView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset("assets/mydataarpi.png"),
                IconButton(icon: Icon(Icons.arrow_back,
                    color: Colors.white, size: 40),
                    onPressed: () => Get.back()
                )
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                height: 50,
                child: Row(
                  children: [
                    Image.asset("assets/arpis_peq.png",
                      width: 23,
                      height: 30,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 10),
                    Text("Mis ARPIs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                children: [
                  TitleWhatIs(
                    title: "Historial Movimientos",),
                  Container(
                    padding: EdgeInsets.only(left: 12, top: 10),
                    child: Text("Sr. Usuario, en el momento usted no cuenta con ARPIs disponibles."),
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white70,
                          primary: Colors.black,
                          minimumSize: Size(100, 50),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "QUIERO INVERTIR",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                              fontSize: 19),
                        )),
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