import 'package:flutter/material.dart';

class TitleWhatIs extends StatelessWidget {
  final String title;
  const TitleWhatIs({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 5,
            height: 25,
            color: Colors.amber,
          ),
          SizedBox(width: 8,),
          Text(title,
              style: TextStyle
                (color: Colors.black, fontSize: 15,
                  fontWeight: FontWeight.bold)
          ),
          Icon(Icons.arrow_drop_down, size: 40,)
        ],
      ),
    );
  }
}