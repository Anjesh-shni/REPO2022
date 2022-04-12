import 'package:brocklyn_cafe/pages/auth/sign_in_page.dart';
import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/accoun_widget.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        centerTitle: true,
        title: BigText(text: "Profiles"),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimen.height20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            // profiles
            AppIcon(
              icon: Icons.person,
              backgound: ApClrs.mainBlackClr,
              size: Dimen.height15 * 10,
              iconSize: Dimen.height45 + Dimen.height30,
              iconColor: Colors.white,
            ),
            //Name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Dimen.height30),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgound: Colors.green.shade300,
                        size: Dimen.height10 * 5,
                        iconSize: Dimen.height15 + Dimen.height10,
                        iconColor: ApClrs.mainBlackClr,
                      ),
                      bigText: BigText(
                        text: "Anjesh",
                      ),
                    ),
                    //phone
                    SizedBox(height: Dimen.height20),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgound: ApClrs.yllowClr,
                        size: Dimen.height10 * 5,
                        iconSize: Dimen.height15 + Dimen.height10,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "+977-9819868628",
                      ),
                    ),
                    //Email
                    SizedBox(height: Dimen.height20),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgound: ApClrs.yllowClr,
                        size: Dimen.height10 * 5,
                        iconSize: Dimen.height15 + Dimen.height10,
                        iconColor: Colors.grey,
                      ),
                      bigText: BigText(
                        text: "anjeshshni1@gmail.com",
                      ),
                    ),
                    //Location
                    SizedBox(height: Dimen.height20),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgound: ApClrs.yllowClr,
                        size: Dimen.height10 * 5,
                        iconSize: Dimen.height15 + Dimen.height10,
                        iconColor: Colors.green,
                      ),
                      bigText: BigText(
                        text: "Kapan, futsal ground",
                      ),
                    ),
                    SizedBox(height: Dimen.height20),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message,
                        backgound: Colors.red,
                        size: Dimen.height10 * 5,
                        iconSize: Dimen.height15 + Dimen.height10,
                        iconColor: Colors.white,
                      ),
                      bigText: BigText(
                        text: "Notifications",
                      ),
                    ),
                    SizedBox(height: Dimen.height20),
                    InkWell(
                      onTap: () {
                        Get.to(SignInPage());
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout_rounded,
                          backgound: Colors.grey,
                          size: Dimen.height10 * 5,
                          iconSize: Dimen.height15 + Dimen.height10,
                          iconColor: ApClrs.mainBlackClr,
                        ),
                        bigText: BigText(
                          text: "Logout",
                        ),
                      ),
                    ),
                    SizedBox(height: Dimen.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
