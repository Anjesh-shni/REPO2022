import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallTxt extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallTxt({
    Key? key,
    this.color = const Color(0xff332d2b),
    this.size = 12,
    required this.text,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: size,
        color: color,
      ),
    );
  }
}
