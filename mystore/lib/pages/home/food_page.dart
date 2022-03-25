import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mystore/category_product/category.dart';
import 'package:mystore/category_product/reco_product.dart';
import 'package:mystore/controllers/popular_product_controller.dart';
import 'package:mystore/controllers/recommended_product_controller.dart';
import 'package:mystore/models/popular_product_mooel.dart';
import 'package:mystore/routes/routes_helper.dart';
import 'package:mystore/utils/app_constant.dart';
import 'package:mystore/utils/dimension.dart';
import 'package:mystore/widget/app_column.dart';
import 'package:mystore/widget/bigtext.dart';
import 'package:mystore/widget/colors.dart';
import 'package:mystore/widget/icon&text.dart';
import 'package:mystore/widget/smalltext.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currtPaveValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimen.pageViewCont;

  // @override
  // void initState() {
  //   super.initState();
  //   pageController.addListener(() {
  //     setState(() {
  //       _currtPaveValue = pageController.page!;
  //       // print("current page value is" + _currtPaveValue.toString());
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    print("------------Food Page----------------");
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isloaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 4),
                      child: Text(
                        "List of table",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      height: Dimen.pageView,
                      child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 10,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1.5),
                          // controller: pageController,

                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            int initial = index + 1;
                            return InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blueGrey,
                                    ),
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  index, "home"),
                                            );
                                            Get.snackbar(
                                              "table no:-${initial.toString()} is reserved",
                                              "explore products",
                                              backgroundColor: Colors.white,
                                              colorText: Colors.black,
                                              snackPosition: SnackPosition.TOP,
                                              duration: Duration(seconds: 4),
                                              backgroundGradient:
                                                  LinearGradient(colors: [
                                                Colors.amber,
                                                Colors.redAccent
                                              ]),
                                            );
                                          },
                                          title: Text("Reserve table"),
                                          leading: Icon(
                                            Icons.touch_app,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.9,
                                          color: Colors.white,
                                        ),
                                        ListTile(
                                          onTap: () {},
                                          title: Text("categories"),
                                          leading: Icon(
                                            Icons.touch_app,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  isDismissible: true,
                                  backgroundColor: Colors.white,
                                  enableDrag: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 2),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                margin: EdgeInsets.only(
                                    bottom: 10, right: 10, left: 5),
                                // height: 130,
                                // width: 60,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5.0,
                                      offset: Offset(0, 5),
                                    ),
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      offset: Offset(-5, 0),
                                    ),
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      offset: Offset(5, 0),
                                    ),
                                  ],
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Colors.teal,
                                  //     Colors.redAccent,
                                  //     Colors.amberAccent,
                                  //   ],
                                  //   begin: Alignment.bottomCenter,
                                  //   end: Alignment.topCenter,
                                  // ),

                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/image/t33.jpg"),
                                  ),
                                ),
                                child: Text(
                                  "No:${initial.toString()}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            );
                          }),
                      // child: PageView.builder(
                      //     controller: pageController,
                      //     itemCount: popularProducts.popularProductList.length,
                      //     itemBuilder: (context, positiion) {

                      //       return _buildPageItem(positiion,
                      //           popularProducts.popularProductList[positiion]);
                      //     }),
                    ),
                  ],
                )
              : CircularProgressIndicator(
                  color: ApClrs.mainClr,
                );
        }),

        //Dots section

        // GetBuilder<PopularProductController>(builder: (popularProducts) {
        //   return DotsIndicator(
        //     dotsCount: popularProducts.popularProductList.isEmpty
        //         ? 1
        //         : popularProducts.popularProductList.length,
        //     position: _currtPaveValue,
        //     decorator: DotsDecorator(
        //       activeColor: ApClrs.mainClr,
        //       size: const Size.square(9.0),
        //       activeSize: const Size(18.0, 9.0),
        //       activeShape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(Dimen.radius5)),
        //     ),
        //   );
        // }),
        // Divider(
        //   thickness: 5,
        //   color: Colors.grey,
        // ),
        //Recommended text
        // SizedBox(
        //   height: Dimen.height5,
        // ),
        Container(
          height: 25,
          width: double.maxFinite,
          margin: EdgeInsets.only(
            left: Dimen.width20,
          ),
          child: BigText(
            text: "Categories",
            size: 20,
            color: Colors.amber,
          ),

          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     BigText(text: "Recommended"),
          //     SizedBox(
          //       width: Dimen.width10,
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(bottom: 3),
          //       child: BigText(
          //         text: ".",
          //         color: Colors.black26,
          //       ),
          //     ),
          //     SizedBox(
          //       width: Dimen.width10,
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(bottom: 2),
          //       child: SmallTxt(text: "Food Pairing"),
          //     ),
          //   ],
          // ),
        ),

        //Recommended text

        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isloaded
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Get.toNamed(
                        //   RouteHelper.getrecoCategory(index, "home"),
                        // );
                        // Get.toNamed(
                        //     RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(
                            left: Dimen.width10,
                            right: Dimen.width10,
                            bottom: Dimen.height10),
                        child: Row(
                          children: [
                            // Container(
                            //   width: Dimen.listviewSize,
                            //   height: Dimen.listviewSize,
                            //   decoration: BoxDecoration(
                            //     borderRadius:
                            //         BorderRadius.circular(Dimen.radius20),
                            //     color: Colors.white38,
                            //     image: DecorationImage(
                            //       fit: BoxFit.cover,
                            //       image:
                            //           //  AssetImage("assets/image/a.jpg"),
                            //           //
                            //           //
                            //           NetworkImage(AppConstants.BASE_URL +
                            //               AppConstants.UPLOAD_URL +
                            //               recommendedProducts
                            //                   .recommendedProductList[index]
                            //                   .img!),
                            //     ),
                            //   ),
                            //  ),
                            //  SizedBox(
                            //    width: Dimen.width5,
                            // ),
                            Expanded(
                              child: Container(
                                height: Dimen.listviewTxt,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.grey,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimen.width10,
                                      right: Dimen.width10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              BigText(
                                                text: recommendedProducts
                                                    .recommendedProductList[
                                                        index]
                                                    .name!,
                                                size: 16,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                height: Dimen.height5,
                                              ),
                                              SmallTxt(
                                                text: "tap to explore all item",
                                                size: 14,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),

                                              // SmallTxt(text: "With Chinese property"),
                                              // SizedBox(
                                              //   height: Dimen.height5,
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     IconAndText(
                                              //       icon: Icons.circle_sharp,
                                              //       text: "Normal",
                                              //       iconColor: ApClrs.iconClr1,
                                              //     ),
                                              //     IconAndText(
                                              //       icon: Icons.location_on,
                                              //       text: "1.5km",
                                              //       iconColor: ApClrs.mainClr,
                                              //     ),
                                              //     IconAndText(
                                              //       icon: Icons.access_time_rounded,
                                              //       text: "Normal",
                                              //       iconColor: ApClrs.iconClr2,
                                              //     ),
                                              //   ],
                                              // ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.defaultDialog(
                                                      title: "Warning",
                                                      titleStyle: TextStyle(
                                                          fontSize: 22),
                                                      middleText:
                                                          "You haven't selected table, please select table first",
                                                      backgroundColor:
                                                          Colors.grey,
                                                      barrierDismissible: false,
                                                      radius: 5,
                                                      textCancel: "Cancel",
                                                      textConfirm: "skip",
                                                      onConfirm: () {
                                                        Get.toNamed(
                                                          RouteHelper
                                                              .getrecoCategory(
                                                                  index,
                                                                  "home"),
                                                        );
                                                      },
                                                      confirmTextColor:
                                                          Colors.white,
                                                      cancelTextColor:
                                                          Colors.white,
                                                      buttonColor: Colors.black,
                                                      onCancel: () {
                                                        Get.back();
                                                      });
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                    right: 5,
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      right: 5, left: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "See more",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimen.width5,
                                                      ),
                                                      Icon(Icons
                                                          .arrow_drop_down),
                                                      SizedBox(
                                                        width: Dimen.width5 - 3,
                                                      ),
                                                      // ExpansionTile(
                                                      //   backgroundColor: Colors.grey.shade100,
                                                      //   initiallyExpanded: true,
                                                      //   title: Text(
                                                      //     "Delecious food",
                                                      //     style:
                                                      //         Theme.of(context).textTheme.headline6,
                                                      //   ),
                                                      //   children: [
                                                      //     Title(
                                                      //       color: Colors.grey,
                                                      //       child: Text(
                                                      //         "welcome to deleciou food category",
                                                      //         style: TextStyle(
                                                      //           color: Colors.black,
                                                      //           fontSize: 14,
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: ApClrs.mainClr,
                );
        }),
      ],
    );
  }

  // Widget _buildPageItem(int index, ProductModel popularProducts) {
  //   // Matrix4 matrix = Matrix4.identity();
  //   // if (index == _currtPaveValue.floor()) {
  //   //   var currScale = 1 - (_currtPaveValue - index) * (1 - _scaleFactor);
  //   //   var currTrans = _height * (1 - currScale) / 2;
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //   //     ..setTranslationRaw(0, currTrans, 0);
  //   // } else if (index == _currtPaveValue.floor() + 1) {
  //   //   var currScale =
  //   //       _scaleFactor + (_currtPaveValue - index + 1) * (1 - _scaleFactor);
  //   //   var currTrans = _height * (1 - currScale) / 2;
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //   //     ..setTranslationRaw(0, currTrans, 0);
  //   // } else if (index == _currtPaveValue.floor() - 1) {
  //   //   var currScale = 1 - (_currtPaveValue - index) * (1 - _scaleFactor);
  //   //   var currTrans = _height * (1 - currScale) / 2;
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //   //     ..setTranslationRaw(0, currTrans, 0);
  //   // } else {
  //   //   var currScale = 0.8;
  //   //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //   //     ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  //   // }

  //   // return Transform(
  //   //   transform: matrix,
  //   //   child: Stack(
  //   //     children: [
  //   //       GestureDetector(
  //   //         onTap: () {
  //   //           Get.toNamed(RouteHelper.getPopularFood(index, "home"));
  //   //         },
  //   //         child: Positioned(
  //   //           left: 0,
  //   //           right: 0,
  //   //           child: Container(
  //   //             height: Dimen.pageViewCont,
  //   //             margin:
  //   //                 EdgeInsets.only(left: Dimen.width10, right: Dimen.width10),
  //   //             decoration: BoxDecoration(
  //   //               borderRadius: BorderRadius.circular(Dimen.radius30),
  //   //               color: index.isEven ? Colors.blueGrey : Color(0xff9294cc),
  //   //               image: DecorationImage(
  //   //                 fit: BoxFit.cover,
  //   //                 image: NetworkImage(AppConstants.BASE_URL +
  //   //                     AppConstants.UPLOAD_URL +
  //   //                     popularProducts.img!),
  //   //               ),
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ),
  //   //       Align(
  //   //         alignment: Alignment.bottomCenter,
  //   //         child: Container(
  //   //           height: Dimen.pageViewtxtCont120,
  //   //           margin: EdgeInsets.only(
  //   //             left: Dimen.width30,
  //   //             right: Dimen.width30,
  //   //             bottom: Dimen.height30,
  //   //           ),
  //   //           decoration: BoxDecoration(
  //   //               borderRadius: BorderRadius.circular(Dimen.radius20),
  //   //               color: Colors.white,
  //   //               boxShadow: [
  //   //                 BoxShadow(
  //   //                   color: ApClrs.yllowClr,
  //   //                   blurRadius: 5.0,
  //   //                   offset: Offset(0, 5),
  //   //                 ),
  //   //                 BoxShadow(
  //   //                   color: Colors.white,
  //   //                   offset: Offset(-5, 0),
  //   //                 ),
  //   //                 BoxShadow(
  //   //                   color: Colors.white,
  //   //                   offset: Offset(5, 0),
  //   //                 ),
  //   //               ]),
  //   //           child: Container(
  //   //             padding: EdgeInsets.only(
  //   //                 top: Dimen.width15,
  //   //                 left: Dimen.width15,
  //   //                 right: Dimen.width15),
  //   //             child: AppColumn(
  //   //               text: popularProducts.name!,
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ),
  //   //     ],
  //   //   ),
  //   // );
  // }
}
