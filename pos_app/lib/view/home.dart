// import 'package:flutter/material.dart';
// import 'package:pos_app/controller/cart_controller.dart';
// import 'package:pos_app/controller/shopping_controller.dart';
// import 'package:pos_app/model/product.dart';
// import 'package:pos_app/view/print.dart';
// import 'package:get/get.dart';

// class Home extends StatelessWidget {
//   var products = <Product>[].obs;
//   final shoppingController = Get.put(ShoppingController());
//   final cartController = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     int _total = 0;

//     for (var i = 0; i < products.length; i++) {
//       _total = products[i].price as int;
//     }

//     return Scaffold(
//       backgroundColor: Colors.teal.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Print Bill'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             GetX<ShoppingController>(builder: (controller) {
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: controller.products.length,
//                   itemBuilder: (c, i) {
//                     return ListTile(
//                       title: Text(products[i].productName),
//                       subtitle:
//                           Text('${products[i].price} x ${products[i].qty}'),
//                       trailing: Text('\$${products[i].price}'),
//                     );
//                   },
//                 ),
//               );
//             }),
//             Container(
//               color: Colors.teal.shade100,
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         'Total:-',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       GetX<CartController>(builder: (controller) {
//                         return Text(
//                           '\$${controller.subtotal}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         );
//                       })
//                     ],
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                     child: FlatButton(
//                       color: Colors.green,
//                       textColor: Colors.white,
//                       child: Text('Print'),
//                       onPressed: () {
//                         // print(products);
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => Print(products)));
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
