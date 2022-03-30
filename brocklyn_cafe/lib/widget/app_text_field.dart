import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:flutter/material.dart';


class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  const AppTextField(
      {Key? key,
      required this.icon,
      required this.textController,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimen.height20, right: Dimen.height20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimen.radius20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText:hintText,
          prefixIcon: Icon(
            icon,
            color: ApClrs.yllowClr,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimen.radius20),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimen.radius20),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimen.radius20),
            // borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
