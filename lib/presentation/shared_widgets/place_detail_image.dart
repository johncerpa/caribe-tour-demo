import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

Widget place_deatil_image(BuildContext context, String nombre, String link) {
  return Container(
      height: 350,
      child: Stack(children: [
        Container(
          height: 350,
          child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(link)),
        ),
        Container(
          height: 350,
          color: Colors.black.withOpacity(0.4),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(nombre,
                      style: new TextStyle(fontSize: 30, color: Colors.white))
                ],
              ),
            ))
      ]));
}
