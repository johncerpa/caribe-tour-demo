import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingResources extends StatelessWidget {
  final Color color1, color2;
  const LoadingResources({@required this.color1, @required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child: const Center(
        child: SizedBox(
          height: 130,
          width: 150,
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 130,
              width: 150,
              child: FlareActor(
                "assets/images/PalmProject.flr",
                animation: "Untitled",
                sizeFromArtboard: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
