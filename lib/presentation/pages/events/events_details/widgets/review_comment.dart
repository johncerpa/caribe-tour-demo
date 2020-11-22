import 'package:flutter/material.dart';

Widget reviewComment(BuildContext context, String text) {
  return Container(
    child: Stack(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Nombre Apellido",
                          style: new TextStyle(
                              color: Color(0xFF4E89AE),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))),
                SizedBox(height: 2),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 15, color: Color(0xFFED6663)),
                      Icon(Icons.star, size: 15, color: Color(0xFFED6663)),
                      Icon(Icons.star, size: 15, color: Color(0xFFED6663)),
                      Icon(Icons.star, size: 15, color: Color(0xFFED6663)),
                      Icon(Icons.star, size: 15, color: Color(0xFFED6663)),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Text(text, textAlign: TextAlign.justify),
                )
              ],
            )),
        Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            height: 40,
            width: 40,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")))),
      ],
    ),
  );
}
