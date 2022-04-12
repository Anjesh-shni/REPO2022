import 'dart:convert';
import 'package:brocklyn_cafe/base/empty_cart.dart';
import 'package:brocklyn_cafe/controllers/cart_controller.dart';
import 'package:brocklyn_cafe/models/cart_model.dart';
import 'package:brocklyn_cafe/routes/routes_helper.dart';
import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOderList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> orderTimes = cartItemsPerOderList();
    var ListCounter = 0;

    timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:s")
            .parse(getCartHistoryList[ListCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());

        var outPutFormat = DateFormat("MM/dd/yyyy hh:mm a");
        var outputDate = outPutFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.green.shade300,
            height: Dimen.height20 * 5,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimen.height30, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "Cart Summary",
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getCartPage());
                  },
                  child: AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.black,
                    backgound: Colors.green.shade300,
                    iconSize: 24,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().length > 0
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: Dimen.height20,
                          left: Dimen.width20,
                          right: Dimen.width20),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < orderTimes.length; i++)
                              Container(
                                height: Dimen.height40 * 3,
                                margin: EdgeInsets.only(bottom: Dimen.height20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeWidget(ListCounter),
                                    SizedBox(
                                      height: Dimen.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(orderTimes[i],
                                              (index) {
                                            if (ListCounter <
                                                getCartHistoryList.length) {
                                              ListCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                        right:
                                                            Dimen.width10 / 2),
                                                    height: Dimen.height20 * 4,
                                                    width: Dimen.height20 * 4,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimen.radius15 /
                                                                    2),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(AppConstants
                                                                    .BASE_URL +
                                                                AppConstants
                                                                    .UPLOAD_URL +
                                                                getCartHistoryList[
                                                                        ListCounter -
                                                                            1]
                                                                    .img!))),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        Container(
                                          height: Dimen.height20 * 4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SmallTxt(
                                                text: "Total",
                                                color: ApClrs.titleClr,
                                              ),
                                              BigText(
                                                text: orderTimes[i].toString() +
                                                    " Items",
                                                color: ApClrs.titleClr,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime =
                                                      cartOrderTimeToList();
                                                  Map<int, CartModel>
                                                      moreOrder = {};
                                                  for (int j = 0;
                                                      j <
                                                          getCartHistoryList
                                                              .length;
                                                      j++) {
                                                    if (getCartHistoryList[j]
                                                            .time ==
                                                        orderTime[i]) {
                                                      moreOrder.putIfAbsent(
                                                          getCartHistoryList[j]
                                                              .id!,
                                                          () => CartModel.fromJson(
                                                              jsonDecode(jsonEncode(
                                                                  getCartHistoryList[
                                                                      j]))));
                                                    }
                                                  }
                                                  Get.find<CartController>()
                                                      .setItems = moreOrder;

                                                  Get.find<CartController>()
                                                      .addToCartList();
                                                  Get.toNamed(RouteHelper
                                                      .getCartPage());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: Dimen.width10,
                                                      vertical:
                                                          Dimen.height10 / 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimen.radius15 / 2),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: ApClrs.mainClr),
                                                  ),
                                                  child: SmallTxt(
                                                    text: "See more",
                                                    color: ApClrs.mainClr,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: Center(
                      child: EmptyCartPage(),
                      // child: NoDataPAge(
                      //   text: "Your Cart Is Empty!",
                      //   imgPath: "assets/image/a.jpg",
                      // ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
