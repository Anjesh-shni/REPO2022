import 'package:brocklyn_cafe/pages/auth/signup_page.dart';
import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_text_field.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimen.screenHeight * 0.05,
            ),
            Container(
              height: Dimen.screenHeight * 0.25,
              // margin: EdgeInsets.only(top: Dimen.height30 * 2),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/acc.png"),
                  radius: 60,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimen.width20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: Dimen.height10,
                  ),
                ],
              ),
            ),
            AppTextField(
                icon: Icons.phone,
                textController: phoneController,
                hintText: "Phone"),
            SizedBox(
              height: Dimen.height20,
            ),
            AppTextField(
                icon: Icons.password,
                textController: passwordController,
                hintText: "Password"),
            SizedBox(
              height: Dimen.height10,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimen.width20,
                ),
              ],
            ),
            SizedBox(
              height: Dimen.width20 * 2,
            ),
            Container(
              // margin: EdgeInsets.only(left: Dimen.width30, right: Dimen.width30),
              width: Dimen.screenwidth / 2,
              height: Dimen.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimen.radius20),
                  color: ApClrs.mainClr),
              child: Center(
                child: BigText(
                  text: "Sign in",
                  color: Colors.black,
                  // size: Dimen.font20,
                ),
              ),
            ),
            SizedBox(
              height: Dimen.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Get.to(SignUpPage(), transition: Transition.fadeIn),
                      text: "Create",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
