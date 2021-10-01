import 'package:arpi/common/components/title_what_is.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
        color: Colors.grey,
        child: ListView(
          children: [
            Image(image: AssetImage("assets/que_es_image.png")),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("fl_content").orderBy("posicion", ).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.connectionState == ConnectionState.active) {
                    return new ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot data = snapshot.data.docs[index];
                        if (data["_fl_meta_"]["schema"] == "queEs") {
                          return Container(
                            padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                            child: Column(
                              children: [
                                TitleWhatIs(title: data["titulo"],),
                                Container(
                                  child: Html(data: data["descripcion"]),
                                ),
                              ],
                            ),

                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    );

                  }else{
                    return SizedBox();
                  }
                }
            ),
            SizedBox(height: 50,)
          ],
        ),
      )
    );
  }
}