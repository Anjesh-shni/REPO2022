import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print("---------Main Page------------------");
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Container(
              margin: EdgeInsets.only(
                top: Dimen.height45 - 10,
                // bottom: Dimen.height10,
              ),
              padding:
                  EdgeInsets.only(left: Dimen.width20, right: Dimen.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Kathmandu",
                        color: ApClrs.mainClr,
                      ),
                      Row(
                        children: [
                          SmallTxt(
                            text: "Kapan",
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimen.height45,
                      height: Dimen.height45,
                      child: Icon(
                        Icons.search,
                        size: Dimen.icon24,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimen.radius15),
                        color: ApClrs.mainClr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // body section
          SizedBox(height: Dimen.font20),
          Expanded(
            child: SingleChildScrollView(
              // child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
