import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MydataView extends StatefulWidget {
  @override
  _MydataViewState createState() => _MydataViewState();
}

class _MydataViewState extends State<MydataView> {
  bool value = false;

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
                    Image.asset("assets/inicia_sesion.png",
                      width: 23,
                      height: 30,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 10),
                    Text("Mis Datos",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Email: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                        text: "comercial.coroto@gmail.com",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ))
                  ])),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: true,
                    cursorColor: Colors.black54,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        hintText: "Nombres"),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: true,
                    cursorColor: Colors.black54,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: "Apellidos",
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    autofocus: true,
                    autocorrect: true,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.black54,
                    decoration: const InputDecoration(hintText: "Celular"),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    cursorColor: Colors.black54,
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: "Dirección",
                      fillColor: Colors.black,
                      /* focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                      )*/
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Checkbox(
                        focusColor: Colors.black54,
                        activeColor: Colors.black54,
                        checkColor: Colors.white,
                        value: this.value,
                        onChanged: (bool value) {
                          setState(() {
                            this.value = value;
                          });
                        },
                      ),
                      Text("Quiero recibir información adicional de Arpis.com.co",
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(height: 20,),
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
                          "GUARDAR",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                              fontSize: 19),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}