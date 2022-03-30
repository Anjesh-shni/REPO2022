import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';


class ExpandbleText extends StatefulWidget {
  final String text;
  const ExpandbleText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandbleTextState createState() => _ExpandbleTextState();
}

class _ExpandbleTextState extends State<ExpandbleText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimen.screenHeight / 7.12;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallTxt(
              text: firstHalf,
              size: Dimen.font16,
              color: ApClrs.paraClr,
            )
          : Column(
              children: [
                SmallTxt(
                  height: 1.8,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                  size: Dimen.font16,
                  color: ApClrs.paraClr,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallTxt(
                        text: "Show More",
                        color: ApClrs.mainClr,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: ApClrs.mainClr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
