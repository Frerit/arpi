import 'package:flutter/material.dart';

class ProjectZurichView extends StatefulWidget {
  final id;
  ProjectZurichView({this.id});

  @override
  _ProjectZurichViewState createState() => _ProjectZurichViewState();

}

class _ProjectZurichViewState extends State<ProjectZurichView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey,
        child: ListView(
          children: [
            GestureDetector(
              onVerticalDragDown: (details) {
                Navigator.pop(context);
              },
              child: Stack(
                children: [
                  HeroMode(
                    child: Hero(tag: widget.id,
                        child: Image.asset('assets/zurich_1.png',
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 5,
                          color: Colors.white70,
                        ),
                      ],
                    ),
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
