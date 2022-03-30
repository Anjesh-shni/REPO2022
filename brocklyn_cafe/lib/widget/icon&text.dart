import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';


class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimen.icon24,
        ),
        SizedBox(
          width: Dimen.width5,
        ),
        SmallTxt(
          text: text,
        ),
      ],
    );
  }
}
