// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mystore/controllers/cart_controller.dart';
// import 'package:mystore/controllers/popular_product_controller.dart';
// import 'package:mystore/controllers/recommended_product_controller.dart';
// import 'package:mystore/routes/routes_helper.dart';
// import 'package:mystore/utils/dimension.dart';
// import 'package:mystore/widget/colors.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   Future<void> _loadResources() async {
//     Get.find<CartController>().getCartData();
//     await Get.find<PopularProductController>().getPopulaProductList();
//     await Get.find<RecommendedProductController>().getRecommendedProductList();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadResources();
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 3))
//           ..forward();

//     animation = CurvedAnimation(parent: controller, curve: Curves.linear);
//     Timer(const Duration(seconds: 2),
//         () => Get.offNamed(RouteHelper.getInitial()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ScaleTransition(
//             scale: animation,
//             child: Container(
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//               child: Center(
//                 child: Image.asset(
//                   "assets/image/a.jpg",
//                   width: Dimen.SplashImg,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: Dimen.height15,
//           ),
//           Text(
//             "Welcome to Nvida Store",
//             style: TextStyle(
//                 color: ApClrs.mainClr,
//                 fontSize: Dimen.height20,
//                 fontWeight: FontWeight.bold),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
