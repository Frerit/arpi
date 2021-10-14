import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget{

  final String title;
  final String immage;
  const TextContainer({
    Key key, this.title, this.immage,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.white,
        height: 50,
        child: Row(
          children: [
            Image.asset(immage,
              width: 23,
              height: 30,
              color: Colors.black54,
            ),
            SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                )
            )
          ],
        )
    );
  }
}