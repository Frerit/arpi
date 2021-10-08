import 'package:arpi/controllers/register_controllers/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final controller = RegisterController.to;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: Get.width,
          height: Get.height,
          color: Colors.white70,
          child: ListView(
            children: [
              Center(
                child: Image.asset("assets/logo_home.png",
                    width: Get.width / 4),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(right: 125),
                child: Column(
                  children: [Text("Agrega la información",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Column(
                  children: [Container(
                    child: TextFormField(
                        validator: (value) => value.isEmpty ? 'Campo nombre obligatorio': null,
                        controller: controller.teFirstname,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                        cursorColor: Colors.black54,
                      decoration: InputDecoration(
                          fillColor: Colors.white38,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusColor: Colors.white70,
                        labelText: "Nombre",
                        labelStyle: TextStyle(fontSize: 15,
                            color: Colors.black54),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          )
                        )
                      )
                    ),
                  ),
                    SizedBox(height: 5,),
                    Container(
                      child: TextFormField(
                          validator: (value) => value.isEmpty ? 'Campo apellido obligatorio' : null,
                          controller: controller.teLastname,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusColor: Colors.white70,
                              labelText: "Apellido",
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.black54),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                  )
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Asegúrate de que coincide con el nombre que aparece en tu identificación "
                        "oficial",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: TextFormField(
                          validator: (value) => value.isEmpty ? 'Campo obligatorio' : null,
                          controller: controller.teBirthday,
                          textAlign: TextAlign.left,
                          onTap: () async {
                            controller.showDatepicker(context);
                          },
                          readOnly: true,
                          keyboardType: TextInputType.datetime,
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusColor: Colors.white70,
                              labelText: "Fecha de Nacimiento",
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.black54),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                  )
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Debes tener al menos 18 años para registrarte. Los demás usuarios "
                        "de ARPI no podrían ver tu fecha de nacimiento",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: TextFormField(validator: (value) => value.isEmpty ? 'Email invalido': null,
                          controller: controller.teEmail,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.datetime,
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusColor: Colors.white70,
                              labelText: "Correo electrónico",
                              labelStyle: TextStyle(fontSize: 15,
                                  color: Colors.black54),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                  )
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Te enviaremos una confirmación de registro por correo electrónico",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                    SizedBox(height: 25,),
                    RichText(text: TextSpan(
                      children: [TextSpan(text: "Al seleccionar ",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                        TextSpan(text: "Aceptar y continuar ",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        TextSpan(text: "a continuación, acepta los ",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 12),
                        ),
                        TextSpan(text: "términos de servicio, Términos de pago del servicio, Pólitica "
                            "de privacidad",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                              fontSize: 12),
                        ),
                        TextSpan(text: " de ARPI",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 12),
                        ),
                      ]
                    )
                    ),
                    SizedBox(height: 20,),
                    Container(
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
                            onPressed: () {
                              // Llamar al controler y registrar el usurio con los datos qeu lleno
                              controller.saveRegisterUsers();
                            },
                            child: Text("Aceptar y continuar",
                              style: TextStyle(color: Colors.amber,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                              ),
                            )
                        )
                    ),
                    SizedBox(height: 25,),
                    RichText(text: TextSpan(
                        children: [TextSpan(text: "ARPI te enviará ofertas exclusivas para miembros, "
                            "contenido inpirador, correos electrónicos comerciales y notificaciones push. "
                            "Puedes optar por dejar de recibirlos en cualquier momento a través del "
                            "apartado de configuración de tu cuenta o directamente desde alguna de las "
                            "notificaciones que te llegue",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                        ]
                    )
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.7,
                            child: RichText(text: TextSpan(
                                children: [TextSpan(text: "No quiero abrir mensajes promocionales de ARPI",
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13),
                                ),
                                ]
                            )
                            ),
                          ),
                          Switch(
                              value: isSwitched,
                              onChanged: (value){
                                setState(() {
                                  isSwitched = value;
                                });
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
