import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:brocklyn_cafe/widget/icon&text.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            size: Dimen.font26,
          ),
          SizedBox(
            height: Dimen.height10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: ApClrs.mainClr,
                    size: Dimen.height15,
                  ),
                ),
              ),
              SizedBox(
                width: Dimen.width10,
              ),
              SmallTxt(text: "4.5"),
              SizedBox(
                width: Dimen.width10,
              ),
              SmallTxt(text: "1250"),
              SizedBox(
                width: Dimen.width5,
              ),
              SmallTxt(text: "Comments"),
            ],
          ),
          SizedBox(
            height: Dimen.height15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: ApClrs.iconClr1,
              ),
              IconAndText(
                icon: Icons.location_on,
                text: "1.5km",
                iconColor: ApClrs.mainClr,
              ),
              IconAndText(
                icon: Icons.access_time_rounded,
                text: "Normal",
                iconColor: ApClrs.iconClr2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
