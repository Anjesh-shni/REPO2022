import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/widget/bigtext.dart';
import 'package:mystore/widget/colors.dart';

void ShowCuastomSnackBAr(String messege,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    messege,
    snackPosition: SnackPosition.TOP,
    backgroundColor: ApClrs.mainClr,
    titleText: BigText(
      text: title,
      color: Colors.black,
      size: 16,
    ),
    messageText: Text(
      messege,
      style: TextStyle(
        color: Colors.redAccent,
      ),
    ),
  );
}
