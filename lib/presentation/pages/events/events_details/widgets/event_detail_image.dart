import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget event_deatil_image(BuildContext context) {
  return Container(
      height: 350,
      child: Stack(children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: const AssetImage("assets/images/imagen1.jpeg"),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: 350,
          color: Colors.black.withOpacity(0.4),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Fiesta en casa de Jhon",
                      style: new TextStyle(fontSize: 30, color: Colors.white)),
                  Text("12 de octubre",
                      style: new TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ))
      ]));
}
