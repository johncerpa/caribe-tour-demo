import 'package:caribe_tour/presentation/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

/// Esta clase manaje los mensajes ya sean del [ChatBot] o del usuario y los muestra en pantalla
class Message extends StatelessWidget {
  const Message({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(BuildContext context) {
    return <Widget>[
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(right: 3),
        child: CircleAvatar(
          backgroundColor: Colors.grey[100],
          radius: 10,
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: SizedBox(
              height: 50,
              width: 50,
              child: FlareActor(
                "assets/images/robot_assistant.flr",
                animation: "okay",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(BuildContext context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              color: kSecondaryDarkerColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 8),
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 12,
          child: Text(name[0]),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
