import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimen.height15),
      padding: EdgeInsets.only(
          left: Dimen.width20, top: Dimen.width10, bottom: Dimen.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimen.width10,
          ),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(Dimen.radius15),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(1),
            ),
          ]),
    );
  }
}
