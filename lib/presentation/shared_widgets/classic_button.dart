import 'package:caribe_tour/presentation/constants.dart';
import 'package:flutter/material.dart';

class ClassicButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressedFn;
  final List<Color> colors;
  final double width;
  final double height;

  const ClassicButton({
    Key key,
    @required this.child,
    @required this.onPressedFn,
    this.colors,
    this.width = 200,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(80.0)),
        boxShadow: [
          BoxShadow(
            color: colors == null
                ? kPrimaryColor.withOpacity(0.2)
                : colors[0].withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: FlatButton(
        onPressed: onPressedFn,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88,
            minHeight: 40,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors ?? [kPrimaryColor, kPrimaryDarkerColor],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          ),
          child: child,
        ),
      ),
    );
  }
}
